package ubtms.module.attendance.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.attendance.dto.AttendanceDto;
import ubtms.module.attendance.entity.Attendance;
import ubtms.module.attendance.entity.AttendanceExample;
import ubtms.module.attendance.entity.AttendanceQuery;

public interface AttendanceMapper {
    int countByMngQuery(AttendanceQuery attendanceQuery);
    List<AttendanceDto> selectByMngQuery(AttendanceQuery attendanceQuery);
    int countByExample(AttendanceExample example);

    int deleteByExample(AttendanceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    List<Attendance> selectByExample(AttendanceExample example);

    AttendanceDto selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Attendance record, @Param("example") AttendanceExample example);

    int updateByExample(@Param("record") Attendance record, @Param("example") AttendanceExample example);

    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);
}