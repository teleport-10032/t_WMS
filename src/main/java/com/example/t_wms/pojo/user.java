package com.example.t_wms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class user {
    int id;
    String username;
    String passwd;
    String avatar;
    String type;
    String email;
    boolean available;
    String token;
    String github;
    String sign;
    String site;
    String attemptList;
    String solvedList;
    int solvedNum;
}
