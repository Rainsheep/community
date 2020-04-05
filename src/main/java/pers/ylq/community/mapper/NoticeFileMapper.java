package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.NoticeFile;

import java.util.List;

@Repository
public interface NoticeFileMapper {
    @Select("select * from tb_noticefile where nid=#{noticeId}")
    List<NoticeFile> findNoteceFileByNoticeId(Integer noticeId);

    @Insert("insert into tb_noticefile(nid,filename,url) values(#{arg0},#{arg1},#{arg2})")
    void insertNoticeFile(Integer nid, String filename, String url);
}
