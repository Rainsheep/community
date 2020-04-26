package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.ylq.community.service.ActivityImgServer;

@Controller
@RequestMapping("/activityImg")
public class ActivityImgController {

    @Autowired
    private ActivityImgServer activityImgServer;

    @RequestMapping("/delActivityImgByActivityId")
    public void delActivityImgByActivityId(Integer activityId) {
        activityImgServer.delActivityImgByActivityId(activityId);
    }
}
