package pers.ylq.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.mapper.NoticeFileMapper;
import pers.ylq.community.service.NoticeFileService;
import pers.ylq.community.service.NoticeService;

@Service("noticeFileService")
public class NoticeFileServiceImpl implements NoticeFileService {

    @Autowired
    private NoticeFileMapper noticeFileMapper;

    @Override
    public void insertNoticeFile(Integer nid, String filename, String url) {
        noticeFileMapper.insertNoticeFile(nid, filename, url);
    }

    @Override
    public void delNoticeFileById(Integer id) {
        noticeFileMapper.delNoticeFileById(id);
    }
}
