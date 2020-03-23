package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.service.ActivityService;

import java.util.List;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    /**
     * 分页查询所有已审核活动
     */
    @RequestMapping("/findAll")
    public String findAll(Integer currentPage, Integer pageSize, Model model) {
        PageInfo activityPageInfo = activityService.findAll(currentPage, pageSize);
        //System.out.println(activityPageInfo.getList().size());
        model.addAttribute("activityPageInfo", activityPageInfo);
        return "allActivityList";
    }
    //@RequestMapping("/findAll")
    //public @ResponseBody PageInfo findAll(Integer currentPage, Integer pageSize) {
    //    PageInfo activityPageInfo = activityService.findAll(currentPage, pageSize);
    //    return activityPageInfo;
    //}

    /**
     * 查看活动详情
     */
    @RequestMapping("/activityDetail")
    public String activityDetail(Integer activityId, Model model) {
        Activity activity = activityService.findActivityById(activityId);
        System.out.println(activity.getDetail());
        model.addAttribute("activity", activity);
        return "activityDetail";
    }
}
