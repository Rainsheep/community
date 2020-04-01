package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.mapper.ManagerMapper;
import pers.ylq.community.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public String findRealNameById(Integer mid) {
        return managerMapper.findRealNameById(mid);
    }

    @Override
    public Manager findManagerByMnameAndPassword(LoginDTO loginDTO) {
        Manager manager = managerMapper.findManagerByMnameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
        return manager;
    }
}
