package ubtms.module.game.service;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ubtms.basic.dto.MngResult;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/20.
 */
public interface GameService {
    MngResult<List<GameDto>> getGames(int limit, int offset,String schoolName,String rival,String dateStr) throws ParseException;
    int delGame(List<Game> games);
    int saveGameMsg(Game game, String schoolName);
    int updateGameMsgById(Game game);
    List<Game> selectGameMsgByExample(GameExample gameExample);
    Game getById(Integer id);
    void importGame(MultipartFile file) throws Exception;
    XSSFWorkbook exportExcel(Integer id);
}
