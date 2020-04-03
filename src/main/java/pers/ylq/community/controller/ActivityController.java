package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ConditionSearch;
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
    //@RequestMapping("/findAll")
    //public String findAll(Integer currentPage, Integer pageSize, Model model) {
    //    PageInfo activityPageInfo = activityService.findAll(currentPage, pageSize);
    //    //System.out.println(activityPageInfo.getList().size());
    //    model.addAttribute("activityPageInfo", activityPageInfo);
    //    return "allActivityList";
    //}
    @RequestMapping("/findAll")
    public @ResponseBody PageInfo findAll(ConditionSearch condition) {
        //System.out.println(condition);
        //System.out.println(currentPage+" "+pageSize);
        //System.out.println(condition.getPageSize());
        PageInfo activityPageInfo = activityService.findAll(condition);
        //System.out.println(activityPageInfo.getPageSize());
        return activityPageInfo;
    }

    /**
     * 查看活动详情
     */
    @RequestMapping("/activityDetail")
    public String activityDetail(Integer activityId,Integer onlyContent, Model model) {
        Activity activity = activityService.findActivityById(activityId);
        //System.out.println(activity.getDetail());
        //System.out.println(activity.getImages().size());
        model.addAttribute("activity", activity);
        model.addAttribute("onlyContent",onlyContent);
        return "activityDetail";
    }
}
