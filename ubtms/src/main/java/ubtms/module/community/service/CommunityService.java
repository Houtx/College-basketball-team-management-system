package ubtms.module.community.service;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.entity.Article;
import ubtms.module.community.entity.ArticleLimitObject;
import ubtms.module.community.entity.Comment;
import ubtms.module.community.entity.Reply;

import java.util.List;


/**
 * Created by jinzhany on 2016/12/8.
 */
public interface CommunityService {
    int saveArticle(Article article, String userAccount);
    int saveComment(Comment comment,String userAccount);
    int saveReply(Reply reply, String userAccount);
    int countWithLimit(ArticleLimitObject articleLimitObject);
    List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject);
    Article getArticleById(String id);
}
