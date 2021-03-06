package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Community;

import java.util.List;

public interface CommunityService {
    String findNameById(Integer cid);
    PageInfo findAll(CommunityConditionSearch condition);
    ResultVo delCommunityByCid(Integer cid);
    ResultVo updateFieldByCidAndValue(Integer cid, String field, String value);
    ResultVo addCommunity(Community community);
    List<Community> findAllAsList();
    Community findCommunityById(Integer cid);
    ResultVo updateMnameAndAmount(Integer cid,String mname,Integer amount);
}
