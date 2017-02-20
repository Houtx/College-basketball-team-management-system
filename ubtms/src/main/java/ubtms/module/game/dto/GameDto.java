package ubtms.module.game.dto;

import ubtms.module.game.entity.Game;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.school.service.impl.SchoolServiceImpl;

/**
 * Created by jinzhany on 2017/2/20.
 */
public class GameDto {
    private Game game;
    private String state;
    private String mySchoolName;
    private Integer mySchoolId;
    private String rivalName;
    private String score;


    public GameDto() {
    }

    public GameDto(Game game) {
        this.game = game;
        SchoolService schoolService = new SchoolServiceImpl();

        School school = schoolService.selectOne(game.getSchoolId());
        this.mySchoolId = school.getSchId();
        this.mySchoolName = school.getSchName();
        //通过rival_player_data
        this.rivalName = "";
        this.score = "xxx-xxx";
    }

    public Game getGame() {
        return game;
    }

    public Integer getMySchoolId() {
        return mySchoolId;
    }

    public void setMySchoolId(Integer mySchoolId) {
        this.mySchoolId = mySchoolId;
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

    public String getRivalName() {
        return rivalName;
    }

    public void setRivalName(String rivalName) {
        this.rivalName = rivalName;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
