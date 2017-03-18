package ubtms.module.training.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by jinzhany on 2017/3/18.
 */
@Service
public interface TrainingService {
    int saveTraining(HttpServletRequest request);
}
