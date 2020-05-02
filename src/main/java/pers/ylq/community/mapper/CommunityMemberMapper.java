package pers.ylq.community.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import pers.ylq.community.entity.CommunityMember;

import java.util.List;

@Repository
public interface CommunityMemberMapper {
    @Select("select * from tb_communitymember where belong=#{belong}")
    List<CommunityMember> findCommunityMemberByBelong(Integer belong);

    @Update("update tb_communitymember set ${arg1}=#{arg2} where id=#{arg0}")
    Integer updateFieldByIdAndValue(Integer id, String field, String value);

    @Delete("delete from tb_communitymember where id=#{id}")
    Integer delCommunityMemberById(Integer id);

    @Insert("insert into tb_communitymember values(NULL,#{xuehao},#{realName},#{position},#{belong})")
    Integer addCommunityMember(CommunityMember communityMember);
}
