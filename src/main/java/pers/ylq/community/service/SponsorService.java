package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.entity.Sponsor;

public interface SponsorService {
    PageInfo findAll(SponsorConditionSearch condition);
    Sponsor findSponsorBySnameAndPassword(LoginDTO loginDTO);
}
