package pers.ylq.community.service;

import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.entity.Support;

public interface SupportService {
    ResultVo addSupport(Support support);

    ResultVo findSupportByActivityId(Integer page, Integer limit, Integer activityId);

    Integer findSidById(Integer id);

    ResultVo findSupportBySid(Integer page, Integer limit, Integer sid);


}
