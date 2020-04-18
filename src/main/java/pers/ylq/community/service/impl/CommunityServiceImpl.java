package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.dto.ResultVo;
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
        if (condition.getPage() != null && condition.getPage() != 0) {
            PageHelper.startPage(condition.getPage(), condition.getLimit());
        } else {
            PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        }
        List<Community> communities = communityMapper.findAll(condition.getKeyword());
        if (communities != null && communities.size() > 0) {
            for (Community community : communities) {
                community.setActivityNums(activityMapper.findCountByCid(community.getCid()));
            }
        }
        PageInfo<Community> communityPageInfo = new PageInfo<>(communities);
        //System.out.println(communityPageInfo.getList().size());
        return communityPageInfo;
    }

    @Override
    public ResultVo delCommunityByCid(Integer cid) {
        ResultVo resultVo = null;
        Integer flag=0;
        try {
            flag = communityMapper.delCommunityByCid(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "删除失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "删除成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo updateFieldByCidAndValue(Integer cid, String field, String value) {
        ResultVo result = null;
        Integer flag = communityMapper.updateFieldByCidAndValue(cid, field, value);
        if (flag <= 0) {
            result = new ResultVo<>(0, -1, "修改失败!", null);
        } else {
            result = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return result;
    }
}
