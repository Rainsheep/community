package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.DecimalFormat;

@Data
public class Sponsor implements Serializable {
    private Integer sid;
    private String sname;
    private String password;
    private String realName;
    private Integer activityNums; //赞助活动数量
    private Double moneySum; //赞助总金额
    private String belong;
    private String phone;
    private String address;
    private String detail;

    public String getFormatMoneySum(){
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        return decimalFormat.format(moneySum);
    }
}
