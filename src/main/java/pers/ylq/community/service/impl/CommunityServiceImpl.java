package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.mapper.CommunityMapper;
import pers.ylq.community.service.CommunityService;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public String findNameById(Integer cid) {
        return communityMapper.findNameById(cid);
    }
}
