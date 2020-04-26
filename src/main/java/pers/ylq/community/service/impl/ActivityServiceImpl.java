package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.ActivityDTO;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.entity.ActivitySupport;
import pers.ylq.community.mapper.ActivityMapper;
import pers.ylq.community.mapper.CommunityMapper;
import pers.ylq.community.service.ActivityService;

import java.util.Date;
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

        if (condition.getPage() != null && condition.getPage() != 0) {
            PageHelper.startPage(condition.getPage(), condition.getLimit());
        } else {
            PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        }
        List<Activity> activities = activityMapper.findAll(condition);
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);
        //System.out.println(activityPageInfo);
        return activityPageInfo;
    }

    @Override
    public Activity findActivityById(Integer activityId) {
        return activityMapper.findActivityById(activityId);
    }

    @Override
    public ResultVo delActivityById(Integer activityId) {
        //System.out.println(activityId);
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = activityMapper.delActivityById(activityId);
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
    public ResultVo<List<Activity>> findNotAduitActivity(ConditionSearch condition) {
        PageHelper.startPage(condition.getPage(), condition.getLimit());
        List<Activity> activities = activityMapper.findNotAduitActivity();
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);

        ResultVo<List<Activity>> resultVo = new ResultVo<>(0, 0, "", activityPageInfo.getList());
        resultVo.setCount((int) activityPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo<List<Activity>> findNotAduitActivityByBelong(ConditionSearch condition, Integer belong) {
        PageHelper.startPage(condition.getPage(), condition.getLimit());
        List<Activity> activities = activityMapper.findNotAduitActivityByBelong(belong);
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);

        ResultVo<List<Activity>> resultVo = new ResultVo<>(0, 0, "", activityPageInfo.getList());
        resultVo.setCount((int) activityPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo<List<Activity>> findNotPassActivityByBelong(ConditionSearch condition, Integer belong) {
        PageHelper.startPage(condition.getPage(), condition.getLimit());
        List<Activity> activities = activityMapper.findNotPassActivityByBelong(belong);
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);

        ResultVo<List<Activity>> resultVo = new ResultVo<>(0, 0, "", activityPageInfo.getList());
        resultVo.setCount((int) activityPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo findActivityByBelong(ConditionSearch condition, Integer belong) {
        PageHelper.startPage(condition.getPage(), condition.getLimit());
        List<Activity> activities = activityMapper.findActivityByBelong(belong);
        PageInfo<Activity> activityPageInfo = new PageInfo<>(activities);

        ResultVo<List<Activity>> resultVo = new ResultVo<>(0, 0, "", activityPageInfo.getList());
        resultVo.setCount((int) activityPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo<List<ActivitySupport>> findActivitySupportByBelong(Integer page, Integer limit, Integer belong) {
        PageHelper.startPage(page, limit);
        List<ActivitySupport> activitySupportList = activityMapper.findActivitySupportByBelong(belong);

        Date nowDate = new Date();
        for (ActivitySupport activitySupport : activitySupportList) {
            if (activitySupport.getDatetime().getTime() <= nowDate.getTime()) {
                activitySupport.setSupportStatus("不可赞助");
            } else {
                activitySupport.setSupportStatus("可赞助");
            }
        }

        PageInfo<ActivitySupport> activitySupportPageInfo = new PageInfo<>(activitySupportList);
        ResultVo<List<ActivitySupport>> resultVo = new ResultVo<>(0, 0, "", activitySupportPageInfo.getList());
        resultVo.setCount((int) activitySupportPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo<List<ActivitySupport>> findAllActivitySupport(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<ActivitySupport> activitySupportList = activityMapper.findAllActivitySupport();

        Date nowDate = new Date();
        for (ActivitySupport activitySupport : activitySupportList) {
            if (activitySupport.getDatetime().getTime() <= nowDate.getTime()) {
                activitySupport.setSupportStatus("不可赞助");
            } else {
                activitySupport.setSupportStatus("可赞助");
            }
        }

        PageInfo<ActivitySupport> activitySupportPageInfo = new PageInfo<>(activitySupportList);
        ResultVo<List<ActivitySupport>> resultVo = new ResultVo<>(0, 0, "", activitySupportPageInfo.getList());
        resultVo.setCount((int) activitySupportPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo passActivityById(Integer activityId, Integer aid) {
        Integer flag = activityMapper.passActivityById(activityId, aid);
        ResultVo resultVo = null;
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "审核失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "审核通过!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo rejectActivityById(Integer activityId, String message, Integer aid) {
        Integer flag = activityMapper.rejectActivityById(activityId, message, aid);
        ResultVo resultVo = null;
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "驳回失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "驳回成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo addActivity(ActivityDTO activityDTO) {
        //System.out.println(activityDTO);
        Activity activity = new Activity();
        activity.setName(activityDTO.getName());
        activity.setDatetime(activityDTO.getDatetime());
        activity.setPlace(activityDTO.getPlace());
        activity.setBelong(activityDTO.getBelong());
        activity.setAmount(activityDTO.getAmount());
        activity.setDetail(activityDTO.getDetail());
        activity.setSponsorMoney(activityDTO.getSponsorMoney());
        activity.setMid(activityDTO.getMid());
        activity.setType(activityDTO.getType());

        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = activityMapper.addActivity(activity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "添加失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "添加成功!", activity.getId());
        }

        return resultVo;
    }

    @Override
    public ResultVo updateActivity(ActivityDTO activityDTO) {
        Activity activity = new Activity();
        activity.setId(activityDTO.getId());
        activity.setName(activityDTO.getName());
        activity.setDatetime(activityDTO.getDatetime());
        activity.setPlace(activityDTO.getPlace());
        activity.setBelong(activityDTO.getBelong());
        activity.setAmount(activityDTO.getAmount());
        activity.setDetail(activityDTO.getDetail());
        activity.setSponsorMoney(activityDTO.getSponsorMoney());
        activity.setMid(activityDTO.getMid());
        activity.setType(activityDTO.getType());

        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = activityMapper.updateActivity(activity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "修改失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "修改成功!", activity.getId());
        }

        return resultVo;
    }


}
