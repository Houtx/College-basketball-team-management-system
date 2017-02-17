package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.RoleMapper;
import ubtms.module.role.entity.*;
import ubtms.module.role.service.MenuService;
import ubtms.module.role.service.PermissionService;
import ubtms.module.role.service.RoleService;
import ubtms.module.role.service.SubMenuService;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private MenuService menuService;
    @Autowired
    private SubMenuService subMenuService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private UserService userService;
    
    @Override
    public int updateByPrimaryKey(List<Role> roles){
    	for(Role role:roles){
    		roleMapper.updateByPrimaryKeySelective(role);
    	}
    	return roles.size();
    }


    @Override
    public int savePlayerRole(int schId) {
        Role role = new Role("球员", schId, new Byte("1"));
        roleMapper.insert(role);
        int roleId = selectOne(role).getId();
        return 0;
    }

    @Override
    public int saveCoachRole(int schId) {
        Role role = new Role("教练", schId, new Byte("1"));
        roleMapper.insert(role);
        int roleId = selectOne(role).getId();
        return 1;
    }

    @Override
    public int saveLeaderRole(int schId) {
        Role role = new Role("球队领队", schId, new Byte("1"));
        roleMapper.insert(role);
        int roleId = selectOne(role).getId();
        Menu teamMng = new Menu("&#xe62d;", "球队管理", roleId, new Byte("1"), 1);
        Menu teamCommunity = new Menu("&#xe62d;", "球队动态", roleId, new Byte("1"), 2);
        Menu userMng = new Menu("&#xe62d;", "人员管理", roleId, new Byte("1"), 3);
        Menu personMsg = new Menu("&#xe62d;", "个人信息", roleId, new Byte("1"), 4);

        List<Menu> menus = new ArrayList<Menu>();
        menus.add(teamMng);
        menus.add(teamCommunity);
        menus.add(userMng);
        menus.add(personMsg);
        menuService.saveAll(menus);

        int teamMngId = menuService.selectOne(teamMng).getId();
        //SubMenu gameMng = new SubMenu(teamMngId, "/game/", "赛程管理", 1, new Byte("1"));
        SubMenu attendanceMng = new SubMenu(teamMngId, "/game/", "考勤管理", 2, new Byte("1"));
        //SubMenu trainingMng = new SubMenu(teamMngId, "/game/", "训练计划", 3, new Byte("1"));
        SubMenu billMng = new SubMenu(teamMngId, "/bill/", "账务管理", 4, new Byte("1"));
        SubMenu playerData = new SubMenu(teamMngId, "/game/", "球员数据", 5, new Byte("1"));
        SubMenu teamMsg = new SubMenu(teamMngId, "/game/", "球队信息", 6, new Byte("1"));
        List<SubMenu> teamMngSubMenus = new ArrayList<SubMenu>();
        //teamMngSubMenus.add(gameMng);
        teamMngSubMenus.add(attendanceMng);
        //teamMngSubMenus.add(trainingMng);
        teamMngSubMenus.add(billMng);
        teamMngSubMenus.add(playerData);
        teamMngSubMenus.add(teamMsg);
        subMenuService.saveAll(teamMngSubMenus);

        int teamCommunityId = menuService.selectOne(teamCommunity).getId();
        SubMenu teamCommunitys = new SubMenu(teamCommunityId, "/game/", "球队动态", 1, new Byte("1"));
        SubMenu articleMng = new SubMenu(teamCommunityId, "/game/", "帖子管理", 2, new Byte("1"));
        SubMenu commentMng = new SubMenu(teamCommunityId, "/game/", "评论管理", 3, new Byte("1"));
        SubMenu replyMng = new SubMenu(teamCommunityId, "/bill/", "回复管理", 4, new Byte("1"));
        List<SubMenu> teamCommunitySubMenus = new ArrayList<SubMenu>();
        teamCommunitySubMenus.add(teamCommunitys);
        teamCommunitySubMenus.add(articleMng);
        teamCommunitySubMenus.add(commentMng);
        teamCommunitySubMenus.add(replyMng);
        subMenuService.saveAll(teamCommunitySubMenus);

        int personMsgId = menuService.selectOne(personMsg).getId();
        SubMenu baseMng = new SubMenu(personMsgId, "/game/", "基本信息", 1, new Byte("1"));
        //SubMenu passGame = new SubMenu(personMsgId, "/game/", "曾参与比赛", 2, new Byte("1"));
        //SubMenu attendanceP = new SubMenu(personMsgId, "/game/", "考勤记录", 3, new Byte("1"));
        List<SubMenu> personMsgSubMenus = new ArrayList<SubMenu>();
        personMsgSubMenus.add(baseMng);
        //personMsgSubMenus.add(passGame);
        //personMsgSubMenus.add(attendanceP);
        subMenuService.saveAll(personMsgSubMenus);


        int userMngId = menuService.selectOne(userMng).getId();
        //SubMenu schoolMng = new SubMenu(userMngId, "/school/schoolMngPage", "学校管理", 1, new Byte("1"));
        SubMenu roleMng = new SubMenu(userMngId, "/school/roleMng", "角色管理", 2, new Byte("1"));
        SubMenu userMngs = new SubMenu(userMngId, "/school/userMng", "人员管理", 3, new Byte("1"));
        List<SubMenu> userMngSubMenus = new ArrayList<SubMenu>();
        //userMngSubMenus.add(schoolMng);
        userMngSubMenus.add(roleMng);
        userMngSubMenus.add(userMngs);
        subMenuService.saveAll(userMngSubMenus);
        return 1;
    }

    @Override
    public List<Role> selectByExample(RoleExample roleExample) {
        List<Role> roles = roleMapper.selectByExample(roleExample);
        for (int i=0;i<roles.size();i++) {
            roles.get(i).setSchool(schoolService.selectOne(roles.get(i).getSchoolId()));
        }
        return roles;
    }

    @Override
    public Role selectOne(Role role) {
        List<Role> list = roleMapper.select(role);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<Role> select(Role role) {
        return roleMapper.select(role);
    }

    @Override
    public Role selectByPrimaryKey(Integer id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int countByExample(RoleExample roleExample) {
        return roleMapper.countByExample(roleExample);

    }

    @Override
    public int updatePermissionCascade(List<Menu> menus) {
        for (Menu menu:menus){
            menuService.updateByPrimaryKeySelective(menu);
            List<SubMenu> subMenus = menu.getSubMenus();
            for (SubMenu subMenu : subMenus) {
                subMenuService.updateByPrimaryKeySelective(subMenu);
                List<Permission> permissions = subMenu.getPermissions();
                for (Permission permission : permissions) {
                    permissionService.updateByPrimaryKeySelective(permission);
                }
            }
        }
        return 1;
    }
}