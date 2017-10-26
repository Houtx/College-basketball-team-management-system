package ubtms.module.user.entity;

public class RivalPlayerData {
    private Integer id;

    private String playerName;

    private String schoolName;

    private Byte duty;

    private Integer gameId;

    private Integer dataId;

    private Integer shirtNum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Byte getDuty() {
        return duty;
    }

    public void setDuty(Byte duty) {
        this.duty = duty;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public Integer getShirtNum() {
        return shirtNum;
    }

    public void setShirtNum(Integer shirtNum) {
        this.shirtNum = shirtNum;
    }
}