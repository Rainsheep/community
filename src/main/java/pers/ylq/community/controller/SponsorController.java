package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.service.SponsorService;

import java.util.List;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {
    @Autowired
    private SponsorService sponsorService;

    @RequestMapping("findAll")
    public @ResponseBody
    PageInfo findAll(SponsorConditionSearch condition) {
        return sponsorService.findAll(condition);
    }

    /**
     * 后台使用
     *
     * @param condition
     * @return
     */
    @RequestMapping("/findAll2")
    @ResponseBody
    public ResultVo<List<Sponsor>> findAll2(SponsorConditionSearch condition) {
        PageInfo pageInfo = sponsorService.findAll(condition);
        ResultVo<List<Sponsor>> result = new ResultVo<>(0, 0, "", pageInfo.getList());
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/delSponsorById")
    @ResponseBody
    public ResultVo delSponsorById(Integer sid) {
        ResultVo resultVo = sponsorService.delSponsorById(sid);
        return resultVo;
    }

    @RequestMapping("/updateFieldBySidAndValue")
    @ResponseBody
    public ResultVo updateFieldBySidAndValue(Integer sid, String field, String value) {
        //System.out.println(sid + " " + field + " " + value);
        ResultVo resultVo = sponsorService.updateFieldBySidAndValue(sid, field, value);
        return resultVo;
    }
}
