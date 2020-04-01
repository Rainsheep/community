package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.LoginDTO;
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
     * @param condition
     * @return
     */
    @Override
    public PageInfo findAll(SponsorConditionSearch condition) {
        PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        List<Sponsor> sponsors = sponsorMapper.findAll(condition.getKeyword());
        PageInfo<Sponsor> sponsorPageInfo = new PageInfo<>(sponsors);
        return sponsorPageInfo;
    }

    @Override
    public Sponsor findSponsorBySnameAndPassword(LoginDTO loginDTO) {
        Sponsor sponsor = sponsorMapper.findSponsorBySnameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
        return sponsor;
    }
}
