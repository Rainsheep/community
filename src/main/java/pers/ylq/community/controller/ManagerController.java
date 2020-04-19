package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.ManagerService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping("/findAll")
    @ResponseBody
    public ResultVo<List<Manager>> findAll(Integer page, Integer limit) {
        PageInfo pageInfo = managerService.findAll(page, limit);
        ResultVo<List<Manager>> result = new ResultVo<>(0, 0, "", pageInfo.getList());
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/delManagerById")
    @ResponseBody
    public ResultVo delManagerById(Integer mid) {
        ResultVo resultVo = managerService.delManagerById(mid);
        return resultVo;
    }

    @RequestMapping("/updateFieldByMidAndValue")
    @ResponseBody
    public ResultVo updateFieldByMidAndValue(Integer mid, String field, String value) {
        ResultVo resultVo = managerService.updateFieldByMidAndValue(mid, field, value);
        return resultVo;
    }

    @RequestMapping("/addManager")
    @ResponseBody
    public ResultVo addManager(Manager manager) {
        ResultVo resultVo = managerService.addManager(manager);
        return resultVo;
    }

    @RequestMapping("/updatePassword")
    public @ResponseBody
    ResultVo updatePassword(HttpServletRequest request, String oldPassword, String newPassword) {
        Manager user = (Manager) request.getSession().getAttribute("user");
        Integer mid = user.getMid();
        ResultVo result = managerService.updatePasswordById(oldPassword, newPassword, mid);
        return result;
    }

    @RequestMapping("/updateRealName")
    public @ResponseBody
    ResultVo updateRealName(HttpServletRequest request, String realName) {
        Manager user = (Manager) request.getSession().getAttribute("user");
        Integer mid = user.getMid();
        ResultVo result = managerService.updateRealNameById(realName, mid);
        return result;
    }
}
