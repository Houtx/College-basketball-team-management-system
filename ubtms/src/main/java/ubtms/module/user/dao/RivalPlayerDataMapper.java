package ubtms.module.user.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.user.entity.RivalPlayerData;
import ubtms.module.user.entity.RivalPlayerDataExample;

public interface RivalPlayerDataMapper {
    int countByExample(RivalPlayerDataExample example);

    int deleteByExample(RivalPlayerDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RivalPlayerData record);

    int insertSelective(RivalPlayerData record);

    List<RivalPlayerData> selectByExample(RivalPlayerDataExample example);

    RivalPlayerData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RivalPlayerData record, @Param("example") RivalPlayerDataExample example);

    int updateByExample(@Param("record") RivalPlayerData record, @Param("example") RivalPlayerDataExample example);

    int updateByPrimaryKeySelective(RivalPlayerData record);

    int updateByPrimaryKey(RivalPlayerData record);
}