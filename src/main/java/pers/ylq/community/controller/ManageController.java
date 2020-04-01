package pers.ylq.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManageController {

    @RequestMapping("/index")
    public String index(){
        return "manage/index";
    }
}
