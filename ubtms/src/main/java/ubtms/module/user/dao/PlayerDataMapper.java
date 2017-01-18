package ubtms.module.user.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.user.entity.PlayerData;
import ubtms.module.user.entity.PlayerDataExample;

public interface PlayerDataMapper {
    int countByExample(PlayerDataExample example);

    int deleteByExample(PlayerDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PlayerData record);

    int insertSelective(PlayerData record);

    List<PlayerData> selectByExample(PlayerDataExample example);

    PlayerData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PlayerData record, @Param("example") PlayerDataExample example);

    int updateByExample(@Param("record") PlayerData record, @Param("example") PlayerDataExample example);

    int updateByPrimaryKeySelective(PlayerData record);

    int updateByPrimaryKey(PlayerData record);
}