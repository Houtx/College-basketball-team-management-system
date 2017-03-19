package ubtms.module.training.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.basic.util.DateUtil;
import ubtms.module.training.dto.TrainingDto;
import ubtms.module.training.entity.Training;
import ubtms.module.training.entity.TrainingItem;
import ubtms.module.training.entity.TrainingQuery;

import java.util.List;
import java.util.Random;
/**
 * Created by jinzhany on 2017/3/19.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class TrainingMapperTest {
    @Autowired
    TrainingItemMapper trainingItemMapper;
    @Autowired
    TrainingMapper trainingMapper;

    @Test
    public void makeTrainingTestData(){
        Random random = new Random();
        String title = String.valueOf(DateUtil.randomDate("2010-01-01", "2017-03-17").getTime());
        int schId =2;
        trainingMapper.insert(new Training(title,schId));
        int trainingId = trainingMapper.selectLastData().getId();
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= 4; j++) {
                int type = random.nextInt(4)+1;
                String content = String.valueOf(random.nextInt(999));
                Integer cost = random.nextInt(179)+1;
                Byte day =new Byte(String.valueOf(i));
                TrainingItem trainingItem = new TrainingItem((byte)type,content,cost,day,trainingId);
                trainingItemMapper.insert(trainingItem);
            }
        }
    }

    @Test
    public void getData(){
        TrainingQuery trainingQuery = new TrainingQuery();
        trainingQuery.setLimit(10);
        trainingQuery.setOffset(0);
       // trainingQuery.setTitle("标题");
        int total = trainingMapper.countWithLimit(trainingQuery);
        List<TrainingDto> trainings = trainingMapper.selectWithLimit(trainingQuery);
    }

}