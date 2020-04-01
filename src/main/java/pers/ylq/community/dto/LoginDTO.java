package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginDTO implements Serializable {
    private String username;
    private String password;
    private String verCode;
    private Integer userType;
}
