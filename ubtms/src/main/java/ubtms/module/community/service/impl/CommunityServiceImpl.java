package ubtms.module.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.community.dao.ArticleMapper;
import ubtms.module.community.dto.ArticleDto;
import ubtms.module.community.entity.Article;
import ubtms.module.community.entity.ArticleLimitObject;
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
    UserService userService;

    @Override
    public int svaeArticle(Article article,String userAccount) {
        Integer userId = userService.selectOne(new User(userAccount)).getId();
        article.setUserId(userId);
        article.setCreateTime(new Date());
        return articleMapper.insert(article);
    }

    @Override
    public List<ArticleDto> selectWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.selectWithLimit(articleLimitObject);
    }
    @Override
    public int countWithLimit(ArticleLimitObject articleLimitObject) {
        return articleMapper.countWithLimit(articleLimitObject);
    }
}
