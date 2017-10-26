package ubtms.module.community.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.dto.CommentDto;
import ubtms.module.community.dto.ReplyDto;
import ubtms.module.community.entity.*;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ArticleMapperTest {
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    CommentMapper commentMapper;
    @Autowired
    ReplyMapper replyMapper;

    @Test
    public void selectByReplyQuery(){
        ReplyQuery replyQuery = new ReplyQuery();
        replyQuery.setLimit(10);
        replyQuery.setOffset(0);
        //replyQuery.setSchName("系统");
        replyQuery.setUserId(3);
        int count = replyMapper.countByReplyQuery(replyQuery);
        List<ReplyDto> replyDtos = replyMapper.selectByReplyQuery(replyQuery);
    }

    @Test
    public void selectByCommentQuery(){
        CommentQuery commentQuery = new CommentQuery();
        commentQuery.setLimit(10);
        commentQuery.setOffset(0);
        //commentQuery.setSchName("系统");
        commentQuery.setUserId(15);
        int count = commentMapper.countByCommentQuery(commentQuery);
        List<CommentDto> commentDtos = commentMapper.selectByCommentQuery(commentQuery);
    }

    @Test
    public void selectByExample(){
        Article article = articleMapper.selectByPrimaryKey(6);
        //System.out.println(article);
    }

    @Test
    public void selectWithLimit() throws Exception {
        ArticleLimitObject<Article> articleArticleLimitObject = new ArticleLimitObject<Article>();
        articleArticleLimitObject.setOffset(0);
        articleArticleLimitObject.setLimit(10);
        Article article = new Article();
        articleArticleLimitObject.setData(article);
        article.setTitle("在");
        articleArticleLimitObject.setSchoolName("系统");
        List<ArticleDto> dtos = articleMapper.selectWithLimit(articleArticleLimitObject);
        System.out.println("***********************:"+articleMapper.countWithLimit(articleArticleLimitObject));
    }

}