package ubtms.module.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;
import ubtms.module.game.service.GameService;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/game")
public class GameController {
    @Autowired
    private GameService gameService;
    @Autowired
    private UserService userService;
    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/gameMngPage")
    public String getGameMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "赛程管理");
        request.getSession().setAttribute("gameAddP", perssions[1]);
        request.getSession().setAttribute("gameDelP", perssions[2]);
        request.getSession().setAttribute("gameEditP", perssions[3]);
        request.getSession().setAttribute("gameDetailP", perssions[4]);
        return "/game/gameMng";
    }


    @RequestMapping("/gameMsgAddAndEditPage")
    public String getOpPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        //1编辑 2添加
        if (opType.equals("1")) {
            Integer gameId = Integer.valueOf(request.getParameter("gameId"));
            Game game = gameService.getById(gameId);
            String test = schoolService.selectOne(game.getSchoolId()).getSchName();
            model.addAttribute("mySchoolName", schoolService.selectOne(game.getSchoolId()).getSchName());
            model.addAttribute("gameDetail", game);
        }
        model.addAttribute("opType", opType);
        return "/game/gameAddAndEdit";
    }

    @RequestMapping("/gameDelAction")
    @ResponseBody
    public Map<String, Object> delGame(@RequestBody List<Game> games) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            gameService.delGame(games);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败");
        }
        return map;
    }

    @RequestMapping("/gameMsgAddAndEditAction")
    @ResponseBody
    public Map<String, Object> addAndEditGameMsg(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String opType = request.getParameter("opType");
            //1编辑 2添加
            Game game = new Game();
            String rival = request.getParameter("rival");
            String startTime = request.getParameter("startTime");
            String schName = request.getParameter("schoolName");
            String place = request.getParameter("place");
            String remark = request.getParameter("remark");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = sdf.parse(startTime);
            game.setStartTime(date);
            game.setRival(rival);
            game.setPlace(place);
            game.setRemark(remark);
            if (opType.equals("1")) {
                String gameId = request.getParameter("gameId");
                game.setId(Integer.valueOf(gameId));
                gameService.updateGameMsgById(game);
                map.put("success", true);
                map.put("msg", "更新成功");
            } else {
                gameService.saveGameMsg(game, schName);
                map.put("success", true);
                map.put("msg", "添加成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "操作失败:系统异常");
        }
        return map;
    }

    @RequestMapping("/gameDetailPage")
    public String getGameDetail(HttpServletRequest request, Model model) {
        String id = request.getParameter("gameId");
        GameExample gameExample = new GameExample();
        gameExample.createCriteria().andIdEqualTo(Integer.valueOf(id));
        Game game = gameService.selectGameMsgByExample(gameExample).get(0);

        School school = schoolService.selectOne(game.getSchoolId());
        int[] teamScore = userService.getTeamScore(game.getId());
        GameDto gameDto = new GameDto(game, school, teamScore);

        model.addAttribute("game", gameDto);
        return "/game/gameDetail";
    }

    @RequestMapping("gameDataGetAction")
    @ResponseBody
    public List<List<PlayerDataDto>> getGameData(HttpServletRequest request) {
        Integer gameId = Integer.valueOf(request.getParameter("gameId"));
        List<PlayerDataDto> mySchoolplayerDataDtos = userService.getMySchoolPlayerData(gameId);
        List<PlayerDataDto> rivalPlayerDataDtos = userService.getRivalPlayerData(gameId);
        List<List<PlayerDataDto>> list = new ArrayList<List<PlayerDataDto>>();
        list.add(mySchoolplayerDataDtos);
        list.add(rivalPlayerDataDtos);
        return list;
    }

    @RequestMapping("chartDataGetAction")
    @ResponseBody
    public List<PlayerDataDto> getChartData(HttpServletRequest request) {
        try {
            Integer gameId = Integer.valueOf(request.getParameter("gameId"));
            List<PlayerDataDto> mySchoolplayerDataDtos = userService.getMySchoolPlayerData(gameId);
            List<PlayerDataDto> rivalPlayerDataDtos = userService.getRivalPlayerData(gameId);
            PlayerDataDto sum = new PlayerDataDto(mySchoolplayerDataDtos);
            PlayerDataDto sum2 = new PlayerDataDto(rivalPlayerDataDtos);
            List<PlayerDataDto> list = new ArrayList<PlayerDataDto>();
            list.add(sum);
            list.add(sum2);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @RequestMapping("gameSchoolDataGetAction")
    @ResponseBody
    public MngResult<List<PlayerDataDto>> getSchoolGameData(HttpServletRequest request) {
        Integer gameId = Integer.valueOf(request.getParameter("gameId"));
        List<PlayerDataDto> mySchoolplayerDataDtos = userService.getMySchoolPlayerData(gameId);
        PlayerDataDto sum = new PlayerDataDto(mySchoolplayerDataDtos);
        mySchoolplayerDataDtos.add(sum);
        return new MngResult<List<PlayerDataDto>>(true, mySchoolplayerDataDtos, mySchoolplayerDataDtos.size());
    }

    @RequestMapping("gameRivalDataGetAction")
    @ResponseBody
    public MngResult<List<PlayerDataDto>> getRivalGameData(HttpServletRequest request) {
        Integer gameId = Integer.valueOf(request.getParameter("gameId"));
        List<PlayerDataDto> rivalPlayerDataDtos = userService.getRivalPlayerData(gameId);
        PlayerDataDto sum = new PlayerDataDto(rivalPlayerDataDtos);
        rivalPlayerDataDtos.add(sum);
        return new MngResult<List<PlayerDataDto>>(true, rivalPlayerDataDtos, rivalPlayerDataDtos.size());
    }

    @RequestMapping("/gameDataEditPage")
    public String getGameDataEditPage(HttpServletRequest request, Model model) {
        Integer gameId = Integer.valueOf(request.getParameter("gameId").toString());
        GameExample gameExample = new GameExample();
        gameExample.createCriteria().andIdEqualTo(gameId);
        Game game = gameService.selectGameMsgByExample(gameExample).get(0);
        model.addAttribute("game", game);
        model.addAttribute("school", schoolService.selectOne(game.getSchoolId()).getSchName());
        return "game/gameDataEdit";
    }

    @RequestMapping("/gameDataEditAction")
    @ResponseBody
    public Map<String, Object> gameDataEdit(@RequestBody List<List<PlayerDataDto>> playerDataDtos, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Integer gameId = Integer.valueOf(request.getParameter("gameId"));
            userService.updateMySchoolPlayerData(playerDataDtos.get(0));
            userService.updateRivalPlayerData(gameId, playerDataDtos.get(1));
            map.put("success", true);
        } catch (Exception e) {
            map.put("success", false);
        }
        return map;
    }

    @RequestMapping("/gameGetAction")
    @ResponseBody
    public MngResult<List<GameDto>> getGames(int limit, int offset) {
        return gameService.getGames(limit, offset);
    }
}
