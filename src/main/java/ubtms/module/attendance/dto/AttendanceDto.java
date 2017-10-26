package ubtms.module.attendance.dto;

import ubtms.module.attendance.entity.Attendance;

/**
 * Created by jinzhany on 2017/3/21.
 */
public class AttendanceDto extends Attendance {
    String schoolName;
    String userName;

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
