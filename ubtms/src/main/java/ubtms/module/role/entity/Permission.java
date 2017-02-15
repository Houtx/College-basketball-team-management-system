package ubtms.module.role.entity;

public class Permission {
    private Integer id;

    private Integer parentId;

    /**
    * 1�� 2ɾ 3�� 4��
    */
    private Byte type;

    /**
    * 0���� 1����
    */
    private Byte state;

    private Integer sort;

    private SubMenu subMenu;
    public Permission() {
    }

    public SubMenu getSubMenu() {
        return subMenu;
    }

    public Permission(Integer parentId, Byte type, Byte state, Integer sort) {
        this.parentId = parentId;
        this.type = type;
        this.state = state;
        this.sort = sort;
    }

    public void setSubMenu(SubMenu subMenu) {
        this.subMenu = subMenu;
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

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", type=" + type +
                ", state=" + state +
                ", sort=" + sort +
                ", subMenu=" + subMenu +
                '}';
    }
}