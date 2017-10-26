package ubtms.module.community.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.dto.CommentDto;
import ubtms.module.community.dto.NoticeDto;
import ubtms.module.community.dto.ReplyDto;
import ubtms.module.community.entity.*;
import ubtms.module.community.service.CommunityService;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.entity.School;
import ubtms.module.user.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by jinzhany on 2017/3/1.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {
    @Autowired
    private CommunityService communityService;
    @Autowired
    private UserService userService;

    @RequestMapping("/articleAddAndEditPage")
    public String articleAddAndEditPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        if (opType.equals("1")) {
            String id = request.getParameter("articleId");
            Article article = communityService.getArticleById(id);
            article.setCommentDtos(null);
            model.addAttribute("articleDetail", article);
        }
        model.addAttribute("opType", opType);
        return "/community/articleAddAndEdit";
    }

    @RequestMapping("/communityMngPage")
    public String getCommunityMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "球队动态");
        request.getSession().setAttribute("communityAddP", perssions[1]);
        request.getSession().setAttribute("communityDelP", perssions[2]);
        request.getSession().setAttribute("communityEditP", perssions[3]);
        request.getSession().setAttribute("communityDetailP", perssions[4]);
        return "/community/communityMng";
    }

    @RequestMapping("/msgPage")
    public String getMsgPage(HttpServletRequest request, Model model) {
        String userId = request.getParameter("userId");
        model.addAttribute("userId", userId);
        return "/community/msg";
    }

    @RequestMapping("/detailPage")
    public String getArticle(HttpServletRequest httpServletRequest, Model model) {
        String articleId = httpServletRequest.getParameter("articleId");
        String author = "";
        if (httpServletRequest.getParameter("author") != null) {
            author = httpServletRequest.getParameter("author");
        }
        int limit = 1000;
        int offset = 0;
        if (httpServletRequest.getParameter("offset") != null) {
            offset = Integer.valueOf(httpServletRequest.getParameter("offset"));
        }
        Article article = communityService.getArticleWithCommentById(articleId, limit, offset);
        int commentSum = communityService.countComment(articleId);
        if (offset + limit >= commentSum) {
            model.addAttribute("moreFlag", 0);
        } else {
            model.addAttribute("moreFlag", 1);
            model.addAttribute("offset", offset + limit);
        }
        model.addAttribute("articleDetail", article);
        model.addAttribute("author", author);
        return "/community/articleDetail";
    }

    @RequestMapping("/commentMngPage")
    public String commentMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = new int[4];
        String role = request.getSession().getAttribute("loginRole").toString();
        if (role.equals("超级管理员") || role.equals("领队")) {
            perssions = PermissionUtil.getPermission(menus, "评论管理");
        } else {
            perssions = PermissionUtil.getPermission(menus, "个人评论");
        }
        request.getSession().setAttribute("commentDelP", perssions[2]);
        return "community/commentMng";
    }

    @RequestMapping("/replyMngPage")
    public String replyMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = new int[4];
        String role = request.getSession().getAttribute("loginRole").toString();
        if (role.equals("超级管理员") || role.equals("领队")) {
            perssions = PermissionUtil.getPermission(menus, "回复管理");
        } else {
            perssions = PermissionUtil.getPermission(menus, "个人回复");
        }
        request.getSession().setAttribute("replyDelP", perssions[2]);
        return "community/replyMng";
    }

    @RequestMapping("/personReplyGetAction")
    @ResponseBody
    public MngResult<List<ReplyDto>> getPersonReplys(int limit, int offset, String schoolName, String userName, HttpServletRequest request) {
        try {
            int total = 0;
            ReplyQuery replyQuery = new ReplyQuery();
            replyQuery.setLimit(limit);
            replyQuery.setOffset(offset);
            String userPhone = (String) request.getSession().getAttribute("loginUser");
            String loginRole = (String) request.getSession().getAttribute("loginRole");
            if (userPhone.equals("admin") || loginRole.equals("领队")) {
                if (!schoolName.isEmpty()) {
                    replyQuery.setSchName(schoolName);
                }
                if (!userName.isEmpty()) {
                    replyQuery.setReplyUserName(userName);
                }
            } else {
                String loginUserId = request.getSession().getAttribute("loginUserId").toString();
                replyQuery.setUserId(Integer.valueOf(loginUserId));
            }
            List<ReplyDto> replyDtos = communityService.getPersonReplys(replyQuery);
            total = communityService.countPersonReplys(replyQuery);
            MngResult<List<ReplyDto>> list = new MngResult<List<ReplyDto>>(true, replyDtos, total);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/personCommentGetAction")
    @ResponseBody
    public MngResult<List<CommentDto>> getPersonComments(int limit, int offset, String schoolName, String userName, HttpServletRequest request) {
        try {
            int total = 0;
            CommentQuery commentQuery = new CommentQuery();
            commentQuery.setLimit(limit);
            commentQuery.setOffset(offset);
            String userPhone = (String) request.getSession().getAttribute("loginUser");
            String loginRole = (String) request.getSession().getAttribute("loginRole");
            if (userPhone.equals("admin") || loginRole.equals("领队")) {
                if (!schoolName.isEmpty()) {
                    commentQuery.setSchName(schoolName);
                }
                if (!userName.isEmpty()) {
                    commentQuery.setCommentUserName(userName);
                }
            } else {
                String loginUserId = request.getSession().getAttribute("loginUserId").toString();
                commentQuery.setUserId(Integer.valueOf(loginUserId));
            }
            List<CommentDto> commentDtos = communityService.getPersonComments(commentQuery);
            total = communityService.countPersonComments(commentQuery);
            MngResult<List<CommentDto>> list = new MngResult<List<CommentDto>>(true, commentDtos, total);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/msgGetAction")
    @ResponseBody
    public MngResult<List<NoticeDto>> getArticles(int limit, int offset, String userId) {
        return communityService.getMsgs(limit, offset, userId);
    }

    @RequestMapping("/msgChangeStateAction")
    @ResponseBody
    public Map<String, Object> getArticles(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String id = request.getParameter("msgId");
            communityService.updateMsgState(id);
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping("/articleGetAction")
    @ResponseBody
    public MngResult<List<ArticleDto>> getArticles(int limit, int offset, String schoolName, String title,HttpServletRequest request) {
        Article article = new Article();
        ArticleLimitObject<Article> articleLimitObject = new ArticleLimitObject<Article>(article, offset, limit);
        try {
            if (!title.isEmpty()) {
                article.setTitle(title);
            }
            if (!schoolName.isEmpty()) {
                articleLimitObject.setSchoolName(schoolName);
            }
            School school = (School) request.getSession().getAttribute("loginSchool");
            if (!school.getSchName().equals("系统")){
                articleLimitObject.setSystem("系统");
            }
            List<ArticleDto> articles = communityService.selectWithLimit(articleLimitObject);
            int total = communityService.countWithLimit(articleLimitObject);
            MngResult<List<ArticleDto>> result = new MngResult<List<ArticleDto>>(true, articles, total);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @RequestMapping("/articleAddAction")
    @ResponseBody
    public Map<String, Object> articleAdd(@RequestBody Article article, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String userAccount = (String) request.getSession().getAttribute("loginUser");
            communityService.saveArticle(article, userAccount);
            map.put("success", true);
            map.put("msg", "发表成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常");
        }
        return map;
    }

    @RequestMapping("/articleEditAction")
    @ResponseBody
    public Map<String, Object> articleEdit(@RequestBody Article article, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String userAccount = (String) request.getSession().getAttribute("loginUser");
            communityService.updateArticle(article, userAccount);
            map.put("success", true);
            map.put("msg", "更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常");
        }
        return map;
    }

    @RequestMapping("/replySaveAction")
    @ResponseBody
    public Map<String, Object> saveReply(@RequestBody Reply reply, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            communityService.saveReply(reply, (String) request.getSession().getAttribute("loginUser"));
            map.put("success", true);
            map.put("msg", "发送成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常，发送失败");
        }
        return map;
    }

    @RequestMapping("/commentSaveAction")
    @ResponseBody
    public Map<String, Object> saveComment(@RequestBody Comment comment, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            communityService.saveComment(comment, (String) request.getSession().getAttribute("loginUser"));
            map.put("success", true);
            map.put("msg", "发送成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常，发送失败");
        }
        return map;
    }

    @RequestMapping("/imgUpload")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response) {
        try {
            String path = request.getSession().getServletContext().getRealPath("/resources/images/common");
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
                fileName = UUID.randomUUID() + fi.getName().substring(fi.getName().lastIndexOf("."), fi.getName().length());
                fi.write(new File(path, fileName));
            }
            //获取图片url地址
            String imgUrl = "resources/images/common/" + fileName;
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

    @RequestMapping("/commentDelAction")
    @ResponseBody
    private Map<String, Object> delComments(@RequestBody List<Comment> comments) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            communityService.delComment(comments);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败：系统异常");
        }
        return map;
    }

    @RequestMapping("/replyDelAction")
    @ResponseBody
    private Map<String, Object> delReplies(@RequestBody List<Reply> replies) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            communityService.delReply(replies);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败：系统异常");
        }
        return map;
    }

    @RequestMapping("/articleDelAction")
    @ResponseBody
    private Map<String, Object> delArticles(@RequestBody List<Article> articles) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            communityService.delArticle(articles);
            map.put("success", true);
            map.put("msg", "删除成功");

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败：系统异常");
        }
        return map;
    }

}
