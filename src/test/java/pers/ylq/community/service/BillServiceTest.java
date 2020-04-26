package pers.ylq.community.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.ylq.community.dto.ResultVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class BillServiceTest {
    @Autowired
    private BillService billService;

    @Test
    public void findBillBySupportId() {
        ResultVo resultVo = billService.findBillBySupportId(1, 100, 4);
        System.out.println(resultVo);
    }
}
