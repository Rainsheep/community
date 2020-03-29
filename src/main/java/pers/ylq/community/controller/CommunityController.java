package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.CommunityConditionSearch;
import pers.ylq.community.service.CommunityService;

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
    PageInfo findAll(CommunityConditionSearch condition){
        PageInfo communityPageInfo = communityService.findAll(condition);
        return communityPageInfo;
    }
}
