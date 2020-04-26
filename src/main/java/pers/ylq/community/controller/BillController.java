package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.BillDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.BillDetailServer;
import pers.ylq.community.service.BillService;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

@Controller
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private BillService billService;

    @RequestMapping("/addBill")
    @ResponseBody
    public ResultVo addBill(HttpServletRequest request, BillDTO billDTO) throws ParseException {
        Manager manager = (Manager) request.getSession().getAttribute("user");
        ResultVo resultVo = billService.addBill(billDTO, manager.getMid());
        return resultVo;
    }

    @RequestMapping("/findBillByActivityId")
    @ResponseBody
    public ResultVo findBillByActivityId(Integer page, Integer limit, Integer activityId) {
        ResultVo resultVo = billService.findBillByActivityId(page, limit, activityId);
        return resultVo;
    }

    @RequestMapping("/findBillBySupportId")
    @ResponseBody
    public ResultVo findBillBySupportId(Integer page, Integer limit, Integer supportId) {
        ResultVo resultVo = billService.findBillBySupportId(page, limit, supportId);
        return resultVo;
    }

}
