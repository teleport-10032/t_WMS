package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class supplier {
    int id;
    String name;
    String companyName;
    String address;
    String telephone;
    String email;
    String site;
    String bank;
    String bankAccount;
    String bankName;
    String taxNumber;
    double debts;
    String info;
}
