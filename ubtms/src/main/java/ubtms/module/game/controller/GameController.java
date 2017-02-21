package ubtms.module.game.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ubtms.basic.dto.MngResult;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.game.dto.GameDto;
import ubtms.module.game.entity.Game;
import ubtms.module.game.entity.GameExample;
import ubtms.module.game.service.GameService;
import ubtms.module.role.entity.Menu;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/game")
public class GameController {
    @Autowired
    private GameService gameService;


    @RequestMapping("/gameMngPage")
    public String getGameMngPage(HttpServletRequest request) {
        if (request.getSession().getAttribute("gameAddP") == null) {
            List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
            int[] perssions = PermissionUtil.getPermission(menus, "赛程管理");
            request.getSession().setAttribute("gameAddP", perssions[1]);
            request.getSession().setAttribute("gameDelP", perssions[2]);
            request.getSession().setAttribute("gameEditP", perssions[3]);
            request.getSession().setAttribute("gameDetailP", perssions[4]);
        }
        return "/game/gameMng";
    }


    @RequestMapping("/gameMsgAddAndEditPage")
    public String getOpPage(HttpServletRequest request, Model model) {
        String opType = request.getParameter("opType");
        //1编辑 2添加
        model.addAttribute("opType",opType);
        return "/game/gameAddAndEdit";
    }


    @RequestMapping("/gameMsgAddAndEditAction")
    @ResponseBody
    public Map<String, Object> addAndEditGameMsg(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String opType = request.getParameter("opType");
            //1编辑 2添加
            Game game = new Game();
            String schName = request.getParameter("schoolName");
            String rival = request.getParameter("rival");
            String startTime = request.getParameter("startTime");
            String place = request.getParameter("place");
            String remark = request.getParameter("remark");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = sdf.parse(startTime);
            game.setStartTime(date);
            game.setRival(rival);
            game.setPlace(place);
            game.setRemark(remark);
            if (opType.equals("1")) {
                Integer id = Integer.valueOf(request.getParameter("id"));
                game.setId(id);
                gameService.updateGameMsgById(game);
                map.put("success", true);
                map.put("msg", "更新成功");
            } else {
                gameService.saveGameMsg(game,schName);
                map.put("success", true);
                map.put("msg", "添加成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "系统异常");
        }
        return map;
    }

    @RequestMapping("/gameDetailPage")
    public String getGameMsgDetail(HttpServletRequest request) {
        String id = request.getParameter("id");
        GameExample gameExample = new GameExample();
        gameExample.createCriteria().andIdEqualTo(Integer.valueOf(id));
        Game game = gameService.selectGameMsgByExample(gameExample).get(0);

        return null;
    }


    @RequestMapping("gameDataEditPage")
    public String getGameDataEditPage(HttpServletRequest request,Model model){
        model.addAttribute("gameId", request.getParameter("gameId"));
        return "game/gameDataEdit";
    }

    @RequestMapping("/gameDataEditAction")
    @ResponseBody
    public MngResult<List<GameDto>> gameDataEdit() {

        return null;
    }

    @RequestMapping("/gameGetAction")
    @ResponseBody
    public MngResult<List<GameDto>> getGames(int limit, int offset) {
        return gameService.getGames(limit, offset);
    }
}
