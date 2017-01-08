package ubtms.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by jinzhany on 2016/12/17.
 */
@Controller
@RequestMapping("/homePage")
public class HomePageController {

    @RequestMapping("/mainPage")
    public String mainPage(){
        return "/mainPage";
    }
}
