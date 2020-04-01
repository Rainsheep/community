package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.entity.Admin;
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

    @Override
    public Admin findAdminByAnameAndPassword(LoginDTO loginDTO) {
        Admin admin = adminMapper.findAdminByAnameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
        return admin;
    }
}
