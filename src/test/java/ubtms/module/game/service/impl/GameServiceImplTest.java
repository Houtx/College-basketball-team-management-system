package ubtms.module.game.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.game.dao.GameMapper;
import ubtms.module.game.entity.Game;
import ubtms.module.game.service.GameService;
import ubtms.module.user.dao.PlayerDataMapper;
import ubtms.module.user.dao.SchoolPlayerDataMapper;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.entity.PlayerData;
import ubtms.module.user.entity.PlayerDataQuery;
import ubtms.module.user.entity.SchoolPlayerData;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static ubtms.basic.util.DateUtil.randomDate;

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
    UserService userService;
    @Autowired
    GameMapper gameMapper;
    @Autowired
    PlayerDataMapper playerDataMapper;
    @Autowired
    SchoolPlayerDataMapper schoolPlayerDataMapper;

    @Test
    public void getGames() throws Exception {
        PlayerDataQuery playerDataQuery = new PlayerDataQuery();
        //playerDataQuery.setUserId(15);
        playerDataQuery.setSchName("北理珠");
        playerDataQuery.setUserName("叶同学");
        playerDataQuery.setLimit(5);
        playerDataQuery.setOffset(0);
        int total = playerDataMapper.countAVGData(playerDataQuery);
        List<PlayerDataDto> playerDataDto = playerDataMapper.selectAVGData(playerDataQuery);
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
    public void getData(){
        Calendar ca = null;//得到一个Calendar的实例
        try {
            PlayerDataQuery playerDataQuery= new PlayerDataQuery();
            playerDataQuery.setUserId(15);
            ca = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
            //playerDataQuery.setStartTime(sdf.parse("2017"));
            ca.setTime(sdf.parse("2017"));   //设置时间为当前时间
            ca.add(Calendar.YEAR, 1); //年份增减
            Date endTime = ca.getTime(); //结果
            //playerDataQuery.setEndTime(endTime);
            List<PlayerDataDto> playerData = playerDataMapper.selectByUserIdAndTime(playerDataQuery);
            System.out.println(playerData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void updateGameMsgById() throws Exception {

    }

    @Test
    public void createGameMsgData() throws Exception {
        for (int i=0;i<2;i++){
            String rival = "吉林大学";
            Random random = new Random();
            Date date = randomDate("2016-01-01","2017-03-17");
            String place = "操场";
            String remark = "无";
            Game game = new Game();
            game.setRival(rival);
            game.setStartTime(date);
            game.setPlace(place);
            game.setRemark(remark);
            game.setSchoolId(2);
            //gameService.saveGameMsg(game,"北理珠");
            gameMapper.insert(game);
            int gameId = gameMapper.selectLastData().getId();
            List<User> userList = userService.selectBySchoolName("北理珠");
            for (User user:userList) {
                int roleId = user.getRoleId();
                if (roleId != 4) {
                    continue;
                }
                PlayerData playerData = createGameData();
                playerDataMapper.insert(playerData);
                int dataId = playerDataMapper.selectLastData().getId();
                SchoolPlayerData schoolPlayerData = new SchoolPlayerData();
                schoolPlayerData.setGameId(gameId);
                schoolPlayerData.setPlayerId(user.getId());
                schoolPlayerData.setDataId(dataId);
                schoolPlayerDataMapper.insert(schoolPlayerData);
            }
        }
    }


    public static PlayerData createGameData(){
        Random random = new Random();
        /**
         * 出手
         */
        Integer shot=random.nextInt(20);
        /**
         * 命中球数
         */
        Integer fieldGoal = random.nextInt(shot+1);
        //三分出手
        Integer threePointShot = random.nextInt(shot+1);

        /**
         * 三分球命中个数
         */
        Integer threePointShotGoal = random.nextInt(fieldGoal+1);

        /**
         * 篮板
         */
        Integer backboard = random.nextInt(6);

        Integer assist = random.nextInt(6);

        /**
         * 抢断
         */
        Integer steal = random.nextInt(3);

        Integer blockshot = random.nextInt(4);

        /**
         * 失误
         */
        Integer turnover=random.nextInt(5);

        Integer score = (fieldGoal - threePointShotGoal) * 2 + threePointShotGoal * 3;
        PlayerData playerData = new PlayerData(score, shot, fieldGoal, threePointShot, threePointShotGoal, backboard, assist, steal, blockshot, turnover);
        return playerData;
    }

}