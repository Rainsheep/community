package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.entity.Notice;
import pers.ylq.community.entity.NoticeFile;
import pers.ylq.community.utils.SqlProvider;

import java.util.List;

@Repository
public interface NoticeMapper {
    // 条件查询所有公告
    @SelectProvider(type = SqlProvider.class, method = "selectAllNotice")
    @Results(id = "noticeMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "title", column = "title"),
            @Result(property = "introduction", column = "introduction"),
            @Result(property = "content", column = "content"),
            @Result(property = "aid", column = "aid"),
            @Result(property = "aname", column = "aid", one = @One(select = "pers.ylq.community.mapper.AdminMapper.findRealNameById")),
            @Result(property = "datetime", column = "datetime"),
            @Result(property = "noticeFiles", column = "id", many = @Many(select = "pers.ylq.community.mapper.NoticeFileMapper.findNoteceFileByNoticeId"))
    })
    List<Notice> findAll(NoticeConditionSearch condition);

    @Select("select * from tb_notice where id=#{noticeId}")
    @ResultMap("noticeMap")
    Notice findNoticeById(Integer noticeId);

    @Delete("delete from tb_notice where id=#{noticeId}")
    Integer deleteNoticeById(Integer noticeId);

    @Insert("insert into tb_notice(title,content,aid) values(#{title},#{content},#{aid})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertNotice(Notice notice);
}
