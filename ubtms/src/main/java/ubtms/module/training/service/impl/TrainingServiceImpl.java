package ubtms.module.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.training.dao.TrainingItemMapper;
import ubtms.module.training.dao.TrainingMapper;
import ubtms.module.training.dto.TrainingDto;
import ubtms.module.training.entity.Training;
import ubtms.module.training.entity.TrainingItem;
import ubtms.module.training.entity.TrainingItemExample;
import ubtms.module.training.entity.TrainingQuery;
import ubtms.module.training.service.TrainingService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by jinzhany on 2017/3/18.
 */
@Service
public class TrainingServiceImpl implements TrainingService {
    @Autowired
    TrainingMapper trainingMapper;
    @Autowired
    TrainingItemMapper trainingItemMapper;
    @Autowired
    SchoolService schoolService;

    @Override
    public int saveTraining(HttpServletRequest request) {
        String schoolName = request.getParameter("schoolName");
        String title = request.getParameter("title");
        int schId = schoolService.selectOne(new School(schoolName)).getSchId();
        trainingMapper.insert(new Training(title,schId));
        int trainingId = trainingMapper.selectLastData().getId();
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= 4; j++) {
               String type = request.getParameter("tType"+i+""+j);
                String content=null;
                Integer cost = null;
                if (!request.getParameter("tContent"+i+""+j).isEmpty()){
                    content = request.getParameter("tContent"+i+""+j);
                }
               if(!request.getParameter("tCost"+i+""+j).isEmpty()){
                   cost = Integer.valueOf(request.getParameter("tCost" + i + "" + j));
                }
               Byte day =new Byte(String.valueOf(i));
               TrainingItem trainingItem = new TrainingItem(new Byte(type),content,cost,day,trainingId);
                trainingItemMapper.insert(trainingItem);
            }
        }
        return 1;
    }

    @Override
    public List<TrainingDto> getTrainingMng(TrainingQuery trainingQuery) {
        return trainingMapper.selectWithLimit(trainingQuery);
    }

    @Override
    public int countTrainingMng(TrainingQuery trainingQuery) {
        return trainingMapper.countWithLimit(trainingQuery);
    }

    @Override
    public TrainingDto getTrainingById(Integer id) {
        Training training = trainingMapper.selectByPrimaryKey(id);
        TrainingItemExample trainingItemExample = new TrainingItemExample();
        trainingItemExample.createCriteria().andTraingingIdEqualTo(id);
        List<TrainingItem> trainingItems = trainingItemMapper.selectByExample(trainingItemExample);
        training.setTrainingItems(trainingItems);
        TrainingDto trainingDto = new TrainingDto();
        trainingDto.setTrainingItems(training.getTrainingItems());
        trainingDto.setId(training.getId());
        trainingDto.setTitle(training.getTitle());
        trainingDto.setSchoolId(training.getSchoolId());
        String schName = schoolService.selectOne(training.getSchoolId()).getSchName();
        trainingDto.setSchName(schName);
        return trainingDto;
    }

    @Override
    public int delTraining(List<Training> trainings) {
        for (Training training : trainings) {
            trainingMapper.deleteByPrimaryKey(training.getId());
        }
        return trainings.size();
    }
}
