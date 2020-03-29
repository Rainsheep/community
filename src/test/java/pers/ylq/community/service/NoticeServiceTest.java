package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.entity.Notice;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class NoticeServiceTest {
    @Autowired
    private NoticeService noticeService;

    @Test
    public void testFindAll(){
        NoticeConditionSearch condition = new NoticeConditionSearch();
        condition.setKeyword("华北");
        PageInfo pageInfo = noticeService.findAll(condition);
        System.out.println(pageInfo);
    }
}
