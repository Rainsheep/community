package pers.ylq.community.controller;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.service.AdminService;

import javax.servlet.http.HttpServletRequest;


/**
 * 超级管理员管理
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/index")
    public String index() {
        return "admin/index";
    }

    @RequestMapping("userInfo")
    public String userInfo() {
        return "admin/userInfo";
    }

    @RequestMapping("/updateRealName")
    public @ResponseBody
    ResultVo updateRealName(HttpServletRequest request, String realName) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        Integer aid = user.getAid();
        ResultVo result = adminService.updateRealNameById(realName, aid);
        return result;
    }

    @RequestMapping("/password")
    public String password() {
        return "admin/updatePassword";
    }

    @RequestMapping("/updatePassword")
    public @ResponseBody
    ResultVo updatePassword(HttpServletRequest request, String oldPassword, String newPassword) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        Integer aid = user.getAid();
        ResultVo result = adminService.updatePasswordById(oldPassword, newPassword, aid);
        return result;
    }

    @RequestMapping("/sponsorList")
    public String sponsorList() {
        return "admin/sponsorList";
    }

    @RequestMapping("/managerList")
    public String managerList() {
        return "admin/managerList";
    }

    @RequestMapping("/communityList")
    public String communityList() {
        return "admin/communityList";
    }

    @RequestMapping("/activityList")
    public String activityList(){
        return "admin/activityList";
    }

    @RequestMapping("/aduitActivity")
    public String aduitActivity(){
        return "admin/aduitActivity";
    }
}
