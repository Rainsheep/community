package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Activity;

import java.util.List;

@Repository
public interface ActivityMapper {

    @Select("select * from tb_activity where type = 1")
    @Results(id = "activityMap", value = {
            @Result(property = "id", column = "id", id = true),
            @Result(property = "name", column = "name"),
            @Result(property = "datetime", column = "datetime"),
            @Result(property = "place", column = "place"),
            @Result(property = "belong", column = "belong"),
            @Result(property = "amount", column = "amount"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "sponsorMoney", column = "sponsor_money"),
            @Result(property = "mid", column = "mid"),
            @Result(property = "type", column = "type"),
            @Result(property = "aid", column = "aid"),
            @Result(property = "dismissMessage", column = "dismiss_message"),
            @Result(property = "images", column = "id",
                    many = @Many(select = "pers.ylq.community.mapper.ActivityImgMapper.findImgById"))
    })
    List<Activity> findAll();
}
