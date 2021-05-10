package com.example.t_wms.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class stock {
    int id;
    int num;
    String productName;
    int productId;
    String typeName;
    int alertNum;
    boolean isAlert;
}
