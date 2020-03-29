package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.entity.Community;

import java.util.List;

public interface CommunityService {
    String findNameById(Integer cid);
    PageInfo findAll(CommunityConditionSearch condition);
}
