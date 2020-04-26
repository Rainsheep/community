package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.dto.SponsorConditionSearch;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.service.SponsorService;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/addSponsor")
    @ResponseBody
    public ResultVo addSponsor(Sponsor sponsor) {
        System.out.println(sponsor);
        ResultVo resultVo = sponsorService.addSponsor(sponsor);
        return resultVo;
    }

    @RequestMapping("/updateSponsor")
    @ResponseBody
    public ResultVo updateSponsor(Sponsor sponsor) {
        return sponsorService.updateSponsorBySid(sponsor);
    }

    @RequestMapping("/updatePassword")
    public @ResponseBody
    ResultVo updatePassword(HttpServletRequest request, String oldPassword, String newPassword) {
        Sponsor user = (Sponsor) request.getSession().getAttribute("user");
        Integer sid = user.getSid();
        ResultVo result = sponsorService.updatePasswordById(oldPassword, newPassword, sid);
        return result;
    }
}
