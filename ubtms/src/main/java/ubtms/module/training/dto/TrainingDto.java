package ubtms.module.training.dto;

import ubtms.module.training.entity.Training;

/**
 * Created by jinzhany on 2017/3/19.
 */
public class TrainingDto extends Training {
    String schName;

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }
}
