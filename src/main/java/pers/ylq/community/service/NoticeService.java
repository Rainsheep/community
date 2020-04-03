package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Notice;

public interface NoticeService {
    PageInfo findAll(NoticeConditionSearch condition);
    Notice findNoticeById(Integer noticeId);
    ResultVo deleteNoticeById(Integer noticeId);
}
