package ubtms.module.community.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.dto.MngResult;
import ubtms.module.community.dao.ArticleMapper;
import ubtms.module.community.dao.CommentMapper;
import ubtms.module.community.dao.NoticeMapper;
import ubtms.module.community.dao.ReplyMapper;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.dto.CommentDto;
import ubtms.module.community.dto.NoticeDto;
import ubtms.module.community.dto.ReplyDto;
import ubtms.module.community.entity.*;
import ubtms.module.community.service.CommunityService;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;
import java.util.ArrayList;
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
    NoticeMapper noticeMapper;
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
    public int delArticle(List<Article> articles) {
        for (Article article : articles) {
            articleMapper.deleteByPrimaryKey(article.getId());
        }
        return articles.size();
    }

    @Override
    public int delComment(List<Comment> comments) {
        for (Comment comment : comments) {
            commentMapper.deleteByPrimaryKey(comment.getId());
        }
        return comments.size();
    }

    @Override
    public int delReply(List<Reply> replies) {
        for (Reply reply : replies) {
            replyMapper.deleteByPrimaryKey(reply.getId());
        }
        return replies.size();
    }

    @Override
    public int updateArticle(Article article, String userAccount) {
        Integer userId = userService.selectOne(new User(userAccount)).getId();
        article.setUserId(userId);
        article.setCreateTime(new Date());
        return articleMapper.updateByPrimaryKey(article);
    }

    @Override
    public int saveComment(Comment comment, String userAccount) {
        comment.setCreateTime(new Date());
        Integer userId = userService.selectOne(new User(userAccount)).getId();
        comment.setUserId(userId);
        int row = commentMapper.insert(comment);
        Notice notice = new Notice();
        notice.setIsRead(0);
        notice.setArticleId(comment.getArticleId());
        notice.setSuserId(userId);
        notice.setTargetId(articleMapper.selectByPrimaryKey(comment.getArticleId()).getUserId());
        notice.setContent(comment.getContent());
        notice.setReplytime(new Date());
        noticeMapper.insert(notice);
        return row;
    }

    @Override
    public int saveReply(Reply reply, String userAccount) {
        reply.setCreateTime(new Date());
        User user = userService.selectOne(new User(userAccount));
        StringBuffer content = new StringBuffer(reply.getContent());
        String contentStr = reply.getContent();
        String targetName = contentStr.substring(contentStr.indexOf("@")+1, contentStr.indexOf("："));
        content.insert(content.indexOf("@"), user.getRealName());
        reply.setContent(content.toString());
        reply.setUserId(user.getId());
        int row = replyMapper.insert(reply);
        Notice notice = new Notice();
        notice.setIsRead(0);
        Comment comment = commentMapper.selectByPrimaryKey(reply.getCommentId());
        int articleId =comment.getArticleId();
        notice.setArticleId(articleId);
        notice.setSuserId(reply.getUserId());
        User user1 = new User();
        user1.setRealName(targetName);
        notice.setTargetId(userService.select(user1).get(0).getId());
        notice.setContent(reply.getContent());
        notice.setReplytime(new Date());
        noticeMapper.insert(notice);
        return row;
    }

    @Override
    public List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.selectWithLimit(articleLimitObject);
    }

    @Override
    public Article getArticleWithCommentById(String id, int limit, int offset) {
        return articleMapper.selectWithCommentByPrimaryKey(Integer.valueOf(id), limit, offset);
    }

    @Override
    public Article getArticleById(String id) {
        return articleMapper.selectByPrimaryKey(Integer.valueOf(id));
    }

    @Override
    public List<CommentDto> getPersonComments(CommentQuery commentQuery) {
        return commentMapper.selectByCommentQuery(commentQuery);
    }

    @Override
    public int countPersonComments(CommentQuery commentQuery) {
        return commentMapper.countByCommentQuery(commentQuery);
    }

    @Override
    public List<ReplyDto> getPersonReplys(ReplyQuery replyQuery) {
        return replyMapper.selectByReplyQuery(replyQuery);
    }

    @Override
    public MngResult<List<NoticeDto>> getMsgs(int limit, int offset, String userId) {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.createCriteria().andTargetIdEqualTo(Integer.valueOf(userId));
        noticeExample.setLimit(limit);
        noticeExample.setOffset(offset);
        noticeExample.setOrderByClause("replyTime");
        List<Notice> notices = noticeMapper.selectByExample(noticeExample);
        noticeExample.setOffset(null);
        noticeExample.setLimit(null);
        int total = noticeMapper.countByExample(noticeExample);
        List<NoticeDto> noticeDtoList = new ArrayList<>();
        for (Notice notice : notices) {
            String articelTitle = articleMapper.selectByPrimaryKey(notice.getArticleId()).getTitle();
            String name = userService.selectOne(new User(notice.getSuserId())).getRealName();
            NoticeDto noticeDto = new NoticeDto();
            noticeDto.setId(notice.getId());
            noticeDto.setIsRead(notice.getIsRead());
            noticeDto.setSuserId(notice.getSuserId());
            noticeDto.setContent(notice.getContent());
            noticeDto.setArticleId(notice.getArticleId());
            noticeDto.setTargetId(notice.getTargetId());
            noticeDto.setArticleTitle(articelTitle);
            noticeDto.setReplyName(name);
            noticeDto.setReplytime(notice.getReplytime());
            noticeDtoList.add(noticeDto);
        }

        MngResult<List<NoticeDto>> mngResult = new MngResult<List<NoticeDto>>(true,noticeDtoList,total);
        return mngResult;
    }

    @Override
    public int countPersonReplys(ReplyQuery replyQuery) {
        return replyMapper.countByReplyQuery(replyQuery);
    }

    @Override
    public int updateMsgState(String id) {
        Notice notice = new Notice();
        notice.setId(Integer.valueOf(id));
        notice.setIsRead(1);
        noticeMapper.updateByPrimaryKeySelective(notice);
        return 1;
    }

    @Override
    public int getUnReadMsgNum(String userId) {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.createCriteria().andTargetIdEqualTo(Integer.valueOf(userId)).andIsReadEqualTo(0);
        return noticeMapper.selectByExample(noticeExample).size();
    }

    @Override
    public int countWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.countWithLimit(articleLimitObject);
    }

    @Override
    public int countComment(String articleId) {
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andArticleIdEqualTo(Integer.valueOf(articleId));
        return commentMapper.countByExample(commentExample);
    }
}
