package ubtms.module.user.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.user.entity.SchoolPlayerData;
import ubtms.module.user.entity.SchoolPlayerDataExample;

public interface SchoolPlayerDataMapper {
    int countByExample(SchoolPlayerDataExample example);

    int deleteByExample(SchoolPlayerDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SchoolPlayerData record);

    int insertSelective(SchoolPlayerData record);

    List<SchoolPlayerData> selectByExample(SchoolPlayerDataExample example);

    SchoolPlayerData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SchoolPlayerData record, @Param("example") SchoolPlayerDataExample example);

    int updateByExample(@Param("record") SchoolPlayerData record, @Param("example") SchoolPlayerDataExample example);

    int updateByPrimaryKeySelective(SchoolPlayerData record);

    int updateByPrimaryKey(SchoolPlayerData record);
}