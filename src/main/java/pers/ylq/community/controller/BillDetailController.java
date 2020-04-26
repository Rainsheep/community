package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.BillDetailDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.BillDetail;
import pers.ylq.community.service.BillDetailServer;
import pers.ylq.community.service.SponsorService;
import pers.ylq.community.service.SupportService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/billDetail")
public class BillDetailController {
    @Autowired
    private BillDetailServer billDetailServer;
    @Autowired
    private SupportService supportService;
    @Autowired
    private SponsorService sponsorService;

    @RequestMapping("/findBillDetailByBillId")
    @ResponseBody
    public ResultVo findBillDetailByBillId(Integer billId) {
        ResultVo<List<BillDetail>> resultVo = billDetailServer.findBillDetailByBillId(billId);
        List<BillDetail> billDetails = resultVo.getData();
        List<BillDetailDTO> list = new ArrayList<>();
        for (BillDetail billDetail : billDetails) {
            Integer sid = supportService.findSidById(billDetail.getSupportId());
            String sponsorName = sponsorService.findRealNameBySid(sid);
            String belong = sponsorService.findBelongBySid(sid);
            BillDetailDTO billDetailDTO = new BillDetailDTO(sponsorName, belong, billDetail.getMoney());
            list.add(billDetailDTO);
        }
        ResultVo<List<BillDetailDTO>> vo = new ResultVo<>(0, 0, "", list);
        return vo;
    }
}
