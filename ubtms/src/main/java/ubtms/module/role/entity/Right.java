package ubtms.module.role.entity;

public class Right {
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