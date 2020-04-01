package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Admin;

@Repository
public interface AdminMapper {
    @Select("select real_name from tb_admin where aid=#{aid}")
    String findRealNameById(Integer aid);

    @Select("select * from tb_admin where aname=#{arg0} and password=#{arg1}")
    Admin findAdminByAnameAndPassword(String aname,String password);
}
