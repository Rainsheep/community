package pers.ylq.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public String allNoticeList(Integer isAdmin, Model model){
        model.addAttribute("isAdmin",isAdmin);
        return "allNoticeList";
    }

    @RequestMapping("/allCommunityList")
    public String allCommunityList(){
        return "allCommunityList";
    }

    @RequestMapping("/allSponsorList")
    public String allSponsorList(){
        return "allSponsorList";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("userType");
        request.getSession().removeAttribute("user");
        return "index";
    }

    @RequestMapping("/background")
    public String bdckground(HttpServletRequest request){
        Integer userType = (Integer) request.getSession().getAttribute("userType");
        if(userType==1){
            return "admin/index";
        }else if(userType==2){
            return "manage/index";
        }else if(userType==3){
            return "support/index";
        }
        return "index";
    }

    @RequestMapping("/homepage")
    public String homepage(){
        return "admin/homepage";
    }

}
