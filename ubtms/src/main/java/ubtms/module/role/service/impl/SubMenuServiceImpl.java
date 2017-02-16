package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.MenuMapper;
import ubtms.module.role.dao.SubMenuMapper;
import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;
import ubtms.module.role.service.MenuService;
import ubtms.module.role.service.PermissionService;
import ubtms.module.role.service.SubMenuService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/12.
 */
@Service
public class SubMenuServiceImpl implements SubMenuService {
    @Autowired
    SubMenuMapper subMenuMapper;

    @Autowired
    PermissionService permissionService;

    @Override
    public int save(SubMenu subMenu) {
        return subMenuMapper.insert(subMenu);
    }

    @Override
    public int saveAll(List<SubMenu> subMenus) {
        for (SubMenu subMenu:subMenus) {
            save(subMenu);
            int subMenuId = selectOne(subMenu).getId();
            List<Permission> permissions = new ArrayList<Permission>();
            for (int i=1;i<=4;i++) {
                Permission permission = new Permission(subMenuId,new Byte(String.valueOf(i)),new Byte("1"),i);
                permissions.add(permission);
            }
            permissionService.saveAll(permissions);
        }
        return 0;
    }

    @Override
    public SubMenu selectOne(SubMenu subMenu) {
        List<SubMenu> list = subMenuMapper.select(subMenu);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<SubMenu> select(SubMenu subMenu) {
        return subMenuMapper.select(subMenu);
    }

    @Override
    public int updateByPrimaryKeySelective(SubMenu subMenu) {
        return subMenuMapper.updateByPrimaryKeySelective(subMenu);
    }

}
