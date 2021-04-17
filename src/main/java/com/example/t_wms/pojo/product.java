package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class product {
    int id;
    String productName;
    int typeId;
    String typeName;
    String unit;
    String info;
    double price;
}
