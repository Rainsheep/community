package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.mapper.SponsorMapper;
import pers.ylq.community.service.SponsorService;

import java.util.List;

@Service("sponsorService")
public class SponsorServiceImpl implements SponsorService {
    @Autowired
    private SponsorMapper sponsorMapper;


    /**
     * 条件分页查询所有赞助商
     *
     * @param condition
     * @return
     */
    @Override
    public PageInfo findAll(SponsorConditionSearch condition) {
        if (condition.getPage() != null && condition.getPage() != 0) {
            PageHelper.startPage(condition.getPage(), condition.getLimit());
        } else {
            PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        }
        List<Sponsor> sponsors = sponsorMapper.findAll(condition.getKeyword());
        for (Sponsor sponsor : sponsors) {
            String password = sponsor.getPassword();
            password = password.replaceAll("(.).*(.)", "$1****$2");
            sponsor.setPassword(password);
        }
        PageInfo<Sponsor> sponsorPageInfo = new PageInfo<>(sponsors);
        return sponsorPageInfo;
    }


    @Override
    public Sponsor findSponsorBySnameAndPassword(LoginDTO loginDTO) {
        Sponsor sponsor = sponsorMapper.findSponsorBySnameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
        return sponsor;
    }

    @Override
    public ResultVo delSponsorById(Integer sid) {
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = sponsorMapper.delSponsorById(sid);
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
    public ResultVo updateFieldBySidAndValue(Integer sid, String field, String value) {
        ResultVo result = null;
        if (field.equals("realName")) field = "real_name";
        Integer flag = sponsorMapper.updateFieldBySidAndValue(sid, field, value);
        if (flag <= 0) {
            result = new ResultVo<>(0, 1, "修改失败!", null);
        } else {
            result = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return result;
    }

    @Override
    public ResultVo addSponsor(Sponsor sponsor) {
        ResultVo resultVo = null;
        Integer flag = 0;

        Sponsor sponsor1 = sponsorMapper.findSponsorBySname(sponsor.getSname());
        if (sponsor1 != null) return new ResultVo<>(0, -1, "用户名已存在!", null);

        try {
            flag = sponsorMapper.addSponsor(sponsor);
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
    public String findRealNameBySid(Integer sid) {
        return sponsorMapper.findRealNameBySid(sid);
    }

    @Override
    public String findBelongBySid(Integer sid) {
        return sponsorMapper.findBelongBySid(sid);
    }

    @Override
    public ResultVo updateSponsorBySid(Sponsor sponsor) {
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = sponsorMapper.updateSponsorBySid(sponsor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) resultVo = new ResultVo<>(0, -1, "修改失败!", null);
        else {
            resultVo = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo updatePasswordById(String oldPassword, String newPassword, Integer sid) {
        ResultVo result = null;
        if (!oldPassword.equals(sponsorMapper.findPasswordBySid(sid))) {
            result = new ResultVo<>(0, 1, "当前密码错误!", null);
        } else {
            Integer flag = sponsorMapper.updatePassowrdBySid(newPassword, sid);
            if (flag <= 0) {
                result = new ResultVo<>(0, 1, "修改失败!", null);
            } else {
                result = new ResultVo<>(0, 0, "修改成功!", null);
            }
        }
        return result;
    }
}
