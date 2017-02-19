package ubtms.module.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.role.entity.Menu;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/game")
public class GameController {
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



    @RequestMapping("/gameAddAndEditPage")
    public String getOpPage(HttpServletRequest request) {
        String opType = request.getParameter("opType");
        //1编辑 2添加
        if (opType.equals("1")) {

        }else {

        }
        return "/game/gameAddAndEdit";
    }

    @RequestMapping("/gameGetAction")
    public String getGames(HttpServletRequest request) {

        return null;
    }
}
