package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.RoleMapper;
import ubtms.module.role.entity.Role;
import ubtms.module.role.service.RoleService;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public int saveRole() {
        return 0;
    }

    @Override
    public Role selectRoleById(Integer id) {
        //return roleMapper.selectByPrimaryKey(id);
        return null;
    }
}