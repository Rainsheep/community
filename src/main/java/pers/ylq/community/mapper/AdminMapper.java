package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Admin;

@Repository
public interface AdminMapper {
    @Select("select real_name from tb_admin where aid=#{aid}")
    String findRealNameById(Integer aid);

    @Select("select * from tb_admin where aname=#{arg0} and password=#{arg1}")
    Admin findAdminByAnameAndPassword(String aname,String password);

    @Update("update tb_admin set real_name=#{arg0} where aid=#{arg1}")
    Integer updateRealNameById(String realName,Integer aid);

    @Update("update tb_admin set password=#{arg0} where aid=#{arg1}")
    Integer updatePasswordById(String newPassword,Integer aid);

    @Select("select password from tb_admin where aid=#{aid}")
    String findPasswordById(Integer aid);
}
