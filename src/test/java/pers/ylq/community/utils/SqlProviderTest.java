package pers.ylq.community.utils;

import com.sun.security.sasl.Provider;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.dto.NoticeConditionSearch;
import pers.ylq.community.utils.SqlProvider;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class SqlProviderTest {

    private SqlProvider sqlProvider=new SqlProvider();

    @Test
    public void testSelectAllActivity(){
        ConditionSearch conditon = new ConditionSearch();
        sqlProvider.selectAllActivity(conditon);
    }

    @Test
    public void testSelectAllNotice(){
        NoticeConditionSearch condition = new NoticeConditionSearch();
        condition.setKeyword("华北");
        sqlProvider.selectAllNotice(condition);
    }
}
