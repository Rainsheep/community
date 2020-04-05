package pers.ylq.community.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.dto.NoticeDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.entity.Notice;
import pers.ylq.community.service.NoticeFileService;
import pers.ylq.community.service.NoticeService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @Autowired
    private NoticeFileService noticeFileService;

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
        //System.out.println(notice.getNoticeFiles());
        model.addAttribute("notice", notice);
        model.addAttribute("onlyContent", onlyContent);
        return "noticeDetail";
    }

    /**
     * 删除公告
     */
    @RequestMapping("/deleteNotice")
    public @ResponseBody
    ResultVo deleteNoticeById(Integer noticeId) {
        ResultVo result = noticeService.deleteNoticeById(noticeId);
        return result;
    }

    @RequestMapping("/addNotice")
    @ResponseBody
    public ResultVo addNotice(HttpServletRequest request, NoticeDTO noticeDTO) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        Integer aid = user.getAid();
        Integer noticeId = noticeService.insertNotice(noticeDTO, aid);
        Map<String, String> files = noticeDTO.getFiles();
        if (files != null && files.size() > 0) {
            for (String file : files.keySet()) {
                noticeFileService.insertNoticeFile(noticeId, file, files.get(file));
            }
        }
        return null;
    }


}
