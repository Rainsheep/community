package pers.ylq.community.service;

import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.entity.Admin;

public interface AdminService {

    String findRealNameById(Integer aid);
    Admin findAdminByAnameAndPassword(LoginDTO loginDTO);
}
