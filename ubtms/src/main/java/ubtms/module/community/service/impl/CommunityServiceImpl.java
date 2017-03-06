package ubtms.module.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.community.dao.ArticleMapper;
import ubtms.module.community.dao.CommentMapper;
import ubtms.module.community.dao.ReplyMapper;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.entity.Article;
import ubtms.module.community.entity.ArticleLimitObject;
import ubtms.module.community.entity.Comment;
import ubtms.module.community.entity.Reply;
import ubtms.module.community.service.CommunityService;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import java.util.Date;
import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class CommunityServiceImpl implements CommunityService {
    @Autowired
    ArticleMapper articleMapper;
    @Autowired
    CommentMapper commentMapper;
    @Autowired
    ReplyMapper replyMapper;
    @Autowired
    UserService userService;

    @Override
    public int saveArticle(Article article, String userAccount) {
        Integer userId = userService.selectOne(new User(userAccount)).getId();
        article.setUserId(userId);
        article.setCreateTime(new Date());
        return articleMapper.insert(article);
    }

    @Override
    public int saveComment(Comment comment, String userAccount) {
        comment.setCreateTime(new Date());
        Integer userId = userService.selectOne(new User(userAccount)).getId();
        comment.setUserId(userId);
        int row = commentMapper.insert(comment);
        return row;
    }

    @Override
    public int saveReply(Reply reply, String userAccount) {
        reply.setCreateTime(new Date());
        User user = userService.selectOne(new User(userAccount));
        StringBuffer content = new StringBuffer(reply.getContent());
        content.insert(content.indexOf("@"),user.getRealName());
        reply.setContent(content.toString());
        reply.setUserId(user.getId());
        int row = replyMapper.insert(reply);
        return row;
    }

    @Override
    public List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.selectWithLimit(articleLimitObject);
    }

    @Override
    public Article getArticleById(String id) {
        return articleMapper.selectByPrimaryKey(Integer.valueOf(id));
    }

    @Override
    public int countWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.countWithLimit(articleLimitObject);
    }
}
