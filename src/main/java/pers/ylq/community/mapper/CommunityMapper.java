package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Community;
import pers.ylq.community.utils.SqlProvider;

import java.util.List;

@Repository
public interface CommunityMapper {
    @Select("select cname from tb_community where cid=#{cid}")
    String findNameById(Integer cid);

    @Select("select cid from tb_community where cname like '%${value}%'")
    List<Integer> findIdByName(String cname);

    @SelectProvider(type = SqlProvider.class,method = "selectAllCommunity")
    List<Community> findAll(String keyword);
}
