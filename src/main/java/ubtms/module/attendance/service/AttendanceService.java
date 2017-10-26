package ubtms.module.attendance.service;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import ubtms.module.attendance.dto.AttendanceDto;
import ubtms.module.attendance.entity.Attendance;
import ubtms.module.attendance.entity.AttendanceQuery;
import ubtms.module.training.dto.TrainingDto;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

/**
 * Created by jinzhany on 2017/3/21.
 */
public interface AttendanceService {
    int delAttendances(List<Attendance> attendances);

    int updateAttendance(int id, String schoolName, String aDate, String stuName, String attendance, String reason);

    int saveAttendance(String schoolName, String aDate, String stuName, String attendance, String reason);

    List<AttendanceDto> getAttendances(AttendanceQuery attendanceQuery);

    int countAttendances(AttendanceQuery attendanceQuery);

    AttendanceDto getAttendanceById(Integer id);

    XSSFWorkbook exportExcel(String schoolName, StringBuilder strDate);

    void importExcel(MultipartFile multipartFile) throws Exception;
}
