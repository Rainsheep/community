package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Data
public class Activity implements Serializable {
    private Integer id; //活动ID
    private String name; //活动名字
    private Date datetime; //活动时间
    private String place; //活动地点
    private Integer belong; //活动所属社团
    private String cname; //社团名字
    private Integer amount; //参与人数
    private String detail; //活动详情
    private Double sponsorMoney; //所需赞助金额
    private Integer mid; //申请人ID
    private String managerRealName; //申请人名字
    private Integer type; //审核状态
    private Integer aid;  //审核人ID
    private String adminRealName; //审核人名字
    private Date updateTime; //更新时间
    private String dismissMessage;  //驳回信息
    private List<ActivityImg> images;

    public String getFormatDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
        return sdf.format(datetime);
    }
    public String getMonthAndDay(){
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        return sdf.format(datetime);
    }
    public String getFormatUpdateTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return sdf.format(updateTime);
    }
    public String getBrDetail(){
        String brDetail=null;
        if(detail!=null){
            brDetail = detail.replaceAll("\r\n", "<br>");
        }
        return brDetail;
    }
    public String getSimpleDetail(){
        if(detail.length()>=45){
            return detail.substring(0, 45)+"...";
        }else{
            return detail;
        }
    }
}
