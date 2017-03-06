package ubtms.module.community.dto;

import ubtms.module.community.entity.Comment;
import ubtms.module.community.entity.Reply;

public class ReplyDto extends Reply{
    private String opUserName;
    private String targetUserName;


    public String getOpUserName() {
        return opUserName;
    }

    public void setOpUserName(String opUserName) {
        this.opUserName = opUserName;
    }

    public String getTargetUserName() {
        return targetUserName;
    }

    public void setTargetUserName(String targetUserName) {
        this.targetUserName = targetUserName;
    }
}