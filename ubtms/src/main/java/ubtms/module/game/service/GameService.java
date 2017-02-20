package ubtms.module.game.service;

import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;

import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
public interface GameService {
    List<GameDto> getGames(int limit, int offset);

    int saveGameMsg(Game game,String schoolName);

    int updateGameMsgById(Game game);

}
