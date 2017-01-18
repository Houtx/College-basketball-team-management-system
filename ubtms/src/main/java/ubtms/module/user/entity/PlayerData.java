package ubtms.module.user.entity;

public class PlayerData {
    private Integer id;

    private Byte score;

    /**
    * ����
    */
    private Integer shot;

    /**
    * ��������
    */
    private Byte fieldGoal;

    private Byte threePointShot;

    /**
    * ���������и���
    */
    private Byte threePointShotGoal;

    /**
    * ����
    */
    private Byte backboard;

    private Byte assist;

    /**
    * ����
    */
    private Byte steal;

    private Byte blockshot;

    /**
    * ʧ��
    */
    private Byte turnover;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Byte getScore() {
        return score;
    }

    public void setScore(Byte score) {
        this.score = score;
    }

    public Integer getShot() {
        return shot;
    }

    public void setShot(Integer shot) {
        this.shot = shot;
    }

    public Byte getFieldGoal() {
        return fieldGoal;
    }

    public void setFieldGoal(Byte fieldGoal) {
        this.fieldGoal = fieldGoal;
    }

    public Byte getThreePointShot() {
        return threePointShot;
    }

    public void setThreePointShot(Byte threePointShot) {
        this.threePointShot = threePointShot;
    }

    public Byte getThreePointShotGoal() {
        return threePointShotGoal;
    }

    public void setThreePointShotGoal(Byte threePointShotGoal) {
        this.threePointShotGoal = threePointShotGoal;
    }

    public Byte getBackboard() {
        return backboard;
    }

    public void setBackboard(Byte backboard) {
        this.backboard = backboard;
    }

    public Byte getAssist() {
        return assist;
    }

    public void setAssist(Byte assist) {
        this.assist = assist;
    }

    public Byte getSteal() {
        return steal;
    }

    public void setSteal(Byte steal) {
        this.steal = steal;
    }

    public Byte getBlockshot() {
        return blockshot;
    }

    public void setBlockshot(Byte blockshot) {
        this.blockshot = blockshot;
    }

    public Byte getTurnover() {
        return turnover;
    }

    public void setTurnover(Byte turnover) {
        this.turnover = turnover;
    }
}