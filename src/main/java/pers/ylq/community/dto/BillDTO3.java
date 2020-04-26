package pers.ylq.community.dto;

import lombok.Data;
import pers.ylq.community.entity.BillProve;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class BillDTO3 implements Serializable {
    private String way;
    private String formatCost;
    private String formatMoney;
    private String formatDatetime;
    private String place;
    private String realName;
    private String formatCurrentdate;
    private String note;
    private List<BillProve> billProves;
}
