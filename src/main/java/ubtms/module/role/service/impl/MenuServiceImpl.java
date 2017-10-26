package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.MenuMapper;
import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.MenuExample;
import ubtms.module.role.service.MenuService;
import ubtms.module.school.entity.School;

import java.util.List;

/**
 * Created by jinzhany on 2017/2/12.
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public int save(Menu menu) {
        return 0;
    }

    @Override
    public int saveAll(List<Menu> menus) {
        return menuMapper.insertAll(menus);
    }

    @Override
    public Menu selectOne(Menu menu) {
        List<Menu> menus = menuMapper.select(menu);
        if (menus.size() > 0) {
            return menus.get(0);
        }
        return null;
    }

    @Override
    public List<Menu> select(Menu menu) {
        return menuMapper.select(menu);
    }

    @Override
    public int updateByPrimaryKeySelective(Menu menu) {
        return menuMapper.updateByPrimaryKeySelective(menu);
    }


}
