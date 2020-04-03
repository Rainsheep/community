package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
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

    @Override
    public ResultVo updateRealNameById(String realName, Integer aid) {
        Integer flag = adminMapper.updateRealNameById(realName, aid);
        ResultVo result=null;
        if (flag<=0){
            result=new ResultVo<>(0,1,"修改失败!",null);
        }else {
            result=new ResultVo<>(0,0,"修改成功!",null);
        }
        return result;
    }

    @Override
    public ResultVo updatePasswordById(String oldPassword,String newPassword, Integer aid) {
        ResultVo result=null;
        if(!oldPassword.equals(adminMapper.findPasswordById(aid))){
            result=new ResultVo<>(0,1,"当前密码错误!",null);
        } else{
            Integer flag = adminMapper.updatePasswordById(newPassword, aid);
            if (flag<=0){
                result=new ResultVo<>(0,1,"修改失败!",null);
            }else {
                result=new ResultVo<>(0,0,"修改成功!",null);
            }
        }
        return result;
    }
}
