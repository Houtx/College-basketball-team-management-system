package ubtms.module.training.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.training.entity.TrainingItem;
import ubtms.module.training.entity.TrainingItemExample;

public interface TrainingItemMapper {
    int countByExample(TrainingItemExample example);

    int deleteByExample(TrainingItemExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TrainingItem record);

    int insertSelective(TrainingItem record);

    List<TrainingItem> selectByExample(TrainingItemExample example);

    TrainingItem selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TrainingItem record, @Param("example") TrainingItemExample example);

    int updateByExample(@Param("record") TrainingItem record, @Param("example") TrainingItemExample example);

    int updateByPrimaryKeySelective(TrainingItem record);

    int updateByPrimaryKey(TrainingItem record);
}