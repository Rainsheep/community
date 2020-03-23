package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.mapper.AdminMapper;
import pers.ylq.community.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {


    @Autowired
    private AdminMapper adminMapper;

    @Override
    public String findRealNameById(Integer aid) {
        return adminMapper.findRealNameById(aid);
    }
}
