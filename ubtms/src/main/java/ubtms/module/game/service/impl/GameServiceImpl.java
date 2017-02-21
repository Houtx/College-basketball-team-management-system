package ubtms.module.game.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.dto.MngResult;
import ubtms.module.game.dao.GameMapper;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;
import ubtms.module.game.service.GameService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dao.RivalPlayerDataMapper;
import ubtms.module.user.dao.SchoolPlayerDataMapper;
import ubtms.module.user.entity.*;
import ubtms.module.user.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
@Service
public class GameServiceImpl implements GameService{
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
    public MngResult<List<GameDto>> getGames(int limit, int offset) {
        GameExample gameExample = new GameExample();
        gameExample.setLimit(limit);
        gameExample.setOffset(offset);
        List<Game> games = gameMapper.selectByExample(gameExample);
        List<GameDto> gameDtos = new ArrayList<GameDto>();
        for (Game game : games) {
            School school = schoolService.selectOne(game.getSchoolId());
            int[] teamScore = userService.getTeamScore(game.getId());
            gameDtos.add(new GameDto(game,school,teamScore));
        }
        gameExample.setLimit(null);
        gameExample.setOffset(null);
        int total = gameMapper.countByExample(gameExample);

        return new MngResult<List<GameDto>>(true,gameDtos,total);
    }

    @Override
    public int saveGameMsg(Game game,String schoolName) {
        Integer gameId = gameMapper.selectLastData().getId();
        Integer schId = schoolService.selectOne(new School(schoolName)).getSchId();
        game.setSchoolId(schId);
        gameMapper.insert(game);
        UserQuery userQuery = new UserQuery();
        userQuery.setSchoolId(schId);
        userQuery.setRoleName("球员");
        List<User> users = userService.selectByUserQuery(userQuery);
        //初始化球员数据为0
        for (User user:users ) {
            PlayerData playerData = new PlayerData(0,0,0,0,0,0,0,0,0,0);
            userService.savePlayData(playerData);
            int dataId = userService.getLastData().getId();
            int playerId = user.getId();
            schoolPlayerDataMapper.insert(new SchoolPlayerData(playerId,gameId,dataId));
        }
        return 1;
    }

    @Override
    public int updateGameMsgById(Game game) {
        return gameMapper.updateByPrimaryKey(game);
    }

    @Override
    public List<Game> selectGameMsgByExample(GameExample gameExample) {
        return null;
    }


}
