package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.entity.Community;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.CommunityService;
import pers.ylq.community.service.ManagerService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/manage")
public class ManageController {

    @Autowired
    private CommunityService communityService;

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
}
