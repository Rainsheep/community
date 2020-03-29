package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.NoticeFile;

import java.util.List;

@Repository
public interface NoticeFileMapper {
    @Select("select * from tb_noticefile where nid=#{noticeId}")
    List<NoticeFile> findNoteceFileByNoticeId(Integer noticeId);
}
