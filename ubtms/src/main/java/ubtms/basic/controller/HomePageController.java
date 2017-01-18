package ubtms.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by jinzhany on 2016/12/17.
 */
@Controller
@RequestMapping("/homePage")
public class HomePageController {
//    @Autowired
//    private UserService userService;
//    @Autowired
//    private User user;
//    @Autowired
//    private RoleService roleService;
//    @Autowired
//    private Role role;
//    @Autowired
//    private SchoolService schoolService;
//    @Autowired
//    private School school;
//
//    @RequestMapping("/mainPage")
//    public String mainPage(HttpServletRequest request){
//        String account = request.getParameter("account");
//        String password = request.getParameter("password");
//        user.setPhone(account);
//        user.setPassword(password);
//
//        return "/mainPage";
//    }
}
