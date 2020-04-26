package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Support;
import pers.ylq.community.mapper.SupportMapper;
import pers.ylq.community.service.SupportService;

import java.util.List;

@Service("supportService")
public class SupportServiceImpl implements SupportService {

    @Autowired
    private SupportMapper supportMapper;

    @Override
    public ResultVo addSupport(Support support) {
        //System.out.println(support);
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag = supportMapper.addSupport(support);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (flag <= 0) resultVo = new ResultVo<>(0, -1, "添加失败!", null);
        else resultVo = new ResultVo<>(0, 0, "添加成功!", null);
        return resultVo;
    }

    @Override
    public ResultVo findSupportByActivityId(Integer page, Integer limit, Integer activityId) {
        PageHelper.startPage(page, limit);
        List<Support> supports = supportMapper.findSupportByActivityId(activityId);
        PageInfo<Support> supportPageInfo = new PageInfo<>(supports);
        ResultVo<List<Support>> resultVo = new ResultVo<>(0, 0, "", supportPageInfo.getList());
        resultVo.setCount((int) supportPageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo findSupportBySid(Integer page, Integer limit, Integer sid) {
        PageHelper.startPage(page, limit);
        List<Support> supports = supportMapper.findSupportBySid(sid);
        PageInfo<Support> supportPageInfo = new PageInfo<>(supports);
        ResultVo<List<Support>> resultVo = new ResultVo<>(0, 0, "", supportPageInfo.getList());
        resultVo.setCount((int) supportPageInfo.getTotal());
        return resultVo;
    }


    @Override
    public Integer findSidById(Integer id) {
        return supportMapper.findSidById(id);
    }

}
