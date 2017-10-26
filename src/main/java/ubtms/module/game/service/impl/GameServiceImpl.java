package ubtms.module.game.service.impl;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.CastUtil;
import ubtms.module.game.dao.GameMapper;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;
import ubtms.module.game.service.GameService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dao.RivalPlayerDataMapper;
import ubtms.module.user.dao.SchoolPlayerDataMapper;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.entity.*;
import ubtms.module.user.service.UserService;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
@Service
public class GameServiceImpl implements GameService {
    @Autowired
    private GameMapper gameMapper;
    @Autowired
    private SchoolPlayerDataMapper schoolPlayerDataMapper;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private UserService userService;
    @Autowired
    private RivalPlayerDataMapper rivalPlayerDataMapper;

    @Override
    public MngResult<List<GameDto>> getGames(int limit, int offset, String schoolName, String rival, String dateStr) throws ParseException {
        School schooTemp = schoolService.selectOne(new School(schoolName));
        if (schooTemp == null && !schoolName.isEmpty()) {
            schooTemp = new School();
            schooTemp.setSchId(-1);
        }
        GameExample gameExample = new GameExample();
        gameExample.setLimit(limit);
        gameExample.setOffset(offset);
        Date startDate = null;
        Date endDate = null;
        if (!dateStr.isEmpty()) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
            startDate = format.parse(dateStr);
            Calendar ca = Calendar.getInstance();
            ca.setTime(startDate);   //设置时间为当前时间
            ca.add(Calendar.MONTH, 1); //年份增减
            endDate = ca.getTime(); //结果
        }
        if (schooTemp != null) {
            if (!rival.isEmpty()) {
                gameExample.createCriteria().andRivalEqualTo(rival).andSchoolIdEqualTo(schooTemp.getSchId());
                if (!dateStr.isEmpty()) {
                    gameExample.createCriteria().andRivalEqualTo(rival).andSchoolIdEqualTo(schooTemp.getSchId()).andStartTimeBetween(startDate, endDate);
                }
            } else if (!dateStr.isEmpty()) {
                gameExample.createCriteria().andSchoolIdEqualTo(schooTemp.getSchId()).andStartTimeBetween(startDate,endDate);
            } else {
                gameExample.createCriteria().andSchoolIdEqualTo(schooTemp.getSchId());
            }
        } else {
            if (!rival.isEmpty()) {
                gameExample.createCriteria().andRivalEqualTo(rival);
                if (!dateStr.isEmpty()) {
                    gameExample.createCriteria().andRivalEqualTo(rival).andStartTimeBetween(startDate, endDate);
                }
            } else if (!dateStr.isEmpty()) {
                gameExample.createCriteria().andStartTimeBetween(startDate,endDate);
            }
        }

        List<Game> games = gameMapper.selectByExample(gameExample);
        List<GameDto> gameDtos = new ArrayList<GameDto>();
        for (Game game : games) {
            School school = schoolService.selectOne(game.getSchoolId());
            int[] teamScore = userService.getTeamScore(game.getId());
            gameDtos.add(new GameDto(game, school, teamScore));
        }
        gameExample.setLimit(null);
        gameExample.setOffset(null);
        int total = gameMapper.countByExample(gameExample);

