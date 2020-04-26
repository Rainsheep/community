package pers.ylq.community.service;

import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.ActivityImg;

public interface ActivityImgServer {
    void addActivityImg(ActivityImg activityImg);

    void delActivityImgByActivityId(Integer activityId);
}
