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
import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;
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
//    @Autowired
//    private School school;

    @RequestMapping("/schoolMngPage")
    public String schoolMngPage(HttpServletRequest request,Model model){
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        for (int i=0;i<menus.size();i++) {
            Menu menu = menus.get(i);
            List<SubMenu> subMenus = menu.getSubMenus();
            for (int j=0;j < subMenus.size();j++) {
                SubMenu subMenu = subMenus.get(j);
                if(subMenu.getName().equals("学校管理")){
                    List<Permission> permissions = subMenu.getPermissions();
                    for (int k=0;k < permissions.size();k++) {
                        Permission permission = permissions.get(k);
                        switch (permission.getType()) {
                            case 1:
                                request.getSession().setAttribute("schoolAdd",permission.getState());
                                break;
                            case 2:
                                request.getSession().setAttribute("schoolDel",permission.getState());
                                break;
                            case 3:
                                request.getSession().setAttribute("schoolEdit",permission.getState());
                                break;
                            case 4:
                                request.getSession().setAttribute("schoolDetail",permission.getState());
                                break;
                            case 5:
                                request.getSession().setAttribute("schoolDisable",permission.getState());
                                break;
                        }
                    }
                }
            }
        }
        return "/school/schoolMng";
    }

    @RequestMapping("/schoolGetAction")
    @ResponseBody
    public MngResult<List<School>> getSchools(int limit, int offset){
        LimitObjet<School> limitObjet = new LimitObjet<School>(new School(),offset,limit);
        List<School> schools = schoolService.selectWithLimit(limitObjet);
        MngResult<List<School>> result = new MngResult<List<School>>(true, schools,schoolService.getSchoolNum());
        return result;
    }

    @ResponseBody
    @RequestMapping("/schoolValidateAction")
    public boolean validateSchool(HttpServletRequest request) {
        try {
            String school = request.getParameter("schoolName");
            school = new String(school.getBytes("ISO-8859-1"), "UTF-8");
            boolean res = schoolService.validateSchool(school);
            return res;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/schoolAddPage")
    public String schoolAddPage() {
        return "/school/schoolAdd";
    }

    @RequestMapping("/schoolViewAndEditAction")
    public String viewAndEditSchool(HttpServletRequest request){
        String schoolName = request.getParameter("parma");
       // schoolService.
        return null;
    }

    @RequestMapping(value = "/schoolDelAction",method =RequestMethod.POST)
    @ResponseBody
    public String delSchool(@RequestBody List<School> schools){

        return null;
    }

    @RequestMapping(value = "/schoolDisableAction",method =RequestMethod.POST)
    @ResponseBody
    public Map<String, Object>  disableSchool(@RequestBody List<School> schools){
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

    @RequestMapping("/schoolAddAction")
    @ResponseBody
    public Map<String, Object>  addSchool(HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        String schoolName = request.getParameter("parma").toString();
        String introduction = request.getParameter("introduction").toString();
        try {
            School school = new School();
            if (request.getParameter("pic") != null) {
                MultipartFile file= (MultipartFile) request.getSession().getAttribute("schoolImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICSAVEPATH);
                String fileName = FileUtil.saveFile(file, picurlProperties);
                school.setSchLogo(fileName);
            }
            school.setSchName(schoolName);
            school.setIntroduction(introduction);
            schoolService.svaeSchool(school);
            map.put("success", true);
        }catch (Exception e){
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/imgUpload")
    public void uploadImg(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
        request.getSession().setAttribute("schoolImg",file);
    }

}
