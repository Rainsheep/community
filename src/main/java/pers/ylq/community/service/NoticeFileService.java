package pers.ylq.community.service;

import org.springframework.stereotype.Service;

public interface NoticeFileService {
    void insertNoticeFile(Integer nid,String filename,String url);
}
