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
import ubtms.module.user.entity.UserQuery;
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
    public String mainPage(HttpServletRequest request, Model model) {
        String basePath = "/resources/images/common";
        String urlFilePathName = request.getSession().getServletContext().getRealPath(basePath);
        InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
        FileUtil.putPicToTomcat(picurlProperties, urlFilePathName);
        return "/mainPage";
    }

    @RequestMapping("/userMngPage")
    public String schoolMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "人员管理");
        request.getSession().setAttribute("userAddP", perssions[1]);
        request.getSession().setAttribute("userDelP", perssions[2]);
        request.getSession().setAttribute("userEditP", perssions[3]);
        request.getSession().setAttribute("userDetailP", perssions[4]);
        return "/user/userMng";
    }


    @RequestMapping("/userAddAndEditPage")
    public String userAddPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        model.addAttribute("opType", opType);
        if (!opType.equals("2")) {
            String userId = request.getParameter("userId");
            User user = userService.selectOne(new User(Integer.valueOf(userId)));
            if (user.getHeadPic() != null && !user.getHeadPic().isEmpty()) {
                //获取服务器url物理路径
                String basePath = "/resources/images/common";
                String urlFilePathName = request.getSession().getServletContext().getRealPath(basePath);
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                FileUtil.putPicToTomcat(user.getHeadPic(), picurlProperties, urlFilePathName);
            }

            Role role = roleService.selectByPrimaryKeyNoRelative(user.getRoleId());
            model.addAttribute("userDetail", user);
            model.addAttribute("userSchool", schoolService.selectOne(role.getSchoolId()).getSchName());
            int userType = 0;
            switch (role.getRoleName()) {
                case "球员":
                    userType = 1;
                    break;
                case "教练":
                    userType = 2;
                    break;
                case "领队":
                    userType = 3;
                    break;
            }
            model.addAttribute("userType", userType);
        }
        return "user/userAddAndEdit";
    }


    @RequestMapping("/userAddAction")
    @ResponseBody
    public Map<String, Object> userSave(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String picName = "";
            if (request.getParameter("pic") != null) {
                MultipartFile file = (MultipartFile) request.getSession().getAttribute("userImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                picName = FileUtil.saveFile(file, picurlProperties);
            }
            String sex = request.getParameter("sex");
            String userType = request.getParameter("userType");
            String userName = request.getParameter("name");
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
            map.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常");
        }
        return map;
    }

    @RequestMapping("/userEditAction")
    @ResponseBody
    public Map<String, Object> userEdit(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String picName = null;
            if (request.getParameter("pic") != null) {
                MultipartFile file = (MultipartFile) request.getSession().getAttribute("userImg");
                InputStream picurlProperties = getClass().getResourceAsStream(CommonConstant.PICPATH);
                picName = FileUtil.saveFile(file, picurlProperties);
            }
            String userId = request.getParameter("id");
            String sex = request.getParameter("sex");
            String userName = request.getParameter("name");
            String grade = request.getParameter("grade");
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");
            String shirtNum = request.getParameter("shirtNum");
            String duty = request.getParameter("duty");
            userService.updateUser(userId, picName, sex, userName, grade, height, weight, shirtNum, duty);
            map.put("success", true);
            map.put("msg", "修改成功");
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
    public MngResult<List<UserDto>> getSchools(int limit, int offset, String userName, String schoolName, String state, String role) {
        UserQuery userQuery = new UserQuery();
        if (!userName.isEmpty()) {
            userQuery.setRealName(userName);
        }
        if (!schoolName.isEmpty()) {
            userQuery.setSchName(schoolName);
        }
        if (!state.equals("-1")) {
            userQuery.setState(new Byte(state));
        }
        if (!role.equals("-1")) {
            userQuery.setRoleName(role);
        }
        userQuery.setLimit(limit);
        userQuery.setOffset(offset);
        List<UserDto> userDtos = userService.selectByUserQueryMng(userQuery);
        int total = userService.countUserMng(userQuery);
        MngResult<List<UserDto>> result = new MngResult<List<UserDto>>(true, userDtos, total);
        return result;
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

    @RequestMapping(value = "/userDelAction", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> userDel(@RequestBody List<User> users) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.delUser(users);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            map.put("success", false);
            map.put("msg", "删除失败：系统异常");
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping(value = "/loginValidation")
    @ResponseBody
    public Map<String, Object> userAccountValidate(@RequestBody User user, HttpServletRequest request) {
        Map<String, Object> map = userService.userLoginValidate(user);
        boolean success = (boolean) map.get("success");
        if (success) {
            user = userService.selectOne(user);
            Role role = roleService.selectByPrimaryKey(user.getRoleId());
            request.getSession().setAttribute("loginUser", user.getPhone());
            request.getSession().setAttribute("loginUserName", user.getRealName());
            request.getSession().setAttribute("loginUserId", user.getId());
            request.getSession().setAttribute("loginSchool", schoolService.selectOne(role.getSchoolId()));
            request.getSession().setAttribute("menus", role.getMenus());
        }
        return map;
    }

    @RequestMapping("/pswUpdatePage")
    public String updatePswPage() {
        return "user/userEditPsw";
    }

    @RequestMapping("/updatePswAction")
    @ResponseBody
    public Map<String, Object> updatePsw(@RequestBody String[] str) {
        Map<String, Object> map = new HashMap<String, Object>();
        String id = str[0];
        String oldPsw = str[1];
        String newPsw = str[2];
        map = userService.updatePsw(id, oldPsw, newPsw);
        return map;
    }
}
