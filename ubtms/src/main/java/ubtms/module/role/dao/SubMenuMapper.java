package ubtms.module.role.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.role.entity.SubMenu;
import ubtms.module.role.entity.SubMenuExample;

public interface SubMenuMapper {
    int countByExample(SubMenuExample example);

    int deleteByExample(SubMenuExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SubMenu record);

    int insertSelective(SubMenu record);

    List<SubMenu> selectByExample(SubMenuExample example);

    SubMenu selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SubMenu record, @Param("example") SubMenuExample example);

    int updateByExample(@Param("record") SubMenu record, @Param("example") SubMenuExample example);

    int updateByPrimaryKeySelective(SubMenu record);

    int updateByPrimaryKey(SubMenu record);
}