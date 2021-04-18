package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class product {
    int id;
    String name;
    int typeId;
    int supplierId;
    String typeName;
    String supplierName;
    String unit;
    double price;
    String info;
}
