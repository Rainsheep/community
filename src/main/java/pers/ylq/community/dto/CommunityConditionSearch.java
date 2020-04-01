package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 社团分页条件查询
 */
@Data
public class CommunityConditionSearch implements Serializable {
    private Integer currentPage = 1;
    private Integer pageSize = 8;
    private String keyword; //关键字
}
