package ubtms.module.attendance.dao;

import org.apache.commons.lang3.RandomUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.attendance.dto.AttendanceDto;
import ubtms.module.attendance.entity.Attendance;
import ubtms.module.attendance.entity.AttendanceQuery;
import ubtms.module.attendance.service.AttendanceService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/3/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class AttendanceMapperTest {
    @Autowired
    AttendanceMapper attendanceMapper;
    @Autowired
    AttendanceService attendanceService;

    @Test
    public void createTestData(){
        Attendance attendance = new Attendance();

        for (int i=1;i<=31;i++) {
            String attend = String.valueOf(RandomUtils.nextInt(0, 2));
            //attend = "0";
            String reason = "";
            if (attend.equals("0")) {
                reason = String.valueOf(RandomUtils.nextInt(0, 3));
            }
            attendanceService.saveAttendance("北理珠", "2017-03-"+i, "叶同学", attend, reason);
        }
    }


    @Test
    public void selectByMngQuery() throws Exception {
        AttendanceQuery attendanceQuery = new AttendanceQuery();
 //       attendanceQuery.setStuName("叶");
 //       attendanceQuery.setSchoolName("北理珠");
//        attendanceQuery.setDate(new Date());
//        String date = "2017-04-01";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date endDate = sdf.parse(date);
//        attendanceQuery.setEndDate(endDate);
   //     attendanceQuery.setLimit(10);
   //     attendanceQuery.setOffset(0);
    //    attendanceQuery.setAttend((byte) 1);
      //  attendanceQuery.setAbsenceType((byte) 2);
        attendanceQuery.setUserId(5);
        attendanceQuery.setDate(new Date());
        String endDate = "2017-04-01";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        attendanceQuery.setEndDate(sdf.parse(endDate));
        //int total = attendanceMapper.countByMngQuery(attendanceQuery);
        List<AttendanceDto> attendanceDtos = attendanceMapper.selectByMngQuery(attendanceQuery);
    }

}