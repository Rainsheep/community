package pers.ylq.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.ylq.community.service.NoticeFileService;

@Controller
@RequestMapping("/noticeFile")
public class NoticeFileController {

    @Autowired
    private NoticeFileService noticeFileService;

    @RequestMapping("/delNoticeFile")
    public void delNoticeFileById(Integer id){
        noticeFileService.delNoticeFileById(id);
    }
}
