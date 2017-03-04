package ubtms.module.school.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.dto.MngResult;
import ubtms.basic.entity.LimitObjet;

import ubtms.basic.enums.CommonConstant;
import ubtms.basic.util.FileUtil;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;


import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/school")
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/schoolMngPage")
    public String schoolMngPage(HttpServletRequest request) {
        //session是否已经设置过
        if (request.getSession().getAttribute("schoolAddP") == null) {
            List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
            int[] perssions = PermissionUtil.getPermission(menus, "学校管理");
            request.getSession().setAttribute("schoolAddP", perssions[1]);
            request.getSession().setAttribute("schoolDelP", perssions[2]);
            request.getSession().setAttribute("schoolEditP", perssions[3]);
            request.getSession().setAttribute("schoolDetailP", perssions[4]);
        }
        return "/school/schoolMng";
    }

    @RequestMapping("/schoolGetAction")
    @ResponseBody
    public MngResult<List<School>> getSchools(int limit, int offset, String schoolName, String state) {
        School school = new School();
        try {
            if (schoolName != null && !schoolName.equals("")) {
                school.setSchName(schoolName);
            }
            if (!state.equals("2")) {
                school.setState(Short.valueOf(state));
            }
            LimitObjet<School> limitObjet = new LimitObjet<School>(school, offset, limit);
            List<School> schools = schoolService.selectWithLimit(limitObjet);
            MngResult<List<School>> result = new MngResult<List<School>>(true, schools, schoolService.getSchoolNum(school));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @ResponseBody
    @RequestMapping("/schoolValidateAction1")
    public boolean validateSchool1(HttpServletRequest request) {
        try {
            String school = request.getParameter("schoolName");
            if (schoolService.isSchoolExist(school)){
                return false;
            }else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @ResponseBody
    @RequestMapping("/schoolValidateAction2")
    public boolean validateSchool2(HttpServletRequest request) {
        try {
            String school = request.getParameter("schoolName");
            if (schoolService.isSchoolExist(school)){
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/schoolAddPage")
    public String schoolAddPage() {
        return "school/schoolAddAndEdit";
    }

    @RequestMapping("/schoolViewAndEditAction")
    public String viewAndEditSchool(HttpServletRequest request, Model model) {
        int schId = Integer.valueOf(request.getParameter("schId"));
        School school = schoolService.selectOne(schId);
        school.getSchLogo();
        String schoolLogoName = school.getSchLogo();
        if (schoolLogoName != null) {
            //获取服务器url物理路径
            String basePath = "/resources/images/common";
            String urlFilePathName = request.getSession().getServletContext().getRealPath(basePath);

            InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
            FileUtil.putPicToTomcat(school.getSchLogo(), picurlProperties, urlFilePathName);
        }
        model.addAttribute("schoolDetail", school);
        model.addAttribute("type", request.getParameter("type"));

        return "school/schoolAddAndEdit";
    }

    @RequestMapping(value = "/schoolDelAction", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delSchool(@RequestBody List<School> schools) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            schoolService.deleteSchool(schools);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败:选择学校已被引用");
        }
        return map;
    }

    @RequestMapping(value = "/schoolStateChangeAction", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeSchoolState(@RequestBody List<School> schools) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            schoolService.updateSchoolById(schools);
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/schoolEditAction")
    @ResponseBody
    public Map<String, Object> editSchool(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Integer schId = Integer.valueOf(request.getParameter("schId").toString());
            String introduction = request.getParameter("introduction").toString();
            School school = new School(schId);
            school.setIntroduction(introduction);
            if (request.getParameter("pic") != null) {
                MultipartFile file = (MultipartFile) request.getSession().getAttribute("schoolImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                String fileName = FileUtil.saveFile(file, picurlProperties);
                school.setSchLogo(fileName);
            }
            schoolService.updateSchoolById(school);
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping("/schoolAddAction")
    @ResponseBody
    public Map<String, Object> addSchool(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String schoolName = request.getParameter("schoolName").toString();
            String introduction = request.getParameter("introduction").toString();
            School school = new School();
            if (request.getParameter("pic") != null) {
                MultipartFile file = (MultipartFile) request.getSession().getAttribute("schoolImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                String fileName = FileUtil.saveFile(file, picurlProperties);
                school.setSchLogo(fileName);
            }
            school.setSchName(schoolName);
            school.setIntroduction(introduction);
            schoolService.svaeSchool(school);
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/imgUpload")
    public void uploadImg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        request.getSession().setAttribute("schoolImg", file);
    }

    @ResponseBody
    @RequestMapping("/querySchoolAction")
    public List<String>  querySchoolByName(HttpServletRequest request) {
        try {
            String schName = request.getParameter("query");
            List<String> schNames = schoolService.selectSchNameFuzzy(schName);
            return schNames;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
