package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Manager;

public interface ManagerService {
    String findRealNameById(Integer mid);

    Manager findManagerByMnameAndPassword(LoginDTO loginDTO);

    PageInfo findAll(Integer page, Integer limit);

    ResultVo delManagerById(Integer mid);

    ResultVo updateFieldByMidAndValue(Integer mid, String field, String value);

    ResultVo addManager(Manager manager);
}
