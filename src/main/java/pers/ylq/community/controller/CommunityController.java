package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Community;
import pers.ylq.community.service.CommunityService;

import java.util.List;

@Repository
@RequestMapping("/community")
public class CommunityController {
    @Autowired
    private CommunityService communityService;

    /**
     * 条件分页查询所有社团
     */
    @RequestMapping("/findAll")
    public @ResponseBody
    PageInfo findAll(CommunityConditionSearch condition) {
        PageInfo communityPageInfo = communityService.findAll(condition);
        return communityPageInfo;
    }

    /**
     * 后台查询所有
     */
    @RequestMapping("/findAll2")
    @ResponseBody
    public ResultVo<List<Community>> findAll2(CommunityConditionSearch condition) {
        PageInfo pageInfo = communityService.findAll(condition);
        ResultVo<List<Community>> resultVo = new ResultVo<>(0, 0, "", pageInfo.getList());
        resultVo.setCount((int) pageInfo.getTotal());
        return resultVo;
    }

    @RequestMapping("/delCommunityByCid")
    @ResponseBody
    public ResultVo delCommunityByCid(Integer cid) {
        ResultVo resultVo = communityService.delCommunityByCid(cid);
        return resultVo;
    }

    @RequestMapping("/updateFieldByCidAndValue")
    @ResponseBody
    public ResultVo updateFieldBycidAndValue(Integer cid, String field, String value) {
        ResultVo resultVo = communityService.updateFieldByCidAndValue(cid, field, value);
        return resultVo;
    }
}
