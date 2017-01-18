package ubtms.module.role.entity;

public class Right {
    private Integer id;

    private Integer parentId;

    /**
    * 1增 2删 3改 4查
    */
    private Byte type;

    /**
    * 0启用 1禁用
    */
    private Byte state;

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
}