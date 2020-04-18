package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class SponsorConditionSearch implements Serializable {
    private Integer currentPage = 1;
    private Integer pageSize = 8;
    private Integer page;
    private Integer limit;
    // 查询关键字
    private String keyword;
}
