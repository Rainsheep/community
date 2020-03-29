package pers.ylq.community.dto;

import lombok.Data;

/**
 * 社团分页条件查询
 */
@Data
public class CommunityConditionSearch {
    private Integer currentPage = 1;
    private Integer pageSize = 8;
    private String keyword; //关键字
}
