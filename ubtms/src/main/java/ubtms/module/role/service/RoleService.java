package ubtms.module.role.service;

import ubtms.module.role.entity.Role;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface RoleService {
    int saveRole();
    Role selectByPrimaryKey(Integer id);
}
