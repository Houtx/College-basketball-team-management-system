package ubtms.module.community.entity;

import java.util.Date;

public class Notice {
    private Integer id;

    private Integer suserId;

    private Integer targetId;

    private String content;

    private Integer articleId;

    /**
    * 0Î´¶Á 1ÒÑ¶Á
    */
    private Integer isRead;

    private Date replytime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSuserId() {
        return suserId;
    }

    public void setSuserId(Integer suserId) {
        this.suserId = suserId;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }
}