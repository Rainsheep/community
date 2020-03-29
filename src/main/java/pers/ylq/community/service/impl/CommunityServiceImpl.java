package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.entity.Community;
import pers.ylq.community.mapper.ActivityMapper;
import pers.ylq.community.mapper.CommunityMapper;
import pers.ylq.community.service.CommunityService;

import java.util.List;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public String findNameById(Integer cid) {
        return communityMapper.findNameById(cid);
    }

    @Override
    public PageInfo findAll(CommunityConditionSearch condition) {
        PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        List<Community> communities = communityMapper.findAll(condition.getKeyword());
        if(communities!=null&&communities.size()>0){
            for (Community community : communities) {
                community.setActivityNums(activityMapper.findCountByCid(community.getCid()));
            }
        }
        PageInfo<Community> communityPageInfo = new PageInfo<>(communities);
        //System.out.println(communityPageInfo.getList().size());
        return communityPageInfo;
    }
}
