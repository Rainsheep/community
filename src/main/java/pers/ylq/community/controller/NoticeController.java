package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.entity.Notice;
import pers.ylq.community.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 查询所有公告
     */
    @RequestMapping("/findAll")
    public @ResponseBody
    PageInfo findAll(NoticeConditionSearch condition) {
        //System.out.println(condition);
        PageInfo noticePageInfo = noticeService.findAll(condition);
        //System.out.println(noticePageInfo.getList().size());
        return noticePageInfo;
    }

    /**
     * 查看公告详情
     */
    @RequestMapping("/noticeDetail")
    public String noticeDetail(Integer noticeId, Integer onlyContent, Model model) {
        Notice notice = noticeService.findNoticeById(noticeId);
        //System.out.println(notice);
        model.addAttribute("notice", notice);
        model.addAttribute("onlyContent",onlyContent);
        return "noticeDetail";
    }

    /**
     * 删除公告
     */
    @RequestMapping("/deleteNotice")
    public @ResponseBody
    ResultVo deleteNoticeById(Integer noticeId){
        ResultVo result = noticeService.deleteNoticeById(noticeId);
        return result;
    }


}
