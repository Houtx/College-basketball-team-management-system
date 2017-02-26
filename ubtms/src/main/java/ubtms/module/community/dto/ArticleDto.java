package ubtms.module.community.dto;

import ubtms.module.community.entity.Article;

/**
 * Created by jinzhany on 2017/2/26.
 */
public class ArticleDto extends Article {
    private String schoolName;

    public ArticleDto() {
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
}
