package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.mapper.ActivityMapper;
import pers.ylq.community.mapper.CommunityMapper;
import pers.ylq.community.service.ActivityService;

import java.util.List;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public PageInfo findAll(ConditionSearch condition) {

        //将condition中社团名修改为id
        if (condition.getCommunity() != null && !condition.getCommunity().equals("")) {
            List<Integer> cids = communityMapper.findIdByName(condition.getCommunity());
            if (cids != null && cids.size() > 0) {
                String temp = "";
                for (int i = 0; i < cids.size(); i++) {
                    temp += cids.get(i);
                    if (i != cids.size() - 1) temp += ",";
                }
                condition.setCommunity(temp);
            }
        }

        PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        List<Activity> activities = activityMapper.findAll(condition);
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);
        //System.out.println(activityPageInfo);
        return activityPageInfo;
    }

    @Override
    public Activity findActivityById(Integer activityId) {
        return activityMapper.findActivityById(activityId);
    }
}
