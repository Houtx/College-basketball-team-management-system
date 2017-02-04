package ubtms.module.bill.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/bill")
public class BillController {
    @RequestMapping("/billAddPage")
    public String billAddPage() {
        return "/bill/billAdd";
    }

}
