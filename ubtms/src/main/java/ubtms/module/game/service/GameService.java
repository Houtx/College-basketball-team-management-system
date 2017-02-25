package ubtms.module.game.service;

import org.springframework.stereotype.Service;
import ubtms.basic.dto.MngResult;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;

import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
public interface GameService {
    MngResult<List<GameDto>> getGames(int limit, int offset);

    int saveGameMsg(Game game,String schoolName);

    int updateGameMsgById(Game game);

    List<Game> selectGameMsgByExample(GameExample gameExample);
    Game getById(Integer id);

}
