package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.entity.Activity;
import pers.ylq.community.utils.SqlProvider;

import java.util.List;

@Repository
public interface ActivityMapper {

    //@Select("select * from tb_activity where type = 1 order by datetime DESC")
    @SelectProvider(type = SqlProvider.class, method = "selectAllActivity")
    @Results(id = "activityMap", value = {
            @Result(property = "id", column = "id", id = true),
            @Result(property = "name", column = "name"),
            @Result(property = "datetime", column = "datetime"),
            @Result(property = "place", column = "place"),
            @Result(property = "belong", column = "belong"),
            @Result(property = "cname", column = "belong",
                    one = @One(select = "pers.ylq.community.mapper.CommunityMapper.findNameById")),
            @Result(property = "amount", column = "amount"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "sponsorMoney", column = "sponsor_money"),
            @Result(property = "mid", column = "mid"),
            @Result(property = "managerRealName", column = "mid",
                    one = @One(select = "pers.ylq.community.mapper.ManagerMapper.findRealNameById")),
            @Result(property = "type", column = "type"),
            @Result(property = "aid", column = "aid"),
            @Result(property = "adminRealName", column = "aid",
                    one = @One(select = "pers.ylq.community.mapper.AdminMapper.findRealNameById")),
            @Result(property = "updateTime", column = "update_time"),
            @Result(property = "dismissMessage", column = "dismiss_message"),
            @Result(property = "images", column = "id",
                    many = @Many(select = "pers.ylq.community.mapper.ActivityImgMapper.findImgByActivityId"))
    })
    List<Activity> findAll(ConditionSearch condition);

    @Select("select * from tb_activity where type=2")
    @ResultMap("activityMap")
    List<Activity> findNotAduitActivity();

    @Select("select * from tb_activity where id=#{activityId}")
    @ResultMap("activityMap")
    Activity findActivityById(Integer activityId);

    @Select("select count(id) from tb_activity where belong=#{cid}")
    Integer findCountByCid(Integer cid);

    @Update("update tb_activity set status=-1 where id=#{activityId}")
    Integer delActivityById(Integer activityId);

    @Update("update tb_activity set type=1,aid=#{arg1},update_time=NULL where id=#{arg0}")
    Integer passActivityById(Integer activityId,Integer aid);

    @Update("update tb_activity set type=3,aid=#{arg2},update_time=NULL,dismiss_message=#{arg1} where id=#{arg0}")
    Integer rejectActivityById(Integer activityId,String message,Integer aid);

}
