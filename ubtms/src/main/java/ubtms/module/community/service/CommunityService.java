package ubtms.module.community.service;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.entity.Article;
import ubtms.module.community.entity.ArticleLimitObject;

import java.util.List;


/**
 * Created by jinzhany on 2016/12/8.
 */
public interface CommunityService {
    int svaeArticle(Article article, String userAccount);
    int countWithLimit(ArticleLimitObject articleLimitObject);
    List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject);
}
