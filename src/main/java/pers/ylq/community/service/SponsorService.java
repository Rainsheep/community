package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.SponsorConditionSearch;

public interface SponsorService {
    PageInfo findAll(SponsorConditionSearch condition);
}
