package ubtms.module.user.entity;

public class PlayerData {
    private Integer id;

    private Integer score;

    /**
    * 出手
    */
    private Integer shot;

    /**
    * 命中球数
    */
    private Integer fieldGoal;

    private Integer threePointShot;

    /**
    * 三分球命中个数
    */
    private Integer threePointShotGoal;

    /**
    * 篮板
    */
    private Integer backboard;

    private Integer assist;

    /**
    * 抢断
    */
    private Integer steal;

    private Integer blockshot;

    /**
    * 失误
    */
    private Integer turnover;

    public PlayerData() {
    }

    public PlayerData(Integer score, Integer shot, Integer fieldGoal, Integer threePointShot, Integer threePointShotGoal, Integer backboard, Integer assist, Integer steal, Integer blockshot, Integer turnover) {
        this.score = score;
        this.shot = shot;
        this.fieldGoal = fieldGoal;
        this.threePointShot = threePointShot;
        this.threePointShotGoal = threePointShotGoal;
        this.backboard = backboard;
        this.assist = assist;
        this.steal = steal;
        this.blockshot = blockshot;
        this.turnover = turnover;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getShot() {
        return shot;
    }

    public void setShot(Integer shot) {
        this.shot = shot;
    }

    public Integer getFieldGoal() {
        return fieldGoal;
    }

    public void setFieldGoal(Integer fieldGoal) {
        this.fieldGoal = fieldGoal;
    }

    public Integer getThreePointShot() {
        return threePointShot;
    }

    public void setThreePointShot(Integer threePointShot) {
        this.threePointShot = threePointShot;
    }

    public Integer getThreePointShotGoal() {
        return threePointShotGoal;
    }

    public void setThreePointShotGoal(Integer threePointShotGoal) {
        this.threePointShotGoal = threePointShotGoal;
    }

    public Integer getBackboard() {
        return backboard;
    }

    public void setBackboard(Integer backboard) {
        this.backboard = backboard;
    }

    public Integer getAssist() {
        return assist;
    }

    public void setAssist(Integer assist) {
        this.assist = assist;
    }

    public Integer getSteal() {
        return steal;
    }

    public void setSteal(Integer steal) {
        this.steal = steal;
    }

    public Integer getBlockshot() {
        return blockshot;
    }

    public void setBlockshot(Integer blockshot) {
        this.blockshot = blockshot;
    }

    public Integer getTurnover() {
        return turnover;
    }

    public void setTurnover(Integer turnover) {
        this.turnover = turnover;
    }
}