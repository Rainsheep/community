package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.BillProve;
import pers.ylq.community.service.BillProveServer;

import java.util.List;

@Controller
@RequestMapping("/billProve")
public class BillProveController {
    @Autowired
    private BillProveServer billProveServer;

    @RequestMapping("/findBillProveByBillId")
    @ResponseBody
    public ResultVo findBillProveByBillId(Integer billId) {
        List<BillProve> billProves = billProveServer.findBillProveByBillId(billId);
        return new ResultVo<>(0, 0, "", billProves);
    }
}
