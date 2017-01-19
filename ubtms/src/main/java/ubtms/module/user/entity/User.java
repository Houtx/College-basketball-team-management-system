package ubtms.module.user.entity;

import ubtms.module.role.entity.Role;

public class User {
    private Integer id;
    /**
    * 11位手机号码
    */
    private String phone;

    /**
    * 密码限制6-16位
    */
    private String password;

    private String realName;

    /**
    * 0女性 1男性
    */
    private Byte sex;

    /**
    * 1启用 0禁用
    */
    private Byte state;

    private Float height;

    private Float weight;

    private String grade;

    /**
    * 球衣号码
    */
    private Byte shirtNum;

    /**
    * 1-5表示1到5号位
    */
    private Byte duty;

    private Integer roleId;

    private String headPic;

    private Role role;

    public User(String phone, String password) {
        this.phone = phone;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Byte getShirtNum() {
        return shirtNum;
    }

    public void setShirtNum(Byte shirtNum) {
        this.shirtNum = shirtNum;
    }

    public Byte getDuty() {
        return duty;
    }

    public void setDuty(Byte duty) {
        this.duty = duty;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", sex=" + sex +
                ", state=" + state +
                ", height=" + height +
                ", weight=" + weight +
                ", grade='" + grade + '\'' +
                ", shirtNum=" + shirtNum +
                ", duty=" + duty +
                ", roleId=" + roleId +
                ", headPic='" + headPic + '\'' +
                '}';
    }
}