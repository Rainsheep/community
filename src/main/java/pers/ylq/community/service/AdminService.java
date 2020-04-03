package pers.ylq.community.service;

import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Admin;

public interface AdminService {

    String findRealNameById(Integer aid);
    Admin findAdminByAnameAndPassword(LoginDTO loginDTO);
    ResultVo updateRealNameById(String realName, Integer aid);
    ResultVo updatePasswordById(String oldPassword,String newPassword,Integer aid);
}
