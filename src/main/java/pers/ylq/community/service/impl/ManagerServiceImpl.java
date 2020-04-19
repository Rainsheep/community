package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.mapper.CommunityMapper;
import pers.ylq.community.mapper.ManagerMapper;
import pers.ylq.community.service.CommunityService;
import pers.ylq.community.service.ManagerService;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public String findRealNameById(Integer mid) {
        return managerMapper.findRealNameById(mid);
    }

    @Override
    public Manager findManagerByMnameAndPassword(LoginDTO loginDTO) {
        Manager manager = managerMapper.findManagerByMnameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
        return manager;
    }

    @Override
    public PageInfo findAll(Integer page, Integer limit) {
        if (page == null || page == 0) page = 1;
        if (limit == null || limit == 0) limit = 10;
        PageHelper.startPage(page, limit);
        List<Manager> managers = managerMapper.findAll();
        PageInfo<Manager> pageInfo = new PageInfo<>(managers);
        return pageInfo;
    }

    @Override
    public ResultVo delManagerById(Integer mid) {
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = managerMapper.delManagerById(mid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) resultVo = new ResultVo<>(0, -1, "删除失败!", null);
        else {
            resultVo = new ResultVo<>(0, 0, "删除成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo updateFieldByMidAndValue(Integer mid, String field, String value) {
        Integer belong = null;
        ResultVo resultVo = null;
        Integer flag = 0;
        if (field.equals("realName")) field = "real_name";
        if (field.equals("cname")) {
            belong = communityMapper.findIdByName2(value);
            if (belong == null) {
                String cname = communityMapper.findCnameByMid(mid);
                return new ResultVo<String>(0, -1, "修改失败!", cname);
            }
            flag = managerMapper.updateFieldByMidAndValue(mid, "belong", belong.toString());
        } else {
            flag = managerMapper.updateFieldByMidAndValue(mid, field, value);
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "修改失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo addManager(Manager manager) {
        ResultVo resultVo = null;
        Integer flag = 0;

        Manager manager1 = managerMapper.findManagerByMname(manager.getMname());
        if (manager1 != null) {
            return new ResultVo<>(0, -1, "用户名已存在", null);
        }
        try {
            flag = managerMapper.addManager(manager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) resultVo = new ResultVo<>(0, -1, "添加失败!", null);
        else {
            resultVo = new ResultVo<>(0, 0, "添加成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo updatePasswordById(String oldPassword, String newPassword, Integer mid) {
        ResultVo result = null;
        if (!oldPassword.equals(managerMapper.findPasswordById(mid))) {
            result = new ResultVo<>(0, 1, "当前密码错误!", null);
        } else {
            Integer flag = managerMapper.updatePasswordById(newPassword, mid);
            if (flag <= 0) {
                result = new ResultVo<>(0, 1, "修改失败!", null);
            } else {
                result = new ResultVo<>(0, 0, "修改成功!", null);
            }
        }
        return result;
    }

    @Override
    public ResultVo updateRealNameById(String realName, Integer mid) {
        Integer flag = managerMapper.updateRealNameById(realName, mid);
        ResultVo result = null;
        if (flag <= 0) {
            result = new ResultVo<>(0, 1, "修改失败!", null);
        } else {
            result = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return result;
    }
}

