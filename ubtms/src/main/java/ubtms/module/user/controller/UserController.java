package ubtms.module.user.controller;

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
import ubtms.module.role.entity.Role;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserDto;
import ubtms.module.user.entity.UserExample;
import ubtms.module.user.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jinzhany on 2016/12/18.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/mainPage")
    public String mainPage(HttpServletRequest request, Model model){

//        String account = request.getParameter("account");
//        String password = request.getParameter("password");
        User user = new User("admin","123456");
        user=userService.selectOne(user);
        if (user!=null){
            Role role = roleService.selectByPrimaryKey(user.getRoleId());
            //model.addAttribute("menus", role.getMenus());
            request.getSession().setAttribute("loginUser", user.getPhone());
            request.getSession().setAttribute("loginSchool",schoolService.selectOne(role.getSchoolId()));
            request.getSession().setAttribute("menus",role.getMenus());
            return "/mainPage";
        }else {
            return "/login";
        }
    }

    @RequestMapping("/userMngPage")
    public String schoolMngPage(HttpServletRequest request) {
        if (request.getSession().getAttribute("userAddP") == null) {
            List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
            int[] perssions = PermissionUtil.getPermission(menus, "人员管理");
            request.getSession().setAttribute("userAddP", perssions[1]);
            request.getSession().setAttribute("userDelP", perssions[2]);
            request.getSession().setAttribute("userEditP", perssions[3]);
            request.getSession().setAttribute("userDetailP", perssions[4]);
        }
        return "/user/userMng";
    }
    
    
    @RequestMapping("/userAddAndEditPage")
    public String userAddPage(HttpServletRequest request,Model model) {
        String opType =  request.getParameter("opType");
        model.addAttribute("opType", opType);
        if (!opType.equals("2")) {
            String userId = request.getParameter("userId");
            //userService.selectWithRelative()
            User user = userService.selectOne(new User(Integer.valueOf(userId)));

            if (user.getHeadPic() != null && !user.getHeadPic().isEmpty()) {
                //获取服务器url物理路径
                String basePath = "/resources/images/common";
                String urlFilePathName = request.getSession().getServletContext().getRealPath(basePath);
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                FileUtil.putPicToTomcat(user.getHeadPic(), picurlProperties, urlFilePathName);
            }

            model.addAttribute("userDetail", user);
        }
        return "user/userAddAndEdit";
    }


    @RequestMapping("/userAddAction")
    @ResponseBody
    public Map<String, Object> userSave(HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String picName="";
            if (request.getParameter("pic") != null) {
                MultipartFile file = (MultipartFile) request.getSession().getAttribute("userImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                picName = FileUtil.saveFile(file, picurlProperties);
            }
            String sex= request.getParameter("sex");
            String userType= request.getParameter("userType");
            String userName= request.getParameter("name");
            String schoolName = request.getParameter("schoolName");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            String grade = request.getParameter("grade");
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");
            String shirtNum = request.getParameter("shirtNum");
            String duty = request.getParameter("duty");
            userService.saveUser(picName, sex, userType, userName, schoolName, account, password, grade, height, weight, shirtNum, duty);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常");
        }
        return map;
    }

    @RequestMapping("/imgUpload")
    public void uploadImg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        request.getSession().setAttribute("userImg", file);
    }

    @RequestMapping("/userGetAction")
    @ResponseBody
    public MngResult<List<User>> getSchools(int limit, int offset, String userName, String schoolName) {
        UserExample userExample = new UserExample();
        userExample.setLimit(limit);
        userExample.setOffset(offset);
        int total;
        List<User> users = new ArrayList<User>();
        try {
            schoolName = new String(schoolName.getBytes("ISO-8859-1"), "UTF-8");
            userName = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
            School school = schoolService.selectOne(new School(schoolName));
            if (!schoolName.isEmpty() && school==null) {
                return new MngResult<List<User>>(true, new ArrayList<User>(),0);
            }
            //学校存在，或者操作者选择了全部
            int schId=0;
            if (school != null) {//选择了一所学校
                schId=school.getSchId();
                Role role = new Role();
                role.setSchoolId(schId);
                User user = new User();
                user.setRole(role);
                if (!userName.isEmpty()) {//查询一个人
                    user.setRealName(userName);
                }
                LimitObjet<User> limitObjet = new LimitObjet<>(user,offset,limit);
                users = userService.selectWithRelative(limitObjet);
                total = userService.countWithRelative(user);
            }else{//操作者选择了全部学校
                if (userName.isEmpty()) {
                    users = userService.selectByExample(userExample);
                }else {
                    userExample.createCriteria().andRealNameEqualTo(userName);
                    users = userService.selectByExample(userExample);
                }
                userExample.setOffset(null);
                userExample.setLimit(null);
                total = userService.countByExample(userExample);
            }
            //List<User> Users = new ArrayList<User>();
            
//            for (User user:users){
//                User User = new User(user);
//                Users.add(User);
//            }
            
            MngResult<List<User>> result = new MngResult<List<User>>(true, users, total);
            return result;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }


    @RequestMapping(value = "/userStateChangeAction", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeUserState(@RequestBody List<User> users) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.updateByPrimaryKey(users);
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping(value = "/userValidateAction")
    @ResponseBody
    public boolean userAccountValidate(HttpServletRequest request) {
        try {
            String account = request.getParameter("account");
            if (userService.isUserAccountExist(account)){
                return false;
            }else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }





}
