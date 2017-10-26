package ubtms.module.training.controller;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.game.service.GameService;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.service.SchoolService;
import ubtms.module.training.dto.TrainingDto;
import ubtms.module.training.entity.Training;
import ubtms.module.training.entity.TrainingQuery;
import ubtms.module.training.service.TrainingService;
import ubtms.module.user.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by jinzhany on 2017/3/18.
 */
@Controller
@RequestMapping("/training")
public class TrainingController {
    @Autowired
    private TrainingService trainingService;

    @RequestMapping("/trainingMngPage")
    public String getTrainingMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "训练计划");
        request.getSession().setAttribute("trainingAddP", perssions[1]);
        request.getSession().setAttribute("trainingDelP", perssions[2]);
        request.getSession().setAttribute("trainingEditP", perssions[3]);
        request.getSession().setAttribute("trainingDetailP", perssions[4]);
        return "/training/trainingMng";
    }


    @RequestMapping("/trainingDetailGetAction")
    @ResponseBody
    public TrainingDto getTraining(HttpServletRequest request) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        TrainingDto training = trainingService.getTrainingById(id);
        return training;
    }

    @RequestMapping("/trainingExportExcelAction")
    public String exportExcel(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        TrainingDto training = trainingService.getTrainingById(id);
        XSSFWorkbook xssfWorkbook = trainingService.exportExcel(training);
        ViewExcel viewExcel = new ViewExcel();
        try {
            viewExcel.buildExcelDocument(xssfWorkbook,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/trainingAddAndEditPage")
    public String getOpPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        //0详情 1编辑 2添加
        if (!opType.equals("2")) {
            Integer id = Integer.valueOf(request.getParameter("id"));
            model.addAttribute("trainingId", id);
        }
        model.addAttribute("opType", opType);
        return "/training/trainingAddAndEdit";
    }

    @RequestMapping("/trainingDelAction")
    @ResponseBody
    public Map<String, Object> delTraining(@RequestBody List<Training> trainings) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            trainingService.delTraining(trainings);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败");
        }
        return map;
    }

    @RequestMapping("/trainingAddAction")
    @ResponseBody
    public Map<String, Object> addTraining(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            trainingService.saveTraining(request);
            map.put("success", true);
            map.put("msg", "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "添加失败:系统异常");
        }
        return map;
    }

    @RequestMapping("/trainingEditAction")
    @ResponseBody
    public Map<String, Object> editTraining(@RequestBody TrainingDto trainingDto) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            trainingService.updateTraining(trainingDto);
            map.put("success", true);
            map.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "修改成功:系统异常");
        }
        return map;
    }

    @RequestMapping("/trainingGetAction")
    @ResponseBody
    public MngResult<List<TrainingDto>> getTrainings(int limit, int offset, String searchSchoolName, String searchTitle) {
        TrainingQuery trainingQuery = new TrainingQuery();
        trainingQuery.setLimit(limit);
        trainingQuery.setOffset(offset);
        if (!searchSchoolName.isEmpty()) {
            trainingQuery.setSchName(searchSchoolName);
        }
        if (!searchTitle.isEmpty()) {
            trainingQuery.setTitle(searchTitle);
        }
        List<TrainingDto> trainingDtos = trainingService.getTrainingMng(trainingQuery);
        int total = trainingService.countTrainingMng(trainingQuery);
        MngResult<List<TrainingDto>> list = new MngResult<List<TrainingDto>>(true, trainingDtos, total);
        return list;
    }
}
