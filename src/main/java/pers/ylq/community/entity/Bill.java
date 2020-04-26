package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Data
public class Bill implements Serializable {
    private Integer id;
    private Integer activityId;
    private String activityName;
    private String way;
    private Double cost;
    private Date datetime;
    private String place;
    private Integer mid;
    private String mname;
    private Date currentdate;
    private String note;
    private List<BillDetail> billDetails;
    private List<BillProve> billProves;

    public String getFormatCost() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###.00");
        if (cost != null && cost != 0) {
            return decimalFormat.format(cost);
        } else {
            return "0";
        }
    }

    public String getFormatDatetime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(datetime);
    }

    public String getFormatCurrentdate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return sdf.format(currentdate);
    }
}
