package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.CommunityMember;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.CommunityMemberServer;
import pers.ylq.community.utils.Excel;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/communityMember")
public class CommunityMemberController {

    @Autowired
    private CommunityMemberServer communityMemberServer;

    @RequestMapping("/findCommunityMemberByBelong")
    @ResponseBody
    public ResultVo findCommunityMemberByBelong(HttpServletRequest request, Integer page, Integer limit,Integer belong) {
        if (belong==null||belong==0){
            Manager manager = (Manager) request.getSession().getAttribute("user");
            belong=manager.getBelong();
        }
        ResultVo resultVo = communityMemberServer.findCommunityMemberByBelong(page, limit, belong);
        return resultVo;
    }


    @RequestMapping("/members")
    public String members(Integer belong, Model model) {
        //System.out.println(belong);
        model.addAttribute("memberBelong", belong);
        return "admin/communityMember";
    }

    @RequestMapping("/updateFieldByIdAndValue")
    @ResponseBody
    public ResultVo updateFieldByIdAndValue(Integer id, String field, String value) {
        return communityMemberServer.updateFieldByIdAndValue(id, field, value);
    }

    @RequestMapping("/delCommunityMemberById")
    @ResponseBody
    public ResultVo delCommunityMemberById(Integer id) {
        return communityMemberServer.delCommunityMemberById(id);
    }

    @RequestMapping("/addCommunityMember")
    @ResponseBody
    public ResultVo addCommunityMember(HttpServletRequest request, CommunityMember communityMember) {
        Manager manager = (Manager) request.getSession().getAttribute("user");
        communityMember.setBelong(manager.getBelong());
        return communityMemberServer.addCommunityMember(communityMember);
    }

    @RequestMapping("/addOneMember")
    public String addOneMember() {
        return "manage/addCommunityMember";
    }

    @RequestMapping("/addManyMember")
    @ResponseBody
    public ResultVo addManyMember(HttpServletRequest request, String url) {
        Manager manager = (Manager) request.getSession().getAttribute("user");
        List<Map<String, String>> excelData = Excel.getExcelData(request, url);
        for (Map<String, String> map : excelData) {
            Collection<String> values = map.values();
            String[] strings = values.toArray(new String[0]);
            CommunityMember member = new CommunityMember(null, strings[0], strings[1], strings[2], manager.getBelong());
            communityMemberServer.addCommunityMember(member);
        }
        //System.out.println(excelData);
        return null;
    }
}
