package pers.ylq.community.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultVo<T> implements Serializable {
    private Integer code;
    private Integer status;
    private String msg;
    private T data;
}
