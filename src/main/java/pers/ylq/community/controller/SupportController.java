package pers.ylq.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("support")
public class SupportController {

    @RequestMapping("/index")
    public String index(){
        return "support/index";
    }
}
