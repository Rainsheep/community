package pers.ylq.community.utils;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.mapper.CommunityMapper;

import java.util.List;

//提供动态sql语句
public class SqlProvider {

    public String selectAllActivity(ConditionSearch condition) {

        String sql = "select * from tb_activity where type = 1 ";

        if (condition.getActivityName() != null && !condition.getActivityName().equals("")) {
            sql += " and name like '%" + condition.getActivityName() + "%'";
        }
        if (condition.getActivityTime() != null && !condition.getActivityTime().equals("")) {
            sql += " and datetime like binary '%" + condition.getActivityTime() + "%'";
        }
        if (condition.getActivityPlace() != null && !condition.getActivityPlace().equals("")) {
            sql += " and place like '%" + condition.getActivityPlace() + "%'";
        }
        //修改后的community字段为id1,id2,...idn
        if (condition.getCommunity() != null && !condition.getCommunity().equals("")) {
            sql += " and belong in(" + condition.getCommunity() + ")";
        }

        sql += " order by update_time DESC";
        //System.out.println(sql);
        return sql;
    }

    public String selectAllNotice(NoticeConditionSearch condition) {
        //SELECT * FROM tb_notice WHERE title LIKE '%华北%' OR introduction LIKE '%华北%'
        // OR content LIKE '%华北%'
        // OR (aid IN (SELECT aid FROM tb_admin WHERE real_name LIKE '%杨%'))
        // OR datetime LIKE '%1%'
        // ORDER BY DATETIME DESC
        String sql = "select * from tb_notice ";
        if (condition.getKeyword() != null && !condition.getKeyword().equals("")) {
            sql += " WHERE title LIKE '%" + condition.getKeyword() + "%' OR introduction LIKE '%" + condition.getKeyword() + "%' OR content LIKE '%" + condition.getKeyword() + "%' OR (aid IN (SELECT aid FROM tb_admin WHERE real_name LIKE '%" + condition.getKeyword() + "%')) OR datetime LIKE binary '%"+condition.getKeyword()+"%' ";
        }
        sql += " order by datetime DESC";
        //System.out.println(sql);
        return sql;
    }

    public String selectAllCommunity(String keyword){
        String sql="SELECT * FROM tb_community ";
        if(keyword!=null && keyword.length()>0){
            sql+="WHERE cname LIKE '%"+keyword+"%' OR mname LIKE '%"+keyword+"%' OR amount LIKE '%"+keyword+"%' OR hold_time LIKE binary '%"+keyword+"%' OR LEVEL LIKE '%"+keyword+"%' ";
        }
        sql+=" order by hold_time DESC";
        System.out.println(sql);
        return sql;
    }
}
