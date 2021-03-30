package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class staff {
    int id;
    String username;
    String password;
    String name;
    String sex;
    int age;
    String type;
    String phone;
    String email;
    String token;
}
