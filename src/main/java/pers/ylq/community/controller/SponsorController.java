package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.service.SponsorService;

@Controller
@RequestMapping("/sponsorView")
public class SponsorController {
    @Autowired
    private SponsorService sponsorService;
    @RequestMapping("findAll")
    public @ResponseBody
    PageInfo findAll(SponsorConditionSearch condition){
        return sponsorService.findAll(condition);
    }
}
