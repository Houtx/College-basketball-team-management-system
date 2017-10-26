package ubtms.module.school.entity;

/**
 * Created by jinzhany on 2016/12/7.
 */
public class School {
    private Integer schId;
    private String schName;
    private String schLogo;
    private Short state;
    private String introduction;


    public School() {
    }
    public School(Integer schId) {
        this.schId = schId;
    }

    public School(String schName) {
        this.schName = schName;
    }

    public Integer getSchId() {
        return schId;
    }

    public void setSchId(Integer schId) {
        this.schId = schId;
    }

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }

    public String getSchLogo() {
        return schLogo;
    }

    public void setSchLogo(String schLogo) {
        this.schLogo = schLogo;
    }

    public Short getState() {
        return state;
    }

    public void setState(Short state) {
        this.state = state;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @Override
    public String toString() {
        return "User{" +
                "schId=" + schId +
                ", schName='" + schName + '\'' +
                ", schLogo='" + schLogo + '\'' +
                '}';
    }
}
