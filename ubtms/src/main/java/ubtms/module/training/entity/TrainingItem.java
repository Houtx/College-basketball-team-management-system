package ubtms.module.training.entity;

public class TrainingItem {
    private Integer id;

    /**
    * 1����ѵ�� 
2 ����ѵ��  
3 ս��ѵ��
4 ����֪ʶ
    */
    private Byte item;

    /**
    * ѵ������
    */
    private String content;

    /**
    * ѵ������ʱ��
    */
    private Byte cost;

    /**
    * 1-5��������һ��������
    */
    private Byte day;

    private Integer traingingId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Byte getItem() {
        return item;
    }

    public void setItem(Byte item) {
        this.item = item;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Byte getCost() {
        return cost;
    }

    public void setCost(Byte cost) {
        this.cost = cost;
    }

    public Byte getDay() {
        return day;
    }

    public void setDay(Byte day) {
        this.day = day;
    }

    public Integer getTraingingId() {
        return traingingId;
    }

    public void setTraingingId(Integer traingingId) {
        this.traingingId = traingingId;
    }
}