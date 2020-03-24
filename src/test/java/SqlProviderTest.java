import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.ylq.community.dto.ConditionSearch;
import pers.ylq.community.utils.SqlProvider;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class SqlProviderTest {
    @Autowired
    private SqlProvider sqlProvider;

    @Test
    public void testSelectAllActivity(){
        ConditionSearch conditon = new ConditionSearch();
        sqlProvider.selectAllActivity(conditon);
    }
}
