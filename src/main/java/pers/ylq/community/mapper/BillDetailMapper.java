package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.BillDetail;

import java.util.List;

@Repository
public interface BillDetailMapper {
    @Insert("insert into tb_billdetail values(NULL,#{billId},#{supportId},#{money})")
    Integer addBillDetail(BillDetail billDetail);

    @Select("select * from tb_billdetail where bill_id=#{billId}")
    List<BillDetail> findBillDetailByBillId(Integer billId);
}
