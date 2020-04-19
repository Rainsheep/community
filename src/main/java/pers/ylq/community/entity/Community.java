package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class Community implements Serializable {
    private Integer cid;
    private String cname;
    private String mname;
    private Integer amount;
    private Integer activityNums;
    private Date holdTime;
    private String level;

    public String getFormatDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(holdTime);
    }
    public void setFormatDate(String formatDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(formatDate);
        this.holdTime=date;
    }
}
