package ubtms.module.community.dto;

import ubtms.module.community.entity.Comment;

import java.util.Date;
import java.util.List;

public class CommentDto extends Comment{
    private String userName;
    private String headPic;

    private List<ReplyDto> replyDtos;

    public List<ReplyDto> getReplyDtos() {
        return replyDtos;
    }

    public void setReplyDtos(List<ReplyDto> replyDtos) {
        this.replyDtos = replyDtos;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }
}