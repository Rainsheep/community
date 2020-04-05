package pers.ylq.community.service;

import org.springframework.stereotype.Service;
import pers.ylq.community.dto.NoticeDTO;

public interface NoticeFileService {
    void insertNoticeFile(Integer nid,String filename,String url);
    void delNoticeFileById(Integer id);
}
