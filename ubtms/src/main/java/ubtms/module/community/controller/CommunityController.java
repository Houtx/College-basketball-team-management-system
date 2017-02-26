package ubtms.module.community.controller;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ubtms.basic.dto.MngResult;
import ubtms.basic.entity.LimitObjet;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.entity.Article;
import ubtms.module.community.entity.ArticleLimitObject;
import ubtms.module.community.service.CommunityService;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.entity.School;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {
    @Autowired
    private CommunityService communityService;
    @Autowired
    private UserService userService;

    @RequestMapping("/articleAddPage")
    public String articleAddPage(){
        System.out.println("in");
        return "/community/articleAdd";
    }

    @RequestMapping("/communityMngPage")
    public String getCommunityMngPage(HttpServletRequest request){
        if (request.getSession().getAttribute("communityAddP") == null) {
            List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
            int[] perssions = PermissionUtil.getPermission(menus, "球队动态");
            request.getSession().setAttribute("communityAddP", perssions[1]);
            request.getSession().setAttribute("communityDelP", perssions[2]);
            request.getSession().setAttribute("communityEditP", perssions[3]);
            request.getSession().setAttribute("communityDetailP", perssions[4]);
        }
        return "/community/communityMng";
    }


    @RequestMapping("/articleGetAction")
    @ResponseBody
    public MngResult<List<ArticleDto>> getArticles(int limit, int offset, String schoolName,String title) {
        Article article = new Article();
        ArticleLimitObject<Article> articleLimitObject = new ArticleLimitObject<Article>(article,offset,limit);
        try {
            schoolName = new String(schoolName.getBytes("ISO-8859-1"), "UTF-8");
            title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
            if (!title.isEmpty()) {
                article.setTitle(title);
            }
            if (schoolName.isEmpty()) {
                articleLimitObject.setSchoolName(schoolName);
            }
            List<ArticleDto> articles = communityService.selectWithLimit(articleLimitObject);
            int total = communityService.countWithLimit(articleLimitObject);
            MngResult<List<ArticleDto>> result = new MngResult<List<ArticleDto>>(true, articles, total);
            return result;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }


    @RequestMapping("/articleAddAction")
    @ResponseBody
    public Map<String,Object> articleAdd(@RequestBody Article article,HttpServletRequest request){
        System.out.println(article);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String userAccount = (String) request.getSession().getAttribute("loginUser");
            communityService.svaeArticle(article,userAccount);
            map.put("success", true);
            map.put("msg","发表成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg","系统异常");
        }
        return map;
    }
    @RequestMapping("/imgUpload")
    public void uploadImg(HttpServletRequest request,HttpServletResponse response) {
        try {
            String path = request.getSession().getServletContext().getRealPath("/images/upload");
            //String path = request.getRealPath();
            File file = new File(path);
            if (!file.exists())
                file.mkdirs();
            String fileName = "";// 文件名称
            /**上传文件处理内容**/
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(factory);
            sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
            sfu.setSizeMax(1024 * 1024); // 限制文件大小
            List<FileItem> fileItems = sfu.parseRequest(request); // 解码请求
            for (FileItem fi : fileItems) {
                fileName = UUID.randomUUID()+fi.getName().substring(fi.getName().lastIndexOf("."),fi.getName().length());
                fi.write(new File(path, fileName));
            }
            //获取图片url地址
            String imgUrl = "http://localhost:8080/images/upload/" + fileName;
            response.setContentType("text/text;charset=utf-8");
            PrintWriter out = null;
            out = response.getWriter();
            out.print(imgUrl);  //返回url地址
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
