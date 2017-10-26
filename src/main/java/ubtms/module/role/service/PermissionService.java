package ubtms.module.role.service;

import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface PermissionService {
    int saveAll(List<Permission> permissions);
    int save(Permission permission);
    int updateByPrimaryKeySelective(Permission permission);
}
