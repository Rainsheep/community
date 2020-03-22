package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.mapper.ActivityMapper;
import pers.ylq.community.service.ActivityService;

import java.util.List;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public PageInfo findAll(int currentPage,int pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<Activity> activities = activityMapper.findAll();
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);
        return activityPageInfo;
    }
}
