package pers.ylq.community.dto;

import lombok.Data;
import pers.ylq.community.entity.BillDetail;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
public class BillDTO implements Serializable {
    private Integer activityId;
    private Double cost;
    private String datetime;
    private String note;
    private String place;
    private String way;
    private List<BillDetail> billDetails;
    public Map<String,String> files;
}
