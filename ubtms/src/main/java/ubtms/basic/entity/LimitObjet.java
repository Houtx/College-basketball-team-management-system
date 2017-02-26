package ubtms.basic.entity;

/**
 * Created by jinzhany on 2017/1/25.
 */
public class LimitObjet<T> {
    private T data;
    private int offset;
    private int limit;

    public LimitObjet() {
    }

    public LimitObjet(T data, int offset, int limit) {
        this.data = data;
        this.offset = offset;
        this.limit = limit;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
