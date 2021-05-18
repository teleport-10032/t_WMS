package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class customerCrm {
    //客户id 客户名称 负责人名称 成交订单数 回访次数 欠款
    int id;
    int customerId;
    String customerName;
    String staffName;
    double debts;
    int visitNum;
    int orderNum;
    String time;
    String info;
}
