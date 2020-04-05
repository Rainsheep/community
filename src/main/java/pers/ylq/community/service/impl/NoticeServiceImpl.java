package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.dto.NoticeDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Notice;
import pers.ylq.community.entity.NoticeFile;
import pers.ylq.community.mapper.NoticeMapper;
import pers.ylq.community.service.NoticeService;

import java.util.List;
import java.util.Map;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public PageInfo findAll(NoticeConditionSearch condition) {
        PageHelper.startPage(condition.getCurrentPage(), condition.getPageSize());
        List<Notice> notices = noticeMapper.findAll(condition);
        //for (Notice notice : notices) {
        //    System.out.println(notice);
        //}
        PageInfo<Notice> noticePageInfo = new PageInfo<>(notices);
        return noticePageInfo;
    }

    @Override
    public Notice findNoticeById(Integer noticeId) {
        return noticeMapper.findNoticeById(noticeId);
    }

    @Override
    public ResultVo deleteNoticeById(Integer noticeId) {
        ResultVo result = null;
        Integer flag = noticeMapper.deleteNoticeById(noticeId);
        if (flag <= 0) {
            result = new ResultVo<>(0, 1, "删除失败!", null);
        } else {
            result = new ResultVo<>(0, 0, "删除成功!", null);
        }
        return result;
    }

    @Override
    public Integer insertNotice(NoticeDTO noticeDTO, Integer aid) {
        Notice notice = new Notice();
        notice.setTitle(noticeDTO.getTitle());
        notice.setContent(noticeDTO.getContent());
        notice.setAid(aid);

        noticeMapper.insertNotice(notice);
        return notice.getId();
    }

    @Override
    public void updateNotice(NoticeDTO noticeDTO, Integer aid){
        Notice notice = new Notice();
        notice.setId(noticeDTO.getId());
        notice.setTitle(noticeDTO.getTitle());
        notice.setContent(noticeDTO.getContent());
        notice.setAid(aid);
        noticeMapper.updateNotice(notice);
    }
}
