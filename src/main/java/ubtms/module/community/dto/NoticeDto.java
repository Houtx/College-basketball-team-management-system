package ubtms.module.community.dto;

import ubtms.module.community.entity.Notice;

/**
 * Created by jinzhany on 2017/4/5.
 */
public class NoticeDto extends Notice {
    String articleTitle;
    String replyName;

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getReplyName() {
        return replyName;
    }

    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }
}
