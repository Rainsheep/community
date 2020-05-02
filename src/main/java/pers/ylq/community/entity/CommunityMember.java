package pers.ylq.community.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class CommunityMember implements Serializable {
    private Integer id;
    private String xuehao;
    private String realName;
    private String position;
    private Integer belong;
}
