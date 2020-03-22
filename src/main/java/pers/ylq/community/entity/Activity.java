package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Activity implements Serializable {
    private Integer id; //活动ID
    private String name; //活动名字
    private Date datetime; //活动时间
    private String place; //活动地点
    private Integer belong; //活动所属社团
    private Integer amount; //参与人数
    private String detail; //活动详情
    private Double sponsorMoney; //所需赞助金额
    private Integer mid; //申请人ID
    private Integer type; //审核状态
    private Integer aid;  //审核人ID
    private String dismissMessage;  //驳回信息
    private List<ActivityImg> images;
}
