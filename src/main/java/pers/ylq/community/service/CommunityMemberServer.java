package pers.ylq.community.service;

import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.CommunityMember;

public interface CommunityMemberServer {
    ResultVo findCommunityMemberByBelong(Integer page, Integer limit, Integer belong);

    ResultVo updateFieldByIdAndValue(Integer id, String field, String value);

    ResultVo delCommunityMemberById(Integer id);

    ResultVo addCommunityMember(CommunityMember communityMember);
}
