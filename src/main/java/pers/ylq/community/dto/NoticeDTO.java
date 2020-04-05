package pers.ylq.community.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

@Data
public class NoticeDTO implements Serializable {
    public Integer id;
    public String title;
    public String content;
    public Map<String,String> files;
}
