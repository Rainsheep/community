package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
public class ActivityDTO implements Serializable {
    private String name;
    private Date datetime;
    private String place;
    private Integer belong;
    private Integer amount;
    private String detail;
    private Double sponsorMoney;
    private Integer mid;
    private Integer type;
    private Map<String, String> imgs;

    public void setFormatDate(String formatDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = sdf.parse(formatDate);
        this.datetime = date;
    }

}
