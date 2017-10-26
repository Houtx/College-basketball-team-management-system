package ubtms.module.community.dto;

import ubtms.module.community.entity.Article;

/**
 * Created by jinzhany on 2017/2/26.
 */
public class ArticleDto extends Article {
    private String schoolName;
    private String author;
    public ArticleDto() {
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
}
