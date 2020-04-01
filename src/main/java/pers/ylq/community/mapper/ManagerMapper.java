package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Manager;

@Repository
public interface ManagerMapper {
    @Select("select real_name from tb_manager where mid=#{mid}")
    String findRealNameById(Integer mid);

    @Select("select * from tb_manager where mname=#{arg0} and password=#{arg1}")
    Manager findManagerByMnameAndPassword(String mname,String password);
}
