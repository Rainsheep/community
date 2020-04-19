package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.ActivityDTO;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;

import java.util.List;

public interface ActivityService {
    PageInfo findAll(ConditionSearch condition);

    Activity findActivityById(Integer activityId);

    ResultVo delActivityById(Integer activityId);

    ResultVo<List<Activity>> findNotAduitActivity(ConditionSearch condition);

    ResultVo passActivityById(Integer activityId, Integer aid);

    ResultVo rejectActivityById(Integer activityId, String message, Integer aid);

    ResultVo addActivity(ActivityDTO activityDTO);
}
