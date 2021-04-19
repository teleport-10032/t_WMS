package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class outt {
    int id;
    String orderId;
    int productId;
    String productName;
    int customerId;
    String customerName;
    int productNum;
    String createdDate;
    String lastModifyDate;
    String info;
}
