package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.utils.SqlProvider;

import java.util.List;

@Repository
public interface SponsorMapper {

    @SelectProvider(type = SqlProvider.class,method = "selectAllSponsor")
    @Results(id = "sponsorMap",value = {
            @Result(id = true,property = "sid",column = "sid"),
            @Result(property = "sname",column = "sname"),
            @Result(property = "password",column = "password"),
            @Result(property = "realName",column = "real_name"),
            @Result(property = "activityNums",column = "sid",one = @One(select = "pers.ylq.community.mapper.SupportMapper.findActivityCountBySid")),
            @Result(property = "moneySum",column = "sid",one = @One(select = "pers.ylq.community.mapper.SupportMapper.findMoneySumBySid")),
            @Result(property = "belong",column = "belong"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "address",column = "address"),
            @Result(property = "detail",column = "detail")
    })
    List<Sponsor> findAll(String keyword);

    @Select("select * from tb_sponsor where sname=#{arg0} and password=#{arg1}")
    @ResultMap("sponsorMap")
    Sponsor findSponsorBySnameAndPassword(String sname,String password);
}
