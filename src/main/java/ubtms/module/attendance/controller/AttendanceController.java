package ubtms.module.attendance.controller;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.FileUtil;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.attendance.dto.AttendanceDto;
import ubtms.module.attendance.entity.Attendance;
import ubtms.module.attendance.entity.AttendanceQuery;
import ubtms.module.attendance.service.AttendanceService;
import ubtms.module.role.entity.Menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/attendance")
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping("/attendanceDetailPage")
    public String attendanceDetailPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        //1编辑 2添加
        if (!opType.equals("2")) {
            Integer id = Integer.valueOf(request.getParameter("attendanceId"));
            AttendanceDto attendanceDto = attendanceService.getAttendanceById(id);
            model.addAttribute("attendanceDetail", attendanceDto);
        }
        model.addAttribute("opType", opType);
        return "attendance/attendanceDetail";
    }

    @RequestMapping("/attendanceMngPage")
    public String getAttendanceMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "考勤管理");
        request.getSession().setAttribute("attendanceAddP", perssions[1]);
        request.getSession().setAttribute("attendanceDelP", perssions[2]);
        request.getSession().setAttribute("attendanceEditP", perssions[3]);
        request.getSession().setAttribute("attendanceDetailP", perssions[4]);
        return "/attendance/attendanceMng";
    }

    @RequestMapping("/attendanceEditAction")
    @ResponseBody
    public Map<String, Object> editAttendance(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String attendanceId = request.getParameter("attendanceId");
        String schoolName = request.getParameter("schoolName");
        String aDate = request.getParameter("aDate");
        String stuName = request.getParameter("stuName");
        String attendance = request.getParameter("attendance");
        String reason = request.getParameter("reason");
        int res = attendanceService.updateAttendance(Integer.valueOf(attendanceId), schoolName, aDate, stuName, attendance, reason);
        if (res == 0) {
            map.put("success", false);
            map.put("msg", "该学生未注册");
        } else {
            map.put("success", true);
            map.put("msg", "修改成功");
        }
        return map;
    }

    @RequestMapping("/attendanceAddAction")
    @ResponseBody
    public Map<String, Object> addAttendance(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String schoolName = request.getParameter("schoolName");
        String aDate = request.getParameter("aDate");
        String stuName = request.getParameter("stuName");
        String attendance = request.getParameter("attendance");
        String reason = request.getParameter("reason");
        int res = attendanceService.saveAttendance(schoolName, aDate, stuName, attendance, reason);
        if (res == 0) {
            map.put("success", false);
            map.put("msg", "该学生未注册");
        } else {
            map.put("success", true);
            map.put("msg", "添加成功");
        }
        return map;
    }


    @RequestMapping("/attendanceDelAction")
    @ResponseBody
    public Map<String, Object> delAttendance(@RequestBody List<Attendance> attendances) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            attendanceService.delAttendances(attendances);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败：系统异常");
        }
        return map;
    }

    @RequestMapping("/attenDanceGetAction")
    @ResponseBody
    public MngResult<List<AttendanceDto>> getTrainings(int limit, int offset, String searchSchoolName, String searchStuName, StringBuilder searchTime, String searchState) {
        AttendanceQuery attendanceQuery = new AttendanceQuery();
        attendanceQuery.setLimit(limit);
        attendanceQuery.setOffset(offset);
        if (!searchSchoolName.isEmpty()) {
            attendanceQuery.setSchoolName(searchSchoolName);
        }
        if (!searchStuName.isEmpty()) {
            attendanceQuery.setStuName(searchStuName);
        }
        if (!searchState.equals("-1")) {
            if (searchState.equals("-2")) {
                attendanceQuery.setAttend((byte) 1);
            } else {
                attendanceQuery.setAbsenceType(new Byte(searchState));
            }
        }
        if (searchTime.length() != 0) {
            searchTime.append("-01");
            String strDate = searchTime.toString();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date date = sdf.parse(strDate);
                attendanceQuery.setDate(date);
                String endDate;
                int year = Integer.valueOf(strDate.substring(0, 4));
                int month = Integer.valueOf(strDate.substring(5, 7));
                if (month != 12) {
                    int newMonth = month + 1;
                    endDate = year + "-" + newMonth + "-01";
                } else {
                    int newYear = year + 1;
                    endDate = newYear + "-01-01";
                }
                attendanceQuery.setEndDate(sdf.parse(endDate));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        List<AttendanceDto> attendanceDtos = attendanceService.getAttendances(attendanceQuery);
        int total = attendanceService.countAttendances(attendanceQuery);
        MngResult<List<AttendanceDto>> list = new MngResult<List<AttendanceDto>>(true, attendanceDtos, total);
        return list;
    }

    @RequestMapping("/exportPage")
    public String exportPage() {
        return "attendance/export";
    }

    @RequestMapping("/exportAction")
    public String export(HttpServletRequest request, HttpServletResponse response) {
        String time = request.getParameter("time");
        String school = request.getParameter("school");
        XSSFWorkbook xssfWorkbook = attendanceService.exportExcel(school, new StringBuilder(time));
        ViewExcel viewExcel = new ViewExcel();
        try {
            viewExcel.buildExcelDocument(null, xssfWorkbook, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/downLoadModel")
    public void downLoadModel(HttpServletRequest request, HttpServletResponse response) {
        try {
            String basePath = "/resources/model/attendanceModel.xlsx";
            String urlFilePathName = request.getSession().getServletContext().getRealPath(basePath);
            FileUtil.download(response, request, urlFilePathName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/uploadFile")
    @ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile multipartFile,HttpServletResponse response) {
        String msg = "0";
        try {
            attendanceService.importExcel(multipartFile);
            msg = "1";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "<script>window.parent.uploadMsg('" + msg + "');</script>";
    }
}
