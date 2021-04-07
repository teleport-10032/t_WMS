package com.example.t_wms.controller;

import com.example.t_wms.service.staffService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class roleController {

    @Autowired
    staffService staffServiceObject;

    @PostMapping("/login")
    public String String(@RequestParam("username") String username, @RequestParam("password") String password,
                         @RequestParam("type") String type) throws JsonProcessingException {
//        System.out.println(username + "\n" + password + "\n" + type);
        return staffServiceObject.login(username,password,type);
    }

    @PostMapping("/getStaffTypeByToken")
    public String getStaffTypeByToken(@RequestParam("token") String token) {
        return staffServiceObject.getStaffTypeByToken(token);
    }

    @PostMapping("/getStaffNameByToken")
    public String getStaffNameByToken(@RequestParam("token") String token) {
        return staffServiceObject.getStaffNameByToken(token);
    }

}
