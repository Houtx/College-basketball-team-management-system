package ubtms.module.school.entity;

/**
 * Created by jinzhany on 2016/12/7.
 */
public class School {
    private int schId;
    private String schName;
    private String schLogo;

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
