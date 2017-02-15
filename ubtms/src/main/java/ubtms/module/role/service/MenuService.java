package ubtms.module.role.service;

import ubtms.module.role.entity.Menu;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface MenuService {
    int save(Menu menu);
    int saveAll(List<Menu> menus);
    Menu selectOne(Menu menu);
    List<Menu> select(Menu menu);
}
