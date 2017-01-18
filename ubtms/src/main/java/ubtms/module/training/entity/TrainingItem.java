package ubtms.module.training.entity;

public class TrainingItem {
    private Integer id;

    /**
    * 1身体训练 
2 技术训练  
3 战术训练
4 理论知识
    */
    private Byte item;

    /**
    * 训练内容
    */
    private String content;

    /**
    * 训练花费时间
    */
    private Byte cost;

    /**
    * 1-5代表星期一至星期五
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