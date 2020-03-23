package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    @Select("select real_name from tb_admin where aid=#{aid}")
    String findRealNameById(Integer aid);
}
