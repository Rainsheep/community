package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.BillProve;

import java.util.List;

@Repository
public interface BillProveMapper {

    @Insert("insert into tb_billprove values(NULL,#{billId},#{filename},#{url})")
    Integer addBillProve(BillProve billProve);

    @Select("select * from tb_billprove where bill_id=#{billId}")
    List<BillProve> findBillProveByBillId(Integer billId);
}
