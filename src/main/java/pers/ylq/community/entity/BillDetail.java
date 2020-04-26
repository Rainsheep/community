package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class BillDetail implements Serializable {
    private Integer id;
    private Integer billId;
    private Integer supportId;
    private Double money;
}
