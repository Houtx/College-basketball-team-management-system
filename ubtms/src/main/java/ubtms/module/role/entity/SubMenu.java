package ubtms.module.role.entity;

import java.util.List;

public class SubMenu {
    private Integer id;

    private Integer parentId;

    private String url;

    private String name;

    private Integer sort;

    private Menu menu;

    private Byte state;

    private List<Permission> permissions;

    public SubMenu() {
    }

    public SubMenu(Integer id, Integer parentId, String url, String name, Integer sort, Menu menu, Byte state, List<Permission> permissions) {
        this.id = id;
        this.parentId = parentId;
        this.url = url;
        this.name = name;
        this.sort = sort;
        this.menu = menu;
        this.state = state;
        this.permissions = permissions;
    }

    public SubMenu(Integer parentId,String url, String name, Integer sort, Byte state) {
        this.url = url;
        this.parentId = parentId;
        this.name = name;
        this.sort = sort;
        this.state = state;
    }

    public SubMenu(Integer id,Integer parentId,String url, String name, Integer sort, Byte state) {
        this.id=id;
        this.url = url;
        this.parentId = parentId;
        this.name = name;
        this.sort = sort;
        this.state = state;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> Permissions) {
        this.permissions = Permissions;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    @Override
    public String toString() {
        return "SubMenu{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", url='" + url + '\'' +
                ", name='" + name + '\'' +
                ", sort=" + sort +
                ", state=" + state +
                '}';
    }
}