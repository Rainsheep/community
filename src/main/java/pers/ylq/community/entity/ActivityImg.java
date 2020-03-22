package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class ActivityImg implements Serializable {
    private Integer id; //活动图片ID
    private Integer activityId; //活动ID
    private String url;  //宣传图片地址
}
