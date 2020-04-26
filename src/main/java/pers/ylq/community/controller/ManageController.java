package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.entity.Community;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.ActivityService;
import pers.ylq.community.service.CommunityService;
import pers.ylq.community.service.ManagerService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManageController {

    @Autowired
    private CommunityService communityService;
    @Autowired
    private ActivityService activityService;

    @RequestMapping("/index")
    public String index() {
        return "manage/index";
    }

    @RequestMapping("userInfo")
    public String userInfo() {
        return "manage/userInfo";
    }

    @RequestMapping("/password")
    public String password() {
        return "manage/updatePassword";
    }


    @RequestMapping("/updateCommunity")
    public String updateCommunity(Model model, HttpServletRequest request) {
        Manager manager = (Manager) request.getSession().getAttribute("user");
        Integer belong = manager.getBelong();
        Community community = communityService.findCommunityById(belong);
        model.addAttribute("community", community);
        return "manage/updateCommunity";
    }

    @RequestMapping("/addActivity")
    public String addActivity() {
        return "manage/addActivity";
    }

    @RequestMapping("/notAduitActivity")
    public String notAduitActivity() {
        return "manage/notAduitActivity";
    }

    @RequestMapping("/updateActivityById")
    public String updateActivityById(Integer id, Model model) {
        Activity activity = activityService.findActivityById(id);
        model.addAttribute("activity", activity);
        return "manage/updateActivity";
    }

    @RequestMapping("/notPassActivity")
    public String notPassActivity() {
        return "manage/notPassActivity";
    }

    @RequestMapping("/passedActivity")
    public String passedActivity() {
        return "manage/passedActivity";
    }

    @RequestMapping("/activitySupport")
    public String activitySupport() {
        return "manage/activitySupport";
    }

    @RequestMapping("/supportDetail")
    public String supportDetail(Integer activityId, Model model) {
        model.addAttribute("activityId", activityId);
        return "manage/supportDetail";
    }

    @RequestMapping("/addBill")
    public String addBill(HttpServletRequest request, Model model) {
        Manager manager = (Manager) request.getSession().getAttribute("user");

        ConditionSearch condition = new ConditionSearch();
        condition.setPage(1);
        condition.setLimit(9999);

        ResultVo<List<Activity>> resultVo = activityService.findActivityByBelong(condition, manager.getBelong());
        List<Activity> activities = resultVo.getData();
        model.addAttribute("activities", activities);

        return "manage/addBill";
    }

    @RequestMapping("/activityBill")
    public String activityBill(Integer activityId, Model model) {
        model.addAttribute("activityId", activityId);
        return "manage/activityBill";
    }

    @RequestMapping("/billDetail")
    public String billDetail(Integer billId, Model model) {
        model.addAttribute("billId", billId);
        return "manage/billDetail";
    }
}
