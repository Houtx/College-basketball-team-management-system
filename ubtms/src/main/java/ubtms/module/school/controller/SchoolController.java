package ubtms.module.school.controller;

import org.apache.commons.codec.binary.Base64;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.util.FileUtil;
import ubtms.basic.util.ImgUtil;
import ubtms.module.school.service.SchoolService;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
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

    @RequestMapping("/addSchoolPage")
    public String addSchoolPage(){
        return "school/schoolAdd";
    }

    @RequestMapping("/addSchool")
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
            //String key = "ip";
            picDir = props.getProperty("savePicUrl");

            //这里封装了读取配置文件的方法 配置文件中有图片的存放地址和获取地址
//            Properties properties = PropertiesUtil
//                    .getProperties("configure/driverpicurl.properties");
            //picDir = properties.getProperty("savePicUrl");
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