        return new MngResult<List<GameDto>>(true, gameDtos, total);
    }

    @Override
    public int delGame(List<Game> games) {
        for (Game game : games) {
            gameMapper.deleteByPrimaryKey(game.getId());
        }
        return games.size();
    }

    @Override
    public int saveGameMsg(Game game, String schoolName) {
        Integer schId = schoolService.selectOne(new School(schoolName)).getSchId();
        game.setSchoolId(schId);
        gameMapper.insert(game);
        Integer gameId = gameMapper.selectLastData().getId();
        UserQuery userQuery = new UserQuery();
        userQuery.setSchoolId(schId);
        userQuery.setRoleName("球员");
        List<User> users = userService.selectByUserQuery(userQuery);
        //初始化球员数据为0
        for (User user : users) {
            PlayerData playerData = new PlayerData(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            userService.savePlayData(playerData);
            int dataId = userService.getLastData().getId();
            int playerId = user.getId();
            schoolPlayerDataMapper.insert(new SchoolPlayerData(playerId, gameId, dataId));
        }
        return 1;
    }

    @Override
    public int updateGameMsgById(Game game) {
        return gameMapper.updateByPrimaryKey(game);
    }

    @Override
    public List<Game> selectGameMsgByExample(GameExample gameExample) {
        return gameMapper.selectByExample(gameExample);
    }

    @Override
    public Game getById(Integer id) {
        return gameMapper.selectByPrimaryKey(id);
    }

    @Override
    public void importGame(MultipartFile file) throws Exception {
        ByteArrayInputStream bis = new ByteArrayInputStream(file.getBytes());
        XSSFWorkbook wb = new XSSFWorkbook(bis);
        XSSFSheet sheet = wb.getSheetAt(0);

        String schoolName = String.valueOf(sheet.getRow(0).getCell(0));
        School school = schoolService.selectOne(new School(schoolName));
        if (school == null) {
            throw new Exception("学校未注册");
        }

        String rival = String.valueOf(sheet.getRow(1).getCell(0));
        String timeStr = String.valueOf(sheet.getRow(2).getCell(0));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 hh:mm");
        Date startTime = sdf.parse(timeStr);

        String place = String.valueOf(sheet.getRow(3).getCell(0));
        String remark = String.valueOf(sheet.getRow(4).getCell(0));

        User[] users = new User[30];
        for (int i = 8; i <= 23; i++) {
            Row row = sheet.getRow(i);
            if ((row != null) && (row.getCell(0) != null)) {
                String stuName = row.getCell(0).toString();
                UserQuery userQuery = new UserQuery();
                userQuery.setSchName(schoolName);
                userQuery.setRealName(stuName);
                List<User> tempUserList = userService.selectByUserQuery(userQuery);
                if (tempUserList.size() == 0) {
                    throw new Exception(stuName + "不存在");
                }
                users[i] = tempUserList.get(0);
            }
        }
        Game game = new Game();
        game.setSchoolId(school.getSchId());
        game.setRival(rival);
        game.setStartTime(startTime);
        game.setPlace(place);
        game.setRemark(remark);
        GameExample gameExample = new GameExample();
        gameExample.createCriteria().andSchoolIdEqualTo(school.getSchId()).andRivalEqualTo(rival).andStartTimeEqualTo(startTime).andPlaceEqualTo(place);
        List<Game> gameList = gameMapper.selectByExample(gameExample);
        if (gameList.size() > 0) {
            throw new Exception("比赛已存在");
        }
        gameMapper.insert(game);
        Integer gameId = gameMapper.selectLastData().getId();

        for (int i = 8; i <= 22; i++) {
            if (sheet.getRow(i) == null)
                continue;
            Row row = sheet.getRow(i);
            Integer score = row.getCell(1) == null ? null : CastUtil.getInteger(row.getCell(1).toString());
            Integer shot = row.getCell(4) == null ? null : CastUtil.getInteger(row.getCell(4).toString());
            Integer fieldGoal = row.getCell(5) == null ? null : CastUtil.getInteger(row.getCell(5).toString());
            Integer threePointShot = row.getCell(6) == null ? null : CastUtil.getInteger(row.getCell(6).toString());
            Integer threePointShotGoal = row.getCell(7) == null ? null : CastUtil.getInteger(row.getCell(7).toString());
            Integer backboard = row.getCell(8) == null ? null : CastUtil.getInteger(row.getCell(8).toString());
            Integer assist = row.getCell(9) == null ? null : CastUtil.getInteger(row.getCell(9).toString());
            Integer steal = row.getCell(10) == null ? null : CastUtil.getInteger(row.getCell(10).toString());
            Integer blockshot = row.getCell(11) == null ? null : CastUtil.getInteger(row.getCell(11).toString());
            Integer turnover = row.getCell(12) == null ? null : CastUtil.getInteger(row.getCell(12).toString());
            PlayerData playerData = new PlayerData();
            playerData.setScore(score);
            playerData.setShot(shot);
            playerData.setFieldGoal(fieldGoal);
            playerData.setThreePointShot(threePointShot);
            playerData.setThreePointShotGoal(threePointShotGoal);
            playerData.setBackboard(backboard);
            playerData.setAssist(assist);
            playerData.setSteal(steal);
            playerData.setBlockshot(blockshot);
            playerData.setTurnover(turnover);

            userService.savePlayData(playerData);
            int dataId = userService.getLastData().getId();
            int playerId = users[i].getId();
            schoolPlayerDataMapper.insert(new SchoolPlayerData(playerId, gameId, dataId));
        }

        for (int i = 24; i <= 38; i++) {
            if (sheet.getRow(i) == null)
                continue;
            if (sheet.getRow(i).getCell(0) == null)
                continue;
            Row row = sheet.getRow(i);
            String rPlayerName = sheet.getRow(i).getCell(0).toString();
            Integer score = row.getCell(1) == null ? null : CastUtil.getInteger(row.getCell(1).toString());
            Integer num = row.getCell(2) == null ? null : CastUtil.getInteger(row.getCell(2).toString());
            String duty = row.getCell(3) == null ? null : row.getCell(3).toString();
            Integer shot = row.getCell(4) == null ? null : CastUtil.getInteger(row.getCell(4).toString());
            Integer fieldGoal = row.getCell(5) == null ? null : CastUtil.getInteger(row.getCell(5).toString());
            Integer threePointShot = row.getCell(6) == null ? null : CastUtil.getInteger(row.getCell(6).toString());
            Integer threePointShotGoal = row.getCell(7) == null ? null : CastUtil.getInteger(row.getCell(7).toString());
            Integer backboard = row.getCell(8) == null ? null : CastUtil.getInteger(row.getCell(8).toString());
            Integer assist = row.getCell(9) == null ? null : CastUtil.getInteger(row.getCell(9).toString());
            Integer steal = row.getCell(10) == null ? null : CastUtil.getInteger(row.getCell(10).toString());
            Integer blockshot = row.getCell(11) == null ? null : CastUtil.getInteger(row.getCell(11).toString());
            Integer turnover = row.getCell(12) == null ? null : CastUtil.getInteger(row.getCell(12).toString());
            PlayerData playerData = new PlayerData();
            playerData.setScore(score);
            playerData.setShot(shot);
            playerData.setFieldGoal(fieldGoal);
            playerData.setThreePointShot(threePointShot);
            playerData.setThreePointShotGoal(threePointShotGoal);
            playerData.setBackboard(backboard);
            playerData.setAssist(assist);
            playerData.setSteal(steal);
            playerData.setBlockshot(blockshot);
            playerData.setTurnover(turnover);

            userService.savePlayData(playerData);
            int dataId = userService.getLastData().getId();
            RivalPlayerData rivalPlayerData = new RivalPlayerData();
            rivalPlayerData.setSchoolName(rival);
            rivalPlayerData.setShirtNum(num);
            Byte dutyI = null;
            switch (duty) {
                case "分卫":
                    dutyI = 1;
                    break;
                case "控卫":
                    dutyI = 2;
                    break;
                case "小前锋":
                    dutyI = 3;
                    break;
                case "大前锋":
                    dutyI = 4;
                    break;
                case "中锋":
                    dutyI = 5;
                    break;
            }
            rivalPlayerData.setPlayerName(rPlayerName);
            rivalPlayerData.setDuty(dutyI);
            rivalPlayerData.setDataId(dataId);
            rivalPlayerData.setGameId(gameId);
            rivalPlayerDataMapper.insert(rivalPlayerData);
        }


    }

    @Override
    public XSSFWorkbook exportExcel(Integer id) {
        Game game = getById(id);
        School school = schoolService.selectOne(game.getSchoolId());
        String schName = school.getSchName();
        List<PlayerDataDto> mySchoolplayerDataDtos = userService.getMySchoolPlayerData(id);
        List<PlayerDataDto> rivalPlayerDataDtos = userService.getRivalPlayerData(id);
        int mySchoolplayerDataDtosLength = mySchoolplayerDataDtos.size();
        int[] arrSSum = new int[10];
        int[] arrRSum = new int[10];
        for (PlayerData playerData : mySchoolplayerDataDtos) {
            arrSSum[0] += playerData.getScore();
            arrSSum[1] += playerData.getShot();
            arrSSum[2] += playerData.getFieldGoal();
            arrSSum[3] += playerData.getThreePointShot();
            arrSSum[4] += playerData.getThreePointShotGoal();
            arrSSum[5] += playerData.getBlockshot();
            arrSSum[6] += playerData.getAssist();
            arrSSum[7] += playerData.getSteal();
            arrSSum[8] += playerData.getBlockshot();
            arrSSum[9] += playerData.getTurnover();
        }
        for (PlayerData playerData : rivalPlayerDataDtos) {
            arrRSum[0] += playerData.getScore();
            arrRSum[1] += playerData.getShot();
            arrRSum[2] += playerData.getFieldGoal();
            arrRSum[3] += playerData.getThreePointShot();
            arrRSum[4] += playerData.getThreePointShotGoal();
            arrRSum[5] += playerData.getBlockshot();
            arrRSum[6] += playerData.getAssist();
            arrRSum[7] += playerData.getSteal();
            arrRSum[8] += playerData.getBlockshot();
            arrRSum[9] += playerData.getTurnover();
        }


        mySchoolplayerDataDtos.addAll(rivalPlayerDataDtos);
        //创建excel工作簿
        XSSFWorkbook wb = new XSSFWorkbook();
        //创建第一个sheet（页），命名为 new sheet
        Sheet sheet = wb.createSheet("game");
        sheet.createRow(0).createCell(0).setCellValue(schName);
        sheet.createRow(1).createCell(0).setCellValue(game.getRival());
        sheet.createRow(2).createCell(0).setCellValue(DateFormatUtils.format(game.getStartTime(), "yyyy年mm月dd日 hh:mm"));
        sheet.createRow(3).createCell(0).setCellValue(game.getPlace());
        sheet.createRow(4).createCell(0).setCellValue(game.getRemark());

        Row itemRow = sheet.createRow(6);
        itemRow.createCell(0).setCellValue("姓名");
        itemRow.createCell(1).setCellValue("得分");
        itemRow.createCell(2).setCellValue("号码");
        itemRow.createCell(3).setCellValue("位置");
        itemRow.createCell(4).setCellValue("出手");
        itemRow.createCell(5).setCellValue("命中");
        itemRow.createCell(6).setCellValue("三分出手");
        itemRow.createCell(7).setCellValue("三分命中");
        itemRow.createCell(8).setCellValue("篮板");
        itemRow.createCell(9).setCellValue("助攻");
        itemRow.createCell(10).setCellValue("抢断");
        itemRow.createCell(11).setCellValue("盖帽");
        itemRow.createCell(12).setCellValue("失误");

        Row sSumRow = sheet.createRow(6 + mySchoolplayerDataDtosLength);
        sSumRow.createCell(0).setCellValue("总计");
        sSumRow.createCell(1).setCellValue(arrSSum[0]);
        sSumRow.createCell(4).setCellValue(arrSSum[1]);
        sSumRow.createCell(5).setCellValue(arrSSum[2]);
        sSumRow.createCell(6).setCellValue(arrSSum[3]);
        sSumRow.createCell(7).setCellValue(arrSSum[4]);
        sSumRow.createCell(8).setCellValue(arrSSum[5]);
        sSumRow.createCell(9).setCellValue(arrSSum[6]);
        sSumRow.createCell(10).setCellValue(arrSSum[7]);
        sSumRow.createCell(11).setCellValue(arrSSum[8]);
        sSumRow.createCell(12).setCellValue(arrSSum[9]);

        for (int i = 7, j = 0; j < mySchoolplayerDataDtos.size(); i++, j++) {
            if (j + 1 == mySchoolplayerDataDtosLength) {
                i = i + 2;
            }
            Row numRow = sheet.createRow(i);
            numRow.createCell(0).setCellValue(mySchoolplayerDataDtos.get(j).getPlayerName());
            numRow.createCell(1).setCellValue(mySchoolplayerDataDtos.get(j).getScore());
            numRow.createCell(2).setCellValue(mySchoolplayerDataDtos.get(j).getShirtNum());
            Byte duty = mySchoolplayerDataDtos.get(j).getDuty();
            String dutyStr = "";
            switch (duty) {
                case 1:
                    dutyStr = "控卫";
                    break;
                case 2:
                    dutyStr = "分卫";
                    break;
                case 3:
                    dutyStr = "小前锋";
                    break;
                case 4:
                    dutyStr = "大前锋";
                    break;
                case 5:
                    dutyStr = "中锋";
                    break;
            }
            numRow.createCell(3).setCellValue(dutyStr);
            numRow.createCell(4).setCellValue(mySchoolplayerDataDtos.get(j).getShot());
            numRow.createCell(5).setCellValue(mySchoolplayerDataDtos.get(j).getFieldGoal());
            numRow.createCell(6).setCellValue(mySchoolplayerDataDtos.get(j).getThreePointShot());
            numRow.createCell(7).setCellValue(mySchoolplayerDataDtos.get(j).getThreePointShotGoal());
            numRow.createCell(8).setCellValue(mySchoolplayerDataDtos.get(j).getBackboard());
            numRow.createCell(9).setCellValue(mySchoolplayerDataDtos.get(j).getAssist());
            numRow.createCell(10).setCellValue(mySchoolplayerDataDtos.get(j).getSteal());
            numRow.createCell(11).setCellValue(mySchoolplayerDataDtos.get(j).getBlockshot());
            numRow.createCell(12).setCellValue(mySchoolplayerDataDtos.get(j).getTurnover());
        }


        if (rivalPlayerDataDtos != null && rivalPlayerDataDtos.size() != 0) {
            Row rSumRow = sheet.createRow(6 + mySchoolplayerDataDtos.size() + 3);
            rSumRow.createCell(0).setCellValue("总计");
            rSumRow.createCell(1).setCellValue(arrRSum[0]);
            rSumRow.createCell(4).setCellValue(arrRSum[1]);
            rSumRow.createCell(5).setCellValue(arrRSum[2]);
            rSumRow.createCell(6).setCellValue(arrRSum[3]);
            rSumRow.createCell(7).setCellValue(arrRSum[4]);
            rSumRow.createCell(8).setCellValue(arrRSum[5]);
            rSumRow.createCell(9).setCellValue(arrRSum[6]);
            rSumRow.createCell(10).setCellValue(arrRSum[7]);
            rSumRow.createCell(11).setCellValue(arrRSum[8]);
            rSumRow.createCell(12).setCellValue(arrRSum[9]);
        }
        return wb;
    }


}
