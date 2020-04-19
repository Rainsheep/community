package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.ActivityImg;

import java.util.List;

@Repository
public interface ActivityImgMapper {
    @Select("select * from tb_activityimg where activity_id = #{activityId}")
    List<ActivityImg> findImgByActivityId(Integer activityId);

    @Insert("insert into tb_activityimg values(NULL,#{activityId},#{url})")
    Integer addActivityImg(ActivityImg activityImg);
}
