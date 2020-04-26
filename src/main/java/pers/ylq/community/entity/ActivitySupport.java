package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class ActivitySupport implements Serializable {
    private Integer id;
    private String name;
    private Date datetime;
    private String place;
    private Integer belong;
    private String cname;
    private Integer amount;
    private Double sponsorMoney;
    private Double nowMoney; //已有赞助
    private String supportStatus; //赞助状态

    public String getFormatDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
        return sdf.format(datetime);
    }

    public String getFormatSponsorMoney() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (sponsorMoney != null && sponsorMoney != 0) {
            return decimalFormat.format(sponsorMoney);
        } else {
            return "0";
        }
    }

    public String getFormatNowMoney(){
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (nowMoney != null && nowMoney != 0) {
            return decimalFormat.format(nowMoney);
        } else {
            return "0";
        }
    }
}
