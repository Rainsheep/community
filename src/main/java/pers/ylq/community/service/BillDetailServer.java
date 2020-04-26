package pers.ylq.community.service;

import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.BillDetail;

import java.util.List;

public interface BillDetailServer {
    ResultVo<List<BillDetail>> findBillDetailByBillId(Integer billId);
}
