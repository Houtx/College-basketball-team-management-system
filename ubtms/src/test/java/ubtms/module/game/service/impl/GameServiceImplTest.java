package ubtms.module.game.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.game.entity.Game;
import ubtms.module.game.service.GameService;
import ubtms.module.user.dao.PlayerDataMapper;
import ubtms.module.user.entity.PlayerData;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class GameServiceImplTest {
    @Autowired
    GameService gameService;
    @Autowired
    PlayerDataMapper playerDataMapper;

    @Test
    public void getGames() throws Exception {
        gameService.getGames(10,0);
        //System.out.println(playerDataMapper.sumMySchoolScore(1));
       // System.out.println(playerDataMapper.sumRivalScore(1));
    }

    @Test
    public void saveGameMsg() throws Exception {
        Game game = new Game();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date = sdf.parse("2016-02-10 11:15");
        game.setStartTime(date);
        game.setRemark("评论");
        game.setRival("哈佛");
        game.setPlace("球场");
        gameService.saveGameMsg(game,"北理珠");
    }


    @Test
    public void updateGameMsgById() throws Exception {

    }

    @Test
    public void selectGameMsgByExample() throws Exception {

    }

}