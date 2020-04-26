package pers.ylq.community.service;

import pers.ylq.community.dto.BillDTO;
import pers.ylq.community.dto.ResultVo;

import java.text.ParseException;

public interface BillService {
    ResultVo addBill(BillDTO billDTO, Integer mid) throws ParseException;

    ResultVo findBillByActivityId(Integer page, Integer limit, Integer activityId);

    ResultVo findBillBySupportId(Integer page, Integer limit, Integer supportId);
}
