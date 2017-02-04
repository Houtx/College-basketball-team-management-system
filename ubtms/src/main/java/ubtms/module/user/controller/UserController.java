package ubtms.module.user.controller;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.util.FileUtil;
import ubtms.basic.util.ImgUtil;
import ubtms.module.role.entity.Role;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
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
        User user1 = new User("admin","123456");
        User user2 = user1=userService.select(user1);
        if (user2!=null){
            Role role = roleService.selectByPrimaryKey(user2.getRoleId());
            model.addAttribute("menus", role.getMenus());
            return "/mainPage";
        }else {
            return "/login";
        }
    }
    
    @RequestMapping("/userAddPage")
    public String userAddPage() {

        return "/user/userAdd";
    }

    @ResponseBody
    @RequestMapping("/imgUpload")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response, MultipartFile image_file) {
        String img = "";
        String imgSuffix = "";
        MultipartFile file = null;
        Map<String,Object> map = new HashMap<String,Object>();
        //检测图片大小 < 1M
        if (file.getSize() > 1024 * 1024) {
            //Todo
        }

        try {
            byte[] s = file.getBytes();
            img = Base64.encodeBase64String(s);
            imgSuffix = FileUtil.getFileSuffix(file.getOriginalFilename());


            request.getSession().setAttribute("headImg",img);
            request.getSession().setAttribute("headImgSuffix",imgSuffix);

            //获取图片宽高
            InputStream is = file.getInputStream();
            BufferedImage buffImg = ImageIO.read(is);


            String imgParm = ImgUtil.getImgParam(buffImg.getWidth(),buffImg.getHeight(),260,260);
            request.getSession().setAttribute("imgParm",imgParm);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }



}
