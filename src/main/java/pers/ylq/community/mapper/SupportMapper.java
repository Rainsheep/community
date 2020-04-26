package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Support;

import java.util.List;

@Repository
public interface SupportMapper {
    /**
     * 查询赞助商赞助的活动数量
     *
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

    @Select("SELECT SUM(money) FROM tb_support WHERE activity_id=#{activityId}")
    Double findMoneySumByActivityId(Integer id);

    @Insert("insert into tb_support values(NULL,#{sid},#{activityId},#{money},#{leftMoney},NULL)")
    Integer addSupport(Support support);

    @Results(id = "supportMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "sid", column = "sid"),
            @Result(property = "realName", column = "sid", one = @One(select = "pers.ylq.community.mapper.SponsorMapper.findRealNameBySid")),
            @Result(property = "belong", column = "sid", one = @One(select = "pers.ylq.community.mapper.SponsorMapper.findBelongBySid")),
            @Result(property = "activityId", column = "activity_id"),
            @Result(property = "activityName", column = "activity_id", one = @One(select = "pers.ylq.community.mapper.ActivityMapper.findNameById")),
            @Result(property = "money", column = "money"),
            @Result(property = "leftMoney", column = "left_money"),
            @Result(property = "supportTime", column = "support_time")
    })
    @Select("select * from tb_support where activity_id=#{activityId}")
    List<Support> findSupportByActivityId(Integer activityId);

    @Update("update tb_support set left_money=left_money-#{arg1} where id=#{arg0}")
    Integer subLeftMoney(Integer id, Double money);

    @Select("select sid from tb_support where id=#{id}")
    Integer findSidById(Integer id);

    @Select("select * from tb_support where sid=#{sid}")
    @ResultMap("supportMap")
    List<Support> findSupportBySid(Integer sid);
}
