package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 活动条件分页查询
 */
@Data
public class ConditionSearch implements Serializable {
    private Integer currentPage = 1;
    private Integer pageSize = 8;
    private String activityName;
    private String activityTime;
    private String activityPlace;
    private String community;
}
