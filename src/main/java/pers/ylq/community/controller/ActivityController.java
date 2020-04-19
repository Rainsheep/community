package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ActivityDTO;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.entity.ActivityImg;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.service.ActivityImgServer;
import pers.ylq.community.service.ActivityService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityImgServer activityImgServer;

    /**
     * 分页查询所有已审核活动
     */
    //@RequestMapping("/findAll")
    //public String findAll(Integer currentPage, Integer pageSize, Model model) {
    //    PageInfo activityPageInfo = activityService.findAll(currentPage, pageSize);
    //    //System.out.println(activityPageInfo.getList().size());
    //    model.addAttribute("activityPageInfo", activityPageInfo);
    //    return "allActivityList";
    //}
    @RequestMapping("/findAll")
    public @ResponseBody
    PageInfo findAll(ConditionSearch condition) {
        //System.out.println(condition);
        //System.out.println(currentPage+" "+pageSize);
        //System.out.println(condition.getPageSize());
        PageInfo activityPageInfo = activityService.findAll(condition);
        //System.out.println(activityPageInfo.getPageSize());
        return activityPageInfo;
    }

    @RequestMapping("/findAll2")
    @ResponseBody
    public ResultVo<List<Activity>> findAll2(ConditionSearch condition) {
        PageInfo pageInfo = activityService.findAll(condition);
        ResultVo<List<Activity>> resultVo = new ResultVo<>(0, 0, "", pageInfo.getList());
        resultVo.setCount((int) pageInfo.getTotal());
        return resultVo;
    }

    /**
     * 查看活动详情
     */
    @RequestMapping("/activityDetail")
    public String activityDetail(Integer activityId, Integer onlyContent, Model model) {
        Activity activity = activityService.findActivityById(activityId);
        //System.out.println(activity.getDetail());
        //System.out.println(activity.getImages().size());
        model.addAttribute("activity", activity);
        model.addAttribute("onlyContent", onlyContent);
        return "activityDetail";
    }

    @RequestMapping("delActivityById")
    @ResponseBody
    public ResultVo delActivityById(Integer activityId) {
        ResultVo resultVo = activityService.delActivityById(activityId);
        return resultVo;
    }

    @RequestMapping("/findNotAduitActivity")
    @ResponseBody
    public ResultVo findNotAduitActivity(ConditionSearch condition) {
        ResultVo<List<Activity>> resultVo = activityService.findNotAduitActivity(condition);
        return resultVo;
    }

    @RequestMapping("/passActivityById")
    @ResponseBody
    public ResultVo passActivityById(HttpServletRequest request, Integer activityId) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        ResultVo resultVo = activityService.passActivityById(activityId, user.getAid());
        return resultVo;
    }

    @RequestMapping("/rejectActivityById")
    @ResponseBody
    public ResultVo rejectActivityById(HttpServletRequest request, Integer activityId, String message) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        ResultVo resultVo = activityService.rejectActivityById(activityId, message, user.getAid());
        return resultVo;
    }

    @RequestMapping("/addActivity")
    @ResponseBody
    public ResultVo addActivity(ActivityDTO activityDTO) {
        ResultVo resultVo = activityService.addActivity(activityDTO);
        if (resultVo.getStatus() == -1) return resultVo;

        Integer activityId = (Integer) resultVo.getData();

        Map<String,String> map=activityDTO.getImgs();
        if(map==null)return resultVo;
        for (String s : map.keySet()) {
            ActivityImg activityImg = new ActivityImg();
            activityImg.setActivityId(activityId);
            activityImg.setUrl(map.get(s));
            activityImgServer.addActivityImg(activityImg);
        }
        return resultVo;
    }
}
