package com.analysis.sparkapp.module;

import ubtms.module.user.entity.PlayerData;

public class PlayDateDto extends PlayerData {
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

    public static void main(String[] args) {
        PlayDateDto playDateDto = new PlayDateDto();

    }
}
