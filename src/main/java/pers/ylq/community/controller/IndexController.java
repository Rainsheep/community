package pers.ylq.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/allActivityList")
    public String allActivityList(){
        return "allActivityList";
    }
    @RequestMapping("/allNoticeList")
    public String allNoticeList(){
        return "allNoticeList";
    }
    @RequestMapping("/allCommunityList")
    public String allCommunityList(){
        return "allCommunityList";
    }


}
