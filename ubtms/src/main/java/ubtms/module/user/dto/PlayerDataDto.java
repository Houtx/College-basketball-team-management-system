package ubtms.module.user.dto;

import ubtms.module.user.entity.PlayerData;

public class PlayerDataDto extends PlayerData {
    private Integer playerId;

    private String playerName;

    private String schoolName;

    private Byte duty;

    public Integer getPlayerId() {
        return playerId;
    }

    public void setPlayerId(Integer playerId) {
        this.playerId = playerId;
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

    public PlayerDataDto(){

    }
    public PlayerDataDto(PlayerData playerData) {
        this.setId(playerData.getId());
        this.setScore(playerData.getScore());
        this.setShot(playerData.getShot());
        this.setFieldGoal(playerData.getFieldGoal());
        this.setThreePointShot(playerData.getThreePointShot());
        this.setThreePointShotGoal(playerData.getThreePointShotGoal());
        this.setBackboard(playerData.getBackboard());
        this.setBlockshot(playerData.getBlockshot());
        this.setAssist(playerData.getAssist());
        this.setSteal(playerData.getSteal());
        this.setTurnover(playerData.getTurnover());
    }
}
