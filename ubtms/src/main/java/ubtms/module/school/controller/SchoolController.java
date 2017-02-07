package ubtms.module.school.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.dto.MngResult;
import ubtms.basic.entity.LimitObjet;

import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/school")
public class SchoolController {
    @Autowired
    SchoolService schoolService;

    @RequestMapping("/schoolMngPage")
    public String schoolMngPage(HttpServletRequest request){
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

    @RequestMapping("/schoolAddPage")
    public String schoolAddPage() {
        return "/school/schoolAdd";
    }

    @RequestMapping("/schoolViewAndEditAction")
    public String viewAndEditSchool(HttpServletRequest request){
        String type = request.getParameter("type");
        String schId = request.getParameter("schId");
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
    public String addSchool(HttpServletRequest request, HttpServletResponse response){
        MultipartFile file= (MultipartFile) request.getSession().getAttribute("img");
        String schoolName = request.getParameter("schoolName").toString();

        // 获取图片的文件名
        String fileName = file.getOriginalFilename();
        // 获取图片的扩展名
        String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 新的图片文件名 = 获取时间戳+"."图片扩展名
        String newFileName = String.valueOf(System.currentTimeMillis()) + "." + extensionName;
        saveFile(newFileName, file);
        return "school/schoolAdd";
    }

    private void saveFile(String newFileName, MultipartFile filedata) {
        // TODO Auto-generated method stub
        // 根据配置文件获取服务器图片存放路径
        String picDir = "";
        try {
            Properties props = new Properties();

            InputStream in = getClass().getResourceAsStream("/picurl.properties");
            props.load(in);
            in.close();

            // 读取特定属性
            picDir = props.getProperty("savePicUrl");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String saveFilePath = picDir;

        /* 构建文件目录 */
        File fileDir = new File(saveFilePath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }

        try {
            FileOutputStream out = new FileOutputStream(saveFilePath + "\\" + newFileName);
            // 写入文件
            out.write(filedata.getBytes());
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("upload success");
    }

    @RequestMapping("/imgUpload")
    public void uploadImg(HttpServletRequest request,@RequestParam("file") MultipartFile file) {
        request.getSession().setAttribute("img",file);
    }

}
