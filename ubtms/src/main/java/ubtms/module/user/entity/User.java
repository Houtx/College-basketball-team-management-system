package ubtms.module.user.entity;

/**
 * Created by jinzhany on 2016/12/7.
 */
public class User {
    private  int userId;
    private String phone;
    private String password;
    private byte sex;
    private String headPic;

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public int getUserId() {
        return userId;
    }

    public String getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    public byte getSex() {
        return sex;
    }

    public String getHeadPic() {
        return headPic;
    }
}
