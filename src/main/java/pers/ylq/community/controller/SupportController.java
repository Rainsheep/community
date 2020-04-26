package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.BillDTO3;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.*;
import pers.ylq.community.service.ActivityService;
import pers.ylq.community.service.SupportService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/support")
public class SupportController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private SupportService supportService;

    @RequestMapping("/index")
    public String index() {
        return "support/index";
    }

    @RequestMapping("/findActivitySupportByBelong")
    @ResponseBody
    public ResultVo findActivitySupportByBelong(HttpServletRequest request, Integer page, Integer limit) {
        Manager user = (Manager) request.getSession().getAttribute("user");
        ResultVo<List<ActivitySupport>> resultVo = activityService.findActivitySupportByBelong(page, limit, user.getBelong());
        return resultVo;
    }

    @RequestMapping("/findAllActivitySupport")
    @ResponseBody
    public ResultVo findAllActivitySupport(HttpServletRequest request, Integer page, Integer limit) {
        ResultVo<List<ActivitySupport>> resultVo = activityService.findAllActivitySupport(page, limit);
        return resultVo;
    }

    @RequestMapping("/activitySupport")
    public String activitySupport() {
        return "support/activitySupport";
    }

    @RequestMapping("/addSupport")
    @ResponseBody
    public ResultVo addSupport(HttpServletRequest request, Support support) {
        Sponsor sponsor = (Sponsor) request.getSession().getAttribute("user");
        Integer sid = sponsor.getSid();
        support.setSid(sid);
        support.setLeftMoney(support.getMoney());
        ResultVo resultVo = supportService.addSupport(support);
        return resultVo;
    }

    @RequestMapping("/findSupportByActivityId")
    @ResponseBody
    public ResultVo findSupportByActivityId(Integer page, Integer limit, Integer activityId) {
        ResultVo resultVo = supportService.findSupportByActivityId(page, limit, activityId);
        return resultVo;
    }

    @RequestMapping("/findSupportBySid")
    @ResponseBody
    public ResultVo findSupportBySid(HttpServletRequest request, Integer page, Integer limit) {
        Sponsor sponsor = (Sponsor) request.getSession().getAttribute("user");
        Integer sid = sponsor.getSid();
        ResultVo resultVo = supportService.findSupportBySid(page, limit, sid);
        return resultVo;
    }

    @RequestMapping("/supportedActivity")
    public String supportedActivity() {
        return "support/supportedActivity";
    }

    @RequestMapping("userInfo")
    public String userInfo() {
        return "support/userInfo";
    }

    @RequestMapping("/password")
    public String password() {
        return "support/updatePassword";
    }

    @RequestMapping("/spendBill")
    public String spendDetail(Integer supportId, Model model) {
        model.addAttribute("supportId", supportId);
        return "support/spendBill";
    }

    @RequestMapping("/putBillDetail")
    @ResponseBody
    public ResultVo putBillDetail(HttpServletRequest request, BillDTO3 billDTO3) {
        request.getSession().setAttribute("billDTO3", billDTO3);
        return null;
    }

    @RequestMapping("/getBillDetailFiles")
    @ResponseBody
    public ResultVo getBillDetailFiles(HttpServletRequest request){
        ResultVo resultVo=null;
        BillDTO3 billDTO3 = (BillDTO3) request.getSession().getAttribute("billDTO3");
        if(billDTO3!=null) {
            List<BillProve> billProves = billDTO3.getBillProves();
            resultVo=new ResultVo<>(0, 0, "", billProves);
        }
        return resultVo;
    }

    @RequestMapping("/billDetail")
    public String billDetail() {
        return "support/billDetail";
    }

}
