package ubtms.module.training.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.training.dto.TrainingDto;
import ubtms.module.training.entity.Training;
import ubtms.module.training.entity.TrainingExample;
import ubtms.module.training.entity.TrainingQuery;

public interface TrainingMapper {
    List<TrainingDto> selectWithLimit(TrainingQuery trainingQuery);
    int  countWithLimit(TrainingQuery trainingQuery);
    int countByExample(TrainingExample example);

    int deleteByExample(TrainingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Training record);

    int insertSelective(Training record);

    List<Training> selectByExample(TrainingExample example);

    Training selectLastData();

    Training selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Training record, @Param("example") TrainingExample example);

    int updateByExample(@Param("record") Training record, @Param("example") TrainingExample example);

    int updateByPrimaryKeySelective(Training record);

    int updateByPrimaryKey(Training record);
}