package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Community;
import pers.ylq.community.utils.SqlProvider;

import java.util.List;

@Repository
public interface CommunityMapper {

    @Results(id = "communityMap", value = {
            @Result(id = true, property = "cid", column = "cid"),
            @Result(property = "cname", column = "cname"),
            @Result(property = "mname", column = "mname"),
            @Result(property = "amount", column = "amount"),
            @Result(property = "activityNums", column = "cid", one = @One(select = "pers.ylq.community.mapper.ActivityMapper.findCountByCid")),
            @Result(property = "holdTime", column = "hold_time"),
            @Result(property = "level", column = "level")
    })
    @Select("select * from tb_community where cid=#{cid}")
    Community findCommunityById(Integer cid);

    @Select("select cname from tb_community where cid=#{cid}")
    String findNameById(Integer cid);

    @Select("select cid from tb_community where cname like '%${value}%'")
    List<Integer> findIdByName(String cname);

    @Select("select cid from tb_community where cname=#{cname}")
    Integer findIdByName2(String cname);

    @SelectProvider(type = SqlProvider.class, method = "selectAllCommunity")
    List<Community> findAll(String keyword);

    @Select("SELECT cname FROM tb_community WHERE cid=(SELECT belong FROM tb_manager WHERE MID=#{mid})")
    String findCnameByMid(Integer mid);

    //@Delete("delete from tb_community where cid=#{cid}")
    @Update("update tb_community set status=-1 where cid=#{cid}")
    Integer delCommunityByCid(Integer cid);

    @Update("update tb_community set ${arg1}=#{arg2} where cid=#{arg0}")
    Integer updateFieldByCidAndValue(Integer cid, String field, String value);

    @Insert("insert tb_community VALUES(NULL,#{cname},#{mname},#{amount},0,#{holdTime,jdbcType=DATE},#{level},0)")
    Integer addCommunity(Community community);

    @Select("select * from tb_community where cname=#{cname}")
    Community findCommunityByCname(String cname);

    @Update("update tb_community set mname=#{arg1},amount=#{arg2} where cid=#{arg0}")
    Integer updateMnameAndAmount(Integer cid,String mname,Integer amount);


}
