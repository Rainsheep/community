package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.service.ActivityService;

import java.util.List;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @RequestMapping("/findAll")
    public String findAll(Integer currentPage,Integer pageSize,Model model) {
        PageInfo activityPageInfo = activityService.findAll(currentPage,pageSize);
        //System.out.println(activityPageInfo.getList().size());
        model.addAttribute(activityPageInfo);
        return "allActivityList";
    }
}
