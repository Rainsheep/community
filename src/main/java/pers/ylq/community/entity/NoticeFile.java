package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class NoticeFile implements Serializable {
    private Integer id;
    private Integer nid;
    private String filename;
    private String url;
}
