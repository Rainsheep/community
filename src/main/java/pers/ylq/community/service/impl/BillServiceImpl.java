package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.BillDTO;
import pers.ylq.community.dto.BillDTO2;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Bill;
import pers.ylq.community.entity.BillDetail;
import pers.ylq.community.entity.BillProve;
import pers.ylq.community.mapper.BillDetailMapper;
import pers.ylq.community.mapper.BillMapper;
import pers.ylq.community.mapper.BillProveMapper;
import pers.ylq.community.mapper.SupportMapper;
import pers.ylq.community.service.BillService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("billService")
public class BillServiceImpl implements BillService {

    @Autowired
    private BillMapper billMapper;
    @Autowired
    private BillDetailMapper billDetailMapper;
    @Autowired
    private BillProveMapper billProveMapper;
    @Autowired
    private SupportMapper supportMapper;

    @Override
    public ResultVo addBill(BillDTO billDTO, Integer mid) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(billDTO.getDatetime());
        Bill bill = new Bill();
        bill.setActivityId(billDTO.getActivityId());
        bill.setWay(billDTO.getWay());
        bill.setCost(billDTO.getCost());
        bill.setDatetime(date);
        bill.setPlace(billDTO.getPlace());
        bill.setMid(mid);
        bill.setNote(billDTO.getNote());

        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = billMapper.addBill(bill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag > 0) {
            Integer billId = bill.getId();
            resultVo = new ResultVo<>(0, 0, "添加成功!", billId);
            //添加账单详情
            List<BillDetail> billDetails = billDTO.getBillDetails();
            for (BillDetail billDetail : billDetails) {
                if (billDetail.getSupportId() == null || billDetail.getMoney() == null || billDetail.getMoney() == 0)
                    continue;
                billDetail.setBillId(billId);
                billDetailMapper.addBillDetail(billDetail);

                supportMapper.subLeftMoney(billDetail.getSupportId(), billDetail.getMoney());
            }
            //添加证明材料
            Map<String, String> files = billDTO.getFiles();
            if (files != null) {
                Set<String> set = files.keySet();
                for (String filename : set) {
                    BillProve billProve = new BillProve();
                    billProve.setBillId(billId);
                    billProve.setFilename(filename);
                    billProve.setUrl(files.get(filename));
                    billProveMapper.addBillProve(billProve);
                }
            }

        } else resultVo = new ResultVo<>(0, -1, "添加失败!", null);
        return resultVo;
    }

    @Override
    public ResultVo findBillByActivityId(Integer page, Integer limit, Integer activityId) {
        PageHelper.startPage(page, limit);
        List<Bill> bills = billMapper.findBillByActivityId(activityId);
        PageInfo<Bill> billPageInfo = new PageInfo<>(bills);
        ResultVo<List<Bill>> resultVo = new ResultVo<>(0, 0, "", billPageInfo.getList());
        resultVo.setCount((int) billPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo findBillBySupportId(Integer page, Integer limit, Integer supportId) {
        PageHelper.startPage(page, limit);
        List<BillDTO2> bills = billMapper.findBillBySupportId(supportId);
        PageInfo<BillDTO2> billPageInfo = new PageInfo<>(bills);
        ResultVo<List<BillDTO2>> resultVo = new ResultVo<>(0, 0, "", billPageInfo.getList());
        resultVo.setCount((int) billPageInfo.getTotal());
        return resultVo;
    }
}
