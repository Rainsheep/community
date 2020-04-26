package pers.ylq.community.dto;

import lombok.Data;
import pers.ylq.community.entity.BillProve;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 赞助商所看到的账单详情
 */
@Data
public class BillDTO2 implements Serializable {
    private Integer billId;
    private String way;
    private Double cost;
    private Double money;
    private Date datetime;
    private String place;
    private Integer mid;
    private String realName;
    private Date currentdate;
    private String note;
    private List<BillProve> billProves;

    public String getFormatCost() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (cost != null && cost != 0) {
            return decimalFormat.format(cost);
        } else {
            return "0";
        }
    }

    public String getFormatMoney() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (money != null && money != 0) {
            return decimalFormat.format(money);
        } else {
            return "0";
        }
    }

    public String getFormatDatetime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(datetime);
    }

    public String getFormatCurrentdate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return sdf.format(currentdate);
    }
}
