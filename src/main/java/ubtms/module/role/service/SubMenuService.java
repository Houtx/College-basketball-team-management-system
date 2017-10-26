package ubtms.module.role.service;

import ubtms.module.role.entity.SubMenu;
import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface SubMenuService {
    int save(SubMenu subMenu);
    int saveAll(List<SubMenu> subMenus);
    SubMenu selectOne(SubMenu subMenu);
    List<SubMenu> select(SubMenu subMenu);
    int updateByPrimaryKeySelective(SubMenu subMenu);
}
