package ubtms.module.game.dto;

import ubtms.module.game.entity.Game;
import ubtms.module.school.entity.School;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by jinzhany on 2017/2/20.
 */
public class GameDto {
    private Game game;
    private String state;
    private String mySchoolName;
    private String VSScore;
    private Integer mySchoolScore;
    private Integer rivalScore;
    private String startTime;

    public GameDto() {

    }

    public GameDto(Game game,School mySchool,int[] teamScore) {
        this.game = game;
        this.mySchoolName = mySchool.getSchName();
        this.mySchoolScore = teamScore[0];
        this.rivalScore = teamScore[1];
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd hh:mm");
        this.startTime = sdf.format(game.getStartTime());
        Date today = new Date();
        if (today.compareTo(game.getStartTime())>0) {
            this.VSScore = " - ";
            this.state = "未开始";
        } else {
            this.VSScore = this.mySchoolScore + " - " + this.rivalScore;
            this.state = "已结束";
        }
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getVSScore() {
        return VSScore;
    }

    public void setVSScore(String VSScore) {
        this.VSScore = VSScore;
    }

    public Integer getMySchoolScore() {
        return mySchoolScore;
    }

    public void setMySchoolScore(Integer mySchoolScore) {
        this.mySchoolScore = mySchoolScore;
    }

    public Integer getRivalScore() {
        return rivalScore;
    }

    public void setRivalScore(Integer rivalScore) {
        this.rivalScore = rivalScore;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getMySchoolName() {
        return mySchoolName;
    }

    public void setMySchoolName(String mySchoolName) {
        this.mySchoolName = mySchoolName;
    }

}
