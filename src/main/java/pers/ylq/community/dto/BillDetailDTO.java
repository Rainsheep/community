package pers.ylq.community.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class BillDetailDTO implements Serializable {
    private String sponsorName;
    private String belong;
    private Double money;
}
