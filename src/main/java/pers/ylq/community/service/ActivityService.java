package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.entity.Activity;

import java.util.List;

public interface ActivityService {
    PageInfo findAll(ConditionSearch condition);

    Activity findActivityById(Integer activityId);
}
