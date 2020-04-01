package pers.ylq.community.service;

import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.entity.Manager;

public interface ManagerService {
    String findRealNameById(Integer mid);
    Manager findManagerByMnameAndPassword(LoginDTO loginDTO);
}
