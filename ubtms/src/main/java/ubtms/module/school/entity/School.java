package ubtms.module.school.entity;

/**
 * Created by jinzhany on 2016/12/7.
 */
public class School {
    private int schId;
    private String schName;
    private String schLogo;
    private byte state;
    private String introduction;

    public byte getState() {
        return state;
    }

    public void setState(byte state) {
        this.state = state;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getSchId() {
        return schId;
    }

    public void setSchId(int schId) {
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

    @Override
    public String toString() {
        return "User{" +
                "schId=" + schId +
                ", schName='" + schName + '\'' +
                ", schLogo='" + schLogo + '\'' +
                '}';
    }
}
