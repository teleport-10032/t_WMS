package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class inn {
    int id;
    String orderId;
    int productId;
    String productName;
    int productNum;
}