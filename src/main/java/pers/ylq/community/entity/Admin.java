package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Admin implements Serializable {
    private Integer aid;
    private String aname;
    private String password;
    private String realName;
    private Integer type;
}
