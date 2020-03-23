package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface CommunityMapper {
    @Select("select cname from tb_community where cid=#{cid}")
    String findNameById(Integer cid);
}
