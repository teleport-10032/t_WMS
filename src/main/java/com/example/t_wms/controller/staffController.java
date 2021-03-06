package com.example.t_wms.controller;

import com.example.t_wms.pojo.staff;
import com.example.t_wms.service.staffService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class staffController {

    @Autowired
    staffService staffServiceObject;

    @RequestMapping("hello")
    public String hello()
    {
        return "Hello Traveler";
    }

    @GetMapping("/getStaffList")
    public String getStaffList(@RequestParam("page") int page,@RequestParam("pre") int pre,@RequestParam("key") String key)
            throws JsonProcessingException {
        return staffServiceObject.getStaffList(page,pre,key);
    }

    @RequestMapping("addStaff")
    public String addStaff(@RequestParam("name") String name,@RequestParam("sex") String sex,
                           @RequestParam("age") int age,@RequestParam("type") String type,
                           @RequestParam("phone") String phone,@RequestParam("email") String email,
                           @RequestParam("username") String username) throws JsonProcessingException {
        return staffServiceObject.addStaff(name,sex,age,type,phone,email,username);
    }

}
