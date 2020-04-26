package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pers.ylq.community.dto.BillDTO2;
import pers.ylq.community.entity.Bill;

import java.util.List;

@Repository
public interface BillMapper {

    @Insert("insert into tb_bill values(NULL,#{activityId},#{way},#{cost},#{datetime},#{place},#{mid},NULL,#{note})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Integer addBill(Bill bill);

    @Results(id = "billMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "activityId", column = "activity_id"),
            @Result(property = "activityName", column = "activity_id", one = @One(select = "pers.ylq.community.mapper.ActivityMapper.findNameById")),
            @Result(property = "way", column = "way"),
            @Result(property = "cost", column = "cost"),
            @Result(property = "datetime", column = "datetime"),
            @Result(property = "place", column = "place"),
            @Result(property = "mid", column = "mid"),
            @Result(property = "mname", column = "mid", one = @One(select = "pers.ylq.community.mapper.ManagerMapper.findRealNameById")),
            @Result(property = "currentdate", column = "currentdate"),
            @Result(property = "note", column = "note"),
            @Result(property = "billDetails", column = "id", many = @Many(select = "pers.ylq.community.mapper.BillDetailMapper.findBillDetailByBillId")),
            @Result(property = "billProves", column = "id", many = @Many(select = "pers.ylq.community.mapper.BillProveMapper.findBillProveByBillId"))
    })
    @Select("select * from tb_bill where activity_id=#{activityId}")
    List<Bill> findBillByActivityId(Integer activityId);


    @Results(value = {
            @Result(property = "billId", column = "bill_id"),
            @Result(property = "mid", column = "mid"),
            @Result(property = "realName", column = "mid", one = @One(select = "pers.ylq.community.mapper.ManagerMapper.findRealNameById")),
            @Result(property = "billProves", column = "bill_id", many = @Many(select = "pers.ylq.community.mapper.BillProveMapper.findBillProveByBillId"))
            })
    @Select("SELECT bill_id,way,cost,money,datetime,place,mid,currentdate,note FROM tb_billdetail t1 JOIN tb_bill t2 ON t1.bill_id=t2.id WHERE t1.support_id=#{supportId}")
    List<BillDTO2> findBillBySupportId(Integer supportId);
}
