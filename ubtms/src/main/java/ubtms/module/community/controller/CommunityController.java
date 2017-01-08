package ubtms.module.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jinzhany on 2016/12/17.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {

    @RequestMapping("/articleAdd")
    public String articleAdd(){

        return "/community/articleAdd";
    }



}
