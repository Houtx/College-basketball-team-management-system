package ubtms.module.user.dto;

import ubtms.module.user.entity.PlayerData;

import java.util.List;

public class PlayerDataDto extends PlayerData {
    private Integer playerId;

    private String playerName;

    private Byte duty;

    private Integer shirtNum;

    public Integer getShirtNum() {
        return shirtNum;
    }

    public void setShirtNum(Integer shirtNum) {
        this.shirtNum = shirtNum;
    }

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

    public Byte getDuty() {
        return duty;
    }

    public void setDuty(Byte duty) {
        this.duty = duty;
    }

    public PlayerDataDto(){

    }

    public PlayerDataDto(List<PlayerDataDto> list) {
        this.playerName = "总计";
        int scoreSum=0;
        int shotSum=0;
        int fieldGoalSum=0;
        int threePointShotSum=0;
        int threePointShotGoalSum=0;
        int backboardSum=0;
        int blockshotSum=0;
        int assisSum = 0;
        int stealSum = 0;
        int turnOverSum = 0;
        for (PlayerData playerData : list) {
            scoreSum += playerData.getScore();
            shotSum += playerData.getShot();
            fieldGoalSum += playerData.getFieldGoal();
            threePointShotSum += playerData.getThreePointShot();
            threePointShotGoalSum += playerData.getThreePointShotGoal();
            backboardSum += playerData.getBackboard();
            blockshotSum += playerData.getBlockshot();
            assisSum += playerData.getAssist();
            stealSum += playerData.getSteal();
            turnOverSum += playerData.getTurnover();
        }
        this.setScore(scoreSum);
        this.setShot(shotSum);
        this.setFieldGoal(fieldGoalSum);
        this.setThreePointShot(threePointShotSum);
        this.setThreePointShotGoal(threePointShotGoalSum);
        this.setBackboard(backboardSum);
        this.setBlockshot(blockshotSum);
        this.setAssist(assisSum);
        this.setSteal(stealSum);
        this.setTurnover(turnOverSum);
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

    @Override
    public String toString() {
        return "PlayerDataDto{" +
                "playerId=" + playerId +
                ", playerName='" + playerName + '\'' +
                ", duty=" + duty +
                ", shirtNum=" + shirtNum +
                '}';
    }
}
