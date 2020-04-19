package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.entity.ActivityImg;
import pers.ylq.community.mapper.ActivityImgMapper;
import pers.ylq.community.service.ActivityImgServer;

@Service("activityImgService")
public class ActivityImgServiceImpl implements ActivityImgServer {
    @Autowired
    private ActivityImgMapper activityImgMapper;

    @Override
    public void addActivityImg(ActivityImg activityImg) {
        activityImgMapper.addActivityImg(activityImg);
    }
}
