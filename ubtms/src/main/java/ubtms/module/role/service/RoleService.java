package ubtms.module.role.service;

import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Role;
import ubtms.module.role.entity.RoleExample;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface RoleService {
    int savePlayerRole(int roleId);
    int saveCoachRole(int roleId);
    int saveLeaderRole(int roleId);
    List<Role> selectByExample(RoleExample roleExample);
    Role selectOne(Role role);
    List<Role> select(Role role);
    Role selectByPrimaryKey(Integer id);
    Role selectByPrimaryKeyNoRelative(Integer id);
    int countByExample(RoleExample roleExample);
    int updatePermissionCascade(List<Menu> menus);
    int updateByPrimaryKey(List<Role> roles);
}
