package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.CommunityMember;
import pers.ylq.community.mapper.CommunityMemberMapper;
import pers.ylq.community.service.CommunityMemberServer;

import java.util.List;

@Service("communityMemberService")
public class CommunityMemberServiceImpl implements CommunityMemberServer {

    @Autowired
    private CommunityMemberMapper communityMemberMapper;

    @Override
    public ResultVo findCommunityMemberByBelong(Integer page, Integer limit, Integer belong) {
        ResultVo resultVo = null;
        PageHelper.startPage(page, limit);
        List<CommunityMember> list = communityMemberMapper.findCommunityMemberByBelong(belong);
        PageInfo<CommunityMember> pageInfo = new PageInfo<>(list);
        resultVo = new ResultVo<>(0, 0, "", pageInfo.getList());
        resultVo.setCount((int) pageInfo.getTotal());
        return resultVo;
    }

    @Override
    public ResultVo updateFieldByIdAndValue(Integer id, String field, String value) {
        ResultVo resultVo = null;
        Integer flag = 0;
        if (field.equals("realName")) field = "real_name";
        try {
            flag = communityMemberMapper.updateFieldByIdAndValue(id, field, value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "修改失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "修改成功!", null);
        }
        return resultVo;
    }

    @Override
    public ResultVo delCommunityMemberById(Integer id) {
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag=communityMemberMapper.delCommunityMemberById(id);
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
    public ResultVo addCommunityMember(CommunityMember communityMember) {
        ResultVo resultVo = null;
        Integer flag = 0;
        try {
            flag=communityMemberMapper.addCommunityMember(communityMember);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag <= 0) {
            resultVo = new ResultVo<>(0, -1, "添加失败!", null);
        } else {
            resultVo = new ResultVo<>(0, 0, "添加成功!", null);
        }
        return resultVo;
    }
}
