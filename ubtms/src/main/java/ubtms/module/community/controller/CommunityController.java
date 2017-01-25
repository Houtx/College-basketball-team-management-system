package ubtms.module.community.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {
    @RequestMapping("/articleAddPage")
    public String articleAddPage(){
        System.out.println("in");
        return "/community/articleAdd";
    }
}
