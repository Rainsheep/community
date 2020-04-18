package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.entity.Sponsor;

import java.util.List;

public interface SponsorService {
    PageInfo findAll(SponsorConditionSearch condition);
    Sponsor findSponsorBySnameAndPassword(LoginDTO loginDTO);
    ResultVo delSponsorById(Integer sid);
    ResultVo updateFieldBySidAndValue(Integer sid, String field, String value);
}
