package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.BillDetail;
import pers.ylq.community.mapper.BillDetailMapper;
import pers.ylq.community.service.BillDetailServer;

import java.util.List;

@Service("billDetail")
public class BillDetailServerImpl implements BillDetailServer {

    @Autowired
    private BillDetailMapper billDetailMapper;

    @Override
    public ResultVo<List<BillDetail>> findBillDetailByBillId(Integer billId) {
        List<BillDetail> billDetails = billDetailMapper.findBillDetailByBillId(billId);
        ResultVo<List<BillDetail>> resultVo = new ResultVo<>(0, 0, "", billDetails);
        return resultVo;
    }
}
