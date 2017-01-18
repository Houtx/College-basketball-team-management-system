package ubtms.module.attendance.entity;

import java.util.Date;

public class Attendance {
    private Integer id;

    /**
    * 0µ½ 1Î´µ½
    */
    private Byte attend;

    /**
    * 0ÎÞ¹ÊÈ±ÇÚ 1²¡¼Ù 2ÊÂ¼Ù
    */
    private Byte absenceType;

    private Integer userId;

    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Byte getAttend() {
        return attend;
    }

    public void setAttend(Byte attend) {
        this.attend = attend;
    }

    public Byte getAbsenceType() {
        return absenceType;
    }

    public void setAbsenceType(Byte absenceType) {
        this.absenceType = absenceType;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}