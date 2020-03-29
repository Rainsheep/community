package pers.ylq.community.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.entity.Notice;
import pers.ylq.community.mapper.NoticeMapper;
import pers.ylq.community.service.NoticeService;

import java.util.List;

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
}
