package ubtms.module.training.controller;

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
import ubtms.module.training.entity.Training;
import ubtms.module.training.service.TrainingService;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.service.UserService;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by jinzhany on 2017/3/18.
 */
@Controller
@RequestMapping("/training")
public class TrainingController {
    @Autowired
    private GameService gameService;
    @Autowired
    private UserService userService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private TrainingService trainingService;

    @RequestMapping("/trainingMngPage")
    public String getTrainingMngPage(HttpServletRequest request) {
        List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
        int[] perssions = PermissionUtil.getPermission(menus, "训练计划");
        request.getSession().setAttribute("trainingAddP", perssions[1]);
        request.getSession().setAttribute("trainingDelP", perssions[2]);
        request.getSession().setAttribute("trainingEditP", perssions[3]);
        request.getSession().setAttribute("trainingDetailP", perssions[4]);
        return "/training/trainingMng";
    }


    @RequestMapping("/trainingAddAndEditPage")
    public String getOpPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        //1编辑 2添加
        if (opType.equals("1")) {
            Integer gameId = Integer.valueOf(request.getParameter("gameId"));
            Game game = gameService.getById(gameId);
            String test = schoolService.selectOne(game.getSchoolId()).getSchName();
            model.addAttribute("mySchoolName", schoolService.selectOne(game.getSchoolId()).getSchName());
            model.addAttribute("gameDetail", game);
        }else {

        }
        model.addAttribute("opType", opType);
        return "/training/trainingAddAndEdit";
    }

    @RequestMapping("/trainingDelAction")
    @ResponseBody
    public Map<String, Object> delTraining(@RequestBody List<Training> trainings) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //gameService.delGame(games);
            map.put("success", true);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败");
        }
        return map;
    }

    @RequestMapping("/trainingAddAndEditAction")
    @ResponseBody
    public Map<String, Object> addAndEditGameMsg(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {

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



    @RequestMapping("gameSchoolDataGetAction")
    @ResponseBody
    public MngResult<List<PlayerDataDto>> getSchoolGameData(HttpServletRequest request) {
        Integer gameId = Integer.valueOf(request.getParameter("gameId"));
        List<PlayerDataDto> mySchoolplayerDataDtos = userService.getMySchoolPlayerData(gameId);
        PlayerDataDto sum = new PlayerDataDto(mySchoolplayerDataDtos);
        mySchoolplayerDataDtos.add(sum);
        return new MngResult<List<PlayerDataDto>>(true, mySchoolplayerDataDtos, mySchoolplayerDataDtos.size());
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


    @RequestMapping("/trainingGetAction")
    @ResponseBody
    public MngResult<List<GameDto>> getTrainings(int limit, int offset,String searchSchoolName,String searchTitle) {

        return gameService.getGames(limit, offset);
    }
}
