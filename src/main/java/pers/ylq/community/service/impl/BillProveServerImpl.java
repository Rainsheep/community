package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.entity.BillProve;
import pers.ylq.community.mapper.BillProveMapper;
import pers.ylq.community.service.BillProveServer;

import java.util.List;

@Service("billProverServer")
public class BillProveServerImpl implements BillProveServer {

    @Autowired
    private BillProveMapper billProveMapper;

    @Override
    public List<BillProve> findBillProveByBillId(Integer billId) {
        return billProveMapper.findBillProveByBillId(billId);
    }
}
