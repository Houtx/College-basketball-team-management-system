package ubtms.module.game.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import ubtms.module.game.dao.GameMapper;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;
import ubtms.module.game.service.GameService;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.dao.SchoolMapper;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.entity.PlayerData;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
public class GameServiceImpl implements GameService{
    @Autowired
    private GameMapper gameMapper;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private UserService userService;

    @Override
    public List<GameDto> getGames(int limit, int offset) {
        GameExample gameExample = new GameExample();
        gameExample.setLimit(limit);
        gameExample.setOffset(offset);
        List<Game> games = gameMapper.selectByExample(gameExample);
        List<GameDto> gameDtos = new ArrayList<GameDto>();
        for (Game game : games) {
            gameDtos.add(new GameDto(game));
        }
        return gameDtos;
    }

    @Override
    public int saveGameMsg(Game game,String schoolName) {
        Integer schId = schoolService.selectOne(new School(schoolName)).getSchId();
        game.setSchoolId(schId);
        List<User> users = userService.selectBySchoolId(schId);
        //初始化球员数据为0
        for (User user:users ) {
            PlayerData playerData = new PlayerData("0", 0, "0", "0", "0", "0", "0", "0", "0", "0");
            userService.savePlayData(playerData);
            //用SQL查出最新的那条数据的id
            int dataId=0;
            user.getId();
            game.getId();
            //放入school_player_data表
        }
        return gameMapper.insert(game);
    }

    @Override
    public int updateGameMsgById(Game game) {
        return gameMapper.updateByPrimaryKey(game);
    }


}
