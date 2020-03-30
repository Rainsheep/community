package pers.ylq.community.service;

import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.ylq.community.dto.SponsorConditionSearch;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class SponsorServiceTest {
    @Autowired
    private SponsorService sponsorService;

    @Test
    public void testFindAll(){
        SponsorConditionSearch condition = new SponsorConditionSearch();
        PageInfo pageInfo = sponsorService.findAll(condition);
    }
}
