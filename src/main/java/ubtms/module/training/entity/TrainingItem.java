package ubtms.module.training.entity;

public class TrainingItem {
    private Integer id;

    private Byte item;

    private String content;

    private Integer cost;

    private Byte day;

    private Integer traingingId;

    public TrainingItem() {
    }

    public TrainingItem(Byte item, String content, Integer cost, Byte day, Integer traingingId) {
        this.item = item;
        this.content = content;
        this.cost = cost;
        this.day = day;
        this.traingingId = traingingId;
    }

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

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
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