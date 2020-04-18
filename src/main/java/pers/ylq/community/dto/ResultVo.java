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
    private Integer count;
    private T data;

    public ResultVo(Integer code, Integer status, String msg, T data) {
        this.code = code;
        this.status = status;
        this.msg = msg;
        this.data = data;
    }
}
