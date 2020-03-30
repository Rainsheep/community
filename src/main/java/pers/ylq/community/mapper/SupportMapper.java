package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface SupportMapper {
    /**
     * 查询赞助商赞助的活动数量
     * @param sid
     * @return
     */
    @Select("select count(activity_id) from tb_support where sid=#{sid}")
    Integer findActivityCountBySid(Integer sid);

    /**
     * 查询赞助商赞助的总金额
     */
    @Select("SELECT SUM(money) FROM tb_support WHERE sid=#{sid}")
    Double findMoneySumBySid(Integer sid);
}
