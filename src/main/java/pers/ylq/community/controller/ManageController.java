package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManageController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping("/index")
    public String index(){
        return "manager/index";
    }

    @RequestMapping("/addManager")
    @ResponseBody
    public ResultVo addManager(Manager manager){
        ResultVo resultVo = managerService.addManager(manager);
        return resultVo;
    }
}
