package ubtms.module.training.service.impl;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
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
        trainingMapper.insert(new Training(title, schId));
        int trainingId = trainingMapper.selectLastData().getId();
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= 4; j++) {
                String type = request.getParameter("tType" + i + "" + j);
                String content = null;
                Integer cost = null;
                if (!request.getParameter("tContent" + i + "" + j).isEmpty()) {
                    content = request.getParameter("tContent" + i + "" + j);
                }
                if (!request.getParameter("tCost" + i + "" + j).isEmpty()) {
                    cost = Integer.valueOf(request.getParameter("tCost" + i + "" + j));
                }
                Byte day = new Byte(String.valueOf(i));
                TrainingItem trainingItem = new TrainingItem(new Byte(type), content, cost, day, trainingId);
                trainingItemMapper.insert(trainingItem);
            }
        }
        return 1;
    }

    @Override
    public int updateTraining(TrainingDto trainingDto) {
        int schId = schoolService.selectOne(new School(trainingDto.getSchName())).getSchId();
        trainingDto.setSchoolId(schId);
        trainingMapper.updateByPrimaryKey(trainingDto);
        for (TrainingItem item : trainingDto.getTrainingItems()) {
            trainingItemMapper.updateByPrimaryKey(item);
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

    @Override
    public HSSFWorkbook exportExcel(TrainingDto trainingDto) {
        //创建excel工作簿
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建第一个sheet（页），命名为 new sheet
        Sheet sheet = wb.createSheet("training");
        Row schoolRow = sheet.createRow(0);
        Cell schoolSell = schoolRow.createCell(0);
        schoolSell.setCellValue(trainingDto.getSchName());
        Row titleRow = sheet.createRow(2);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue(trainingDto.getTitle());

        Row row = sheet.createRow(4);
        row.createCell(0).setCellValue("日期");
        row.createCell(1).setCellValue("类型");
        row.createCell(2).setCellValue("内容");
        row.createCell(3).setCellValue("用时(分)");

        sheet.addMergedRegion(new CellRangeAddress(5, 8, 0, 0));
        sheet.addMergedRegion(new CellRangeAddress(9, 12, 0, 0));
        sheet.addMergedRegion(new CellRangeAddress(13, 16, 0, 0));
        sheet.addMergedRegion(new CellRangeAddress(17, 20, 0, 0));
        sheet.addMergedRegion(new CellRangeAddress(21, 24, 0, 0));
        Row rowDay1 = sheet.createRow(5);
        Row rowDay2 = sheet.createRow(9);
        Row rowDay3 = sheet.createRow(13);
        Row rowDay4 = sheet.createRow(17);
        Row rowDay5 = sheet.createRow(21);

        List<TrainingItem> trainingItemList = trainingDto.getTrainingItems();
        for (int i = 5, j = 0; i <= 24 && j < trainingItemList.size(); i++, j++) {
            TrainingItem trainingItem = trainingItemList.get(j);
            Row dataRow = sheet.createRow(i);
            String type = "";
            String content = "";
            String cost = "";
/*            1身体训练
            2 技术训练
            3 战术训练
            4 理论知识*/
            switch (trainingItem.getItem()) {
                case 1:
                    type = "身体训练";
                    break;
                case 2:
                    type = "技术训练";
                    break;
                case 3:
                    type = "战术训练";
                    break;
                case 4:
                    type = "理论知识";
                    break;
            }

            if (trainingItem.getContent() != null) {
                content = trainingItem.getContent();
            }
            if (trainingItem.getCost() != null) {
                cost = String.valueOf(trainingItem.getCost());
            }
            dataRow.createCell(1).setCellValue(type);
            dataRow.createCell(2).setCellValue(content);
            dataRow.createCell(3).setCellValue(cost);
        }

        Cell cellDay1 = rowDay1.createCell(0);
        cellDay1.setCellValue("星期一");
        Cell cellDay2 = rowDay2.createCell(0);
        cellDay2.setCellValue("星期二");
        Cell cellDay3 = rowDay3.createCell(0);
        cellDay3.setCellValue("星期三");
        Cell cellDay4 = rowDay4.createCell(0);
        cellDay4.setCellValue("星期四");
        Cell cellDay5 = rowDay5.createCell(0);
        cellDay5.setCellValue("星期四");
        return wb;
    }
}
