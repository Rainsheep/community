package pers.ylq.community.service;

import pers.ylq.community.entity.BillProve;

import java.util.List;

public interface BillProveServer {
    List<BillProve> findBillProveByBillId(Integer billId);
}
