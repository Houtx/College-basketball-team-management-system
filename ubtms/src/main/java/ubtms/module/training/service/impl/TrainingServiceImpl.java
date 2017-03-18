package ubtms.module.training.service.impl;

import ubtms.module.training.service.TrainingService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by jinzhany on 2017/3/18.
 */
public class TrainingServiceImpl implements TrainingService {
    @Override
    public int saveTraining(HttpServletRequest request) {
        request.getParameter("schoolName");
        request.getParameter("title");
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= 5; j++) {
               String type = request.getParameter("tType"+i+""+j);
               String content = request.getParameter("tContent"+i+""+j);
               String cost = request.getParameter("tCost"+i+""+j);
               byte day = (byte) i;
            }
        }
        return 0;
    }
}
