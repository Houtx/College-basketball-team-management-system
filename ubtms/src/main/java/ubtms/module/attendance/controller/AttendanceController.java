package ubtms.module.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/attendance")
public class AttendanceController {
    @RequestMapping("/attendanceAddPage")
    public String attendanceAddPage() {
        return "attendance/attendanceAdd";
    }


}
