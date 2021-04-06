package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class goods{
    int id;
    String goodsName;
    int typeId;
    String typeName;
    String unit;
    String info;
    double price;
}
