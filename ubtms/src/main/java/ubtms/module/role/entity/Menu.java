package ubtms.module.role.entity;

import java.util.List;

public class Menu {
    private Integer id;

    private String icon;

    private String name;

    private Integer sort;

    private Integer roleId;

    private List<SubMenu> subMenus;

    private Role role;

    public Menu() {
    }

    public Menu(Integer id, String icon, String name, Integer sort, Integer roleId, List<SubMenu> subMenus) {
        this.id = id;
        this.icon = icon;
        this.name = name;
        this.sort = sort;
        this.roleId = roleId;
        this.subMenus = subMenus;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<SubMenu> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<SubMenu> subMenus) {
        this.subMenus = subMenus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", icon='" + icon + '\'' +
                ", name='" + name + '\'' +
                ", sort=" + sort +
                ", roleId=" + roleId +
                ", subMenus=" + subMenus +
                '}';
    }
}