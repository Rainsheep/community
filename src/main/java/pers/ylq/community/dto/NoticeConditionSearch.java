package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 公告的分页查询
 */
@Data
public class NoticeConditionSearch implements Serializable {
    private Integer currentPage=1;
    private Integer pageSize=8;
    // 查询关键字
    private String keyword;
}
