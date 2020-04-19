package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Manager;

import java.util.List;

@Repository
public interface ManagerMapper {
    @Select("select real_name from tb_manager where mid=#{mid}")
    String findRealNameById(Integer mid);

    @Select("select * from tb_manager where mname=#{arg0} and password=#{arg1} and status!=-1")
    Manager findManagerByMnameAndPassword(String mname, String password);

    @Results(id = "managerMap", value = {
            @Result(id = true, property = "mid", column = "mid"),
            @Result(property = "mname", column = "mname"),
            @Result(property = "password", column = "password"),
            @Result(property = "realName", column = "real_name"),
            @Result(property = "belong", column = "belong"),
            @Result(property = "cname", column = "belong", one = @One(select = "pers.ylq.community.mapper.CommunityMapper.findNameById"))
    })
    @Select("select * from tb_manager where status!=-1")
    List<Manager> findAll();

    //@Delete("delete from tb_manager where mid = #{mid}")
    @Update("update tb_manager set status=-1 where mid=#{mid}")
    Integer delManagerById(Integer mid);

    @Update("update tb_manager set ${arg1}=#{arg2} where mid=#{arg0}")
    Integer updateFieldByMidAndValue(Integer mid, String field, String value);

    @Insert("insert into tb_manager values(NULL,#{mname},#{password},#{realName},#{belong},0)")
    Integer addManager(Manager manager);

    @Select("select * from tb_manager where mname=#{mname}")
    Manager findManagerByMname(String mname);
}
