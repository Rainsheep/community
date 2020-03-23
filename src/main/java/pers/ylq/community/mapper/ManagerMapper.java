package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerMapper {
    @Select("select real_name from tb_manager where mid=#{mid}")
    String findRealNameById(Integer mid);
}
