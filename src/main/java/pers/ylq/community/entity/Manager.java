package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Manager implements Serializable {
    private Integer mid;
    private String mname;
    private String password;
    private String realName;
    private Integer belong;
    private String cname;
}
