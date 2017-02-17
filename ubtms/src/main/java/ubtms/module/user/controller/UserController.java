package ubtms.module.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.dto.MngResult;
import ubtms.basic.entity.LimitObjet;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Role;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserExample;
import ubtms.module.user.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
//    @Autowired
//    private User user;
    @Autowired
    private RoleService roleService;
//    @Autowired
//    private Role role;
    @Autowired
    private SchoolService schoolService;
//    @Autowired
//    private School school;

    @RequestMapping("/mainPage")
    public String mainPage(HttpServletRequest request, Model model){

//        String account = request.getParameter("account");
//        String password = request.getParameter("password");
        User user = new User("admin","123456");
        user=userService.select(user);
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
    
    
    @RequestMapping("/userAddPage")
    public String userAddPage() {
        return "user/userAddAndEdit";
    }

    @ResponseBody
    @RequestMapping("/imgUpload")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response, MultipartFile image_file) {

    }

    @RequestMapping("/userGetAction")
    @ResponseBody
    public MngResult<List<User>> getSchools(int limit, int offset,String userName,String schoolName,HttpServletRequest request) {
        UserExample userExample = new UserExample();
        userExample.setLimit(limit);
        userExample.setOffset(offset);
        int total;
        List<User> users = new ArrayList<User>();
        try {
            request.setCharacterEncoding("utf-8");
//            schoolName = new String(schoolName.getBytes("ISO-8859-1"), "UTF-8");
//            userName = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
//            roleName = new String(roleName.getBytes("ISO-8859-1"), "UTF-8");
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
}
