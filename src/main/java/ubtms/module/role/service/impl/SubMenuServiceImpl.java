package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.SubMenuMapper;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;
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
        //1增 2删 3改 4查
        for (SubMenu subMenu : subMenus) {
            save(subMenu);
            int subMenuId = selectOne(subMenu).getId();
            List<Permission> permissions = new ArrayList<Permission>();
            if (subMenu.getName().equals("基本信息") || subMenu.getName().equals("球队信息") || subMenu.getName().equals("角色管理")) {
                Permission permission3 = new Permission(subMenuId, (byte) 3, (byte) 1, null);
                permissions.add(permission3);
                Permission permission4 = new Permission(subMenuId, (byte) 4, (byte) 1, null);
                permissions.add(permission4);
            } else if (subMenu.getName().equals("个人评论") || subMenu.getName().equals("评论管理") || subMenu.getName().equals("个人回复") || subMenu.getName().equals("回复管理")) {
                Permission permission2 = new Permission(subMenuId, (byte) 2, (byte) 1, null);
                permissions.add(permission2);
                Permission permission4 = new Permission(subMenuId, (byte) 4, (byte) 1, null);
                permissions.add(permission4);
            } else if (subMenu.getName().equals("球员数据") || subMenu.getName().equals("个人数据")||subMenu.getName().equals("考勤记录")) {
                Permission permission4 = new Permission(subMenuId, (byte) 4, (byte) 1, null);
                permissions.add(permission4);
            } else {
                for (int i = 1; i <= 4; i++) {
                    Permission permission = new Permission(subMenuId, new Byte(String.valueOf(i)), new Byte("1"), i);
                    permissions.add(permission);
                }
            }
            permissionService.saveAll(permissions);
        }
        return 1;
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
