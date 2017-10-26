package ubtms.module.attendance.service.impl;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.util.DateUtil;
import ubtms.module.attendance.dao.AttendanceMapper;
import ubtms.module.attendance.dto.AttendanceDto;
import ubtms.module.attendance.entity.Attendance;
import ubtms.module.attendance.entity.AttendanceExample;
import ubtms.module.attendance.entity.AttendanceQuery;
import ubtms.module.attendance.service.AttendanceService;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserExample;
import ubtms.module.user.entity.UserQuery;
import ubtms.module.user.service.UserService;

import javax.validation.constraints.Null;
import java.io.*;
import java.lang.annotation.Native;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jinzhany on 2017/3/21.
 */
@Service
public class AttendanceServiceImpl implements AttendanceService {
    @Autowired
    AttendanceMapper attendanceMapper;
    @Autowired
    UserService userService;
    @Autowired
    SchoolService schoolService;
    @Autowired
    RoleService roleService;

    @Override
    public int delAttendances(List<Attendance> attendances) {
        for (Attendance attendance : attendances) {
            attendanceMapper.deleteByPrimaryKey(attendance.getId());
        }
        return attendances.size();
    }

    @Override
    public int updateAttendance(int id, String schoolName, String aDate, String stuName, String attendance, String reason) {
        List<User> userList = userService.selectBySchoolName(schoolName);
        boolean isStu = false;
        int stuId = 0;
        for (User user : userList) {
            if (user.getRealName().equals(stuName)) {
                stuId = user.getId();
                isStu = true;
                break;
            }
        }
        if (!isStu) {
            return 0;
        }

        Attendance attendanceM = new Attendance();
        attendanceM.setAttend(new Byte(attendance));
        attendanceM.setUserId(stuId);
        if (attendance.equals("0")) {
            attendanceM.setAbsenceType(new Byte(reason));
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(aDate);
            attendanceM.setDate(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;
        }
        attendanceM.setId(id);
        attendanceMapper.updateByPrimaryKey(attendanceM);
        return 1;
    }

    @Override
    public int saveAttendance(String schoolName, String aDate, String stuName, String attendance, String reason) {
        List<User> userList = userService.selectBySchoolName(schoolName);
        boolean isStu = false;
        int stuId = 0;
        for (User user : userList) {
            if (user.getRealName().equals(stuName)) {
                stuId = user.getId();
                isStu = true;
                break;
            }
        }
        if (!isStu) {
            return 0;
        }
        Date date;
        Attendance attendanceM = new Attendance();
        attendanceM.setAttend(new Byte(attendance));
        attendanceM.setUserId(stuId);
        if (attendance.equals("0")) {
            attendanceM.setAbsenceType(new Byte(reason));
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = sdf.parse(aDate);
            attendanceM.setDate(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;

        }

        AttendanceExample attendanceExample = new AttendanceExample();
        attendanceExample.createCriteria().andUserIdEqualTo(stuId).andDateEqualTo(date);
        List<Attendance> attendances = attendanceMapper.selectByExample(attendanceExample);
        if (attendances.size() > 0) {
            Attendance attendanceTemp = attendances.get(0);
            attendanceM.setId(attendanceTemp.getId());
            attendanceMapper.updateByPrimaryKey(attendanceM);
        } else {
            attendanceMapper.insert(attendanceM);
        }
        return 1;
    }

    @Override
    public List<AttendanceDto> getAttendances(AttendanceQuery attendanceQuery) {
        return attendanceMapper.selectByMngQuery(attendanceQuery);
    }

    @Override
    public int countAttendances(AttendanceQuery attendanceQuery) {
        return attendanceMapper.countByMngQuery(attendanceQuery);
    }

    @Override
    public AttendanceDto getAttendanceById(Integer id) {
        AttendanceDto attendance = attendanceMapper.selectByPrimaryKey(id);
        return attendance;
    }

    @Override
    public XSSFWorkbook exportExcel(String schoolName, StringBuilder startDate) {
        try {
            String showString = startDate.toString();
            AttendanceQuery attendanceQuery = new AttendanceQuery();
            startDate.append("-01");
            String strDate = startDate.toString();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(strDate);
            attendanceQuery.setDate(date);
            String endDateStr;
            int year = Integer.valueOf(strDate.substring(0, 4));
            int month = Integer.valueOf(strDate.substring(5, 7));
            if (month != 12) {
                int newMonth = month + 1;
                endDateStr = year + "-" + newMonth + "-01";
            } else {
                int newYear = year + 1;
                endDateStr = newYear + "-01-01";
            }
            Date endDate = sdf.parse(endDateStr);
            List<User> userList = userService.selectBySchoolName(schoolName);
            //创建excel工作簿
            XSSFWorkbook wb = new XSSFWorkbook();
            //创建第一个sheet（页），命名为 new sheet
            Sheet sheet = wb.createSheet("attendance");
            Row firstRow = sheet.createRow(0);
            firstRow.createCell(0).setCellValue(schoolName);
            firstRow.createCell(2).setCellValue("✓");
            firstRow.createCell(3).setCellValue("出勤");
            firstRow.createCell(4).setCellValue("✚");
            firstRow.createCell(5).setCellValue("病假");
            Row secondRow = sheet.createRow(1);
            secondRow.createCell(0).setCellValue(showString);
            secondRow.createCell(2).setCellValue("✗");
            secondRow.createCell(3).setCellValue("无故缺勤");
            secondRow.createCell(4).setCellValue("□");
            secondRow.createCell(5).setCellValue("事假");
            Row dayRow = sheet.createRow(3);

            int maxDay = DateUtil.getDaysByYearMonth(showString);

            for (int i = 1; i <= maxDay; i++) {
                dayRow.createCell(i).setCellValue(i);
            }
            for (int u = 0, r = 4; u < userList.size(); u++) {
                User user = userList.get(u);
                String roleName = roleService.selectByPrimaryKeyNoRelative(user.getRoleId()).getRoleName();
                if (!roleName.equals("球员")) {
                    continue;
                }
                AttendanceQuery attendanceQ = new AttendanceQuery();
                attendanceQ.setUserId(user.getId());
                attendanceQ.setDate(date);
                attendanceQ.setEndDate(endDate);
                Row personRow = sheet.createRow(r);
                personRow.createCell(0).setCellValue(user.getRealName());
                List<AttendanceDto> attendances = attendanceMapper.selectByMngQuery(attendanceQ);
                for (Attendance attendance : attendances) {
                    Date tempDate = attendance.getDate();
                    int dayOfMonth = Integer.parseInt(sdf.format(tempDate).substring(8, 10));
                    String text = "";
                    if (attendance.getAttend() == 1) {
                        text = "✓";
                    } else {
                        switch (attendance.getAbsenceType()) {
                            case 0:
                                text = "✗";
                                break;
                            case 1:
                                text = "✚";
                                break;
                            case 2:
                                text = "□";
                                break;
                        }
                    }
                    personRow.createCell(dayOfMonth).setCellValue(text);
                }
                r++;
            }
            return wb;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void importExcel(MultipartFile multipartFile) throws Exception {
        ByteArrayInputStream bis = new ByteArrayInputStream(multipartFile.getBytes());
        XSSFWorkbook wb = new XSSFWorkbook(bis);
        XSSFSheet sheet = wb.getSheetAt(0);
        String schoolName = String.valueOf(sheet.getRow(0).getCell(0));
        School school = schoolService.selectOne(new School(schoolName));
        if (school == null) {
            throw new Exception("学校未注册");
        }
        String dateStr = String.valueOf(sheet.getRow(1).getCell(0));
        String yearStr = dateStr.substring(dateStr.length() - 4, dateStr.length());
        String monthStr = "";
        if (dateStr.length() == 11) {
            monthStr = dateStr.substring(3, 5);
        } else {
            monthStr = dateStr.substring(3, 4);
        }
        switch (monthStr) {
            case "一":
                monthStr = "01";
                break;
            case "二":
                monthStr = "02";
                break;
            case "三":
                monthStr = "03";
                break;
            case "四":
                monthStr = "04";
                break;
            case "五":
                monthStr = "05";
                break;
            case "六":
                monthStr = "06";
                break;
            case "七":
                monthStr = "07";
                break;
            case "八":
                monthStr = "08";
                break;
            case "九":
                monthStr = "09";
                break;
            case "十":
                monthStr = "10";
                break;
            case "十一":
                monthStr = "11";
                break;
            case "十二":
                monthStr = "12";
                break;
        }


        int maxDay = DateUtil.getDaysByYearMonth(dateStr);

        int rowCount = 0;
        for (Row row : sheet) {
            rowCount++;
        }
        if (rowCount < 5)
            return;

        User[] users = new User[50];
        for (int i = 4; i < rowCount; i++) {
            Row row = sheet.getRow(i);
            String stuName = String.valueOf(row.getCell(0));
            UserQuery userQuery = new UserQuery();
            userQuery.setSchName(schoolName);
            userQuery.setRealName(stuName);
            List<User> tempUserList = userService.selectByUserQuery(userQuery);
            if (tempUserList.size() == 0) {
                throw new Exception(stuName + "不存在");
            }
            users[i] = tempUserList.get(0);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 1; i <= maxDay; i++) {
            String tempDateStr = dateStr + "-" + i;
            Date tempDate = sdf.parse(tempDateStr);
            for (int j = 4; j < rowCount; j++) {
                Row row = sheet.getRow(j);
                if (row == null) {
                    continue;
                }
                Cell tempCell = row.getCell(i);
                if (tempCell == null) {
                    continue;
                }
                String img = String.valueOf(tempCell);
                if (img == null || img.isEmpty()) {
                    continue;
                }
                Byte attend = null;
                Byte absenceType = null;
                switch (img) {
                    case "✓":
                        attend = 1;
                        break;
                    case "✗":
                        attend = 0;
                        absenceType = 0;
                        break;
                    case "✚":
                        attend = 0;
                        absenceType = 1;
                        break;
                    case "□":
                        attend = 0;
                        absenceType = 2;
                        break;
                }
                if (attend == null && absenceType == null) {
                    continue;
                }
                Attendance attendance = new Attendance();
                attendance.setUserId(users[j].getId());
                attendance.setAttend(attend);
                attendance.setAbsenceType(absenceType);
                attendance.setDate(tempDate);
                attendanceMapper.insert(attendance);
            }
        }
    }
}
