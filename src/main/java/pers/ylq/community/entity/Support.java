package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class Support implements Serializable {
    private Integer id;
    private Integer sid;
    private String realName;
    private String belong;
    private Integer activityId;
    private String activityName;
    private Double money;
    private Double leftMoney;
    private Date supportTime;
    private Integer type;

    public String getFormatSupportTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return sdf.format(supportTime);
    }

    public String getFormatMoney(){
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (money != null && money != 0) {
            return decimalFormat.format(money);
        } else {
            return "0";
        }
    }

    public String getFormatLeftMoney(){
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (leftMoney != null && leftMoney != 0) {
            return decimalFormat.format(leftMoney);
        } else {
            return "0";
        }
    }
}
