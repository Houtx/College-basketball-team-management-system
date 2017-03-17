package ubtms.module.user.entity;

/**
 * Created by jinzhany on 2017/2/19.
 */
public class UserDto extends User {
    private String schName;
    private String roleName;

    public UserDto(){}

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }


}
