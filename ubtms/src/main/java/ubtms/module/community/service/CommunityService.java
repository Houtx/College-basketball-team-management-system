package ubtms.module.community.service;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.dto.CommentDto;
import ubtms.module.community.dto.ReplyDto;
import ubtms.module.community.entity.*;

import java.util.List;


/**
 * Created by jinzhany on 2016/12/8.
 */
public interface CommunityService {
    int saveArticle(Article article, String userAccount);
    int delArticle(List<Article> articles);
    int delComment(List<Comment> comments);
    int delReply(List<Reply> replies);
    int updateArticle(Article article, String userAccount);
    int saveComment(Comment comment,String userAccount);
    int saveReply(Reply reply, String userAccount);
    int countWithLimit(ArticleLimitObject articleLimitObject);
    int countComment(String articleId);
    List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject);
    Article getArticleWithCommentById(String id, int limit, int offset);
    Article getArticleById(String id);
    List<CommentDto> getPersonComments(CommentQuery commentQuery);
    int countPersonComments(CommentQuery commentQuery);
    List<ReplyDto> getPersonReplys(ReplyQuery replyQuery);
    int countPersonReplys(ReplyQuery replyQuery);
}
