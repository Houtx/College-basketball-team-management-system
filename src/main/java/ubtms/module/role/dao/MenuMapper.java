package ubtms.module.role.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.MenuExample;

public interface MenuMapper {
    int countByExample(MenuExample example);

    int deleteByExample(MenuExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertAll(List<Menu> menus);

    int insertSelective(Menu record);

    List<Menu> selectByExample(MenuExample example);

    Menu selectByPrimaryKey(Integer id);

    Menu selectByRoleId(Integer id);

    List<Menu> select(Menu menu);

    int updateByExampleSelective(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByExample(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
}