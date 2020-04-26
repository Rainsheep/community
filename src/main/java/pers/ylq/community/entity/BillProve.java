package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class BillProve implements Serializable {
    private Integer id;
    private Integer billId;
    private String filename;
    private String url;
}
