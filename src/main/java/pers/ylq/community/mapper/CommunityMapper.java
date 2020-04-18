package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
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

    @Select("select cid from tb_community where cname=#{cname}")
    Integer findIdByName2(String cname);

    @SelectProvider(type = SqlProvider.class,method = "selectAllCommunity")
    List<Community> findAll(String keyword);

    @Select("SELECT cname FROM tb_community WHERE cid=(SELECT belong FROM tb_manager WHERE MID=#{mid})")
    String findCnameByMid(Integer mid);

    //@Delete("delete from tb_community where cid=#{cid}")
    @Update("update tb_community set status=-1 where cid=#{cid}")
    Integer delCommunityByCid(Integer cid);

    @Update("update tb_community set ${arg1}=#{arg2} where cid=#{arg0}")
    Integer updateFieldByCidAndValue(Integer cid, String field, String value);
}
