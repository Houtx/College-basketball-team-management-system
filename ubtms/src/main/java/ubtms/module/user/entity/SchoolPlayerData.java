package ubtms.module.user.entity;

public class SchoolPlayerData {
    private Integer id;

    private Integer playerId;

    /**
    * 出手
    */
    private Integer gameId;

    private Integer dataId;

    public SchoolPlayerData() {
    }

    public SchoolPlayerData(Integer playerId, Integer gameId, Integer dataId) {
        this.playerId = playerId;
        this.gameId = gameId;
        this.dataId = dataId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPlayerId() {
        return playerId;
    }

    public void setPlayerId(Integer playerId) {
        this.playerId = playerId;
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
}