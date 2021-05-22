package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data //通过Lombok插件自动生成get/set方法
@NoArgsConstructor //通过Lombok插件自动生成无参构造方法
@AllArgsConstructor //通过Lombok插件自动生成有参构造方法
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
