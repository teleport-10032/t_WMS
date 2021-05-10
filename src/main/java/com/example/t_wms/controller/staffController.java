package com.example.t_wms.controller;

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

    @PostMapping("/login")
    public String String(@RequestParam("username") String username, @RequestParam("password") String password,
                         @RequestParam("type") String type) throws JsonProcessingException {
        return staffServiceObject.login(username,password,type);
    }

    @PostMapping("/getStaffTypeByToken")
    public String getStaffTypeByToken(@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.getStaffTypeByToken(token);
    }

    @PostMapping("/getStaffNameByToken")
    public String getStaffNameByToken(@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.getStaffNameByToken(token);
    }


    @GetMapping("/getStaffNum")
    public String getStaffNum(@RequestParam("token") String token)
            throws JsonProcessingException {
        return staffServiceObject.getStaffNum(token);
    }

    @GetMapping("/getStaffList")
    public String getStaffList(@RequestParam("page") int page,@RequestParam("pre") int pre,
                               @RequestParam("key") String key,@RequestParam("token") String token)
            throws JsonProcessingException {
        return staffServiceObject.getStaffList(page,pre,key,token);
    }

    @PostMapping("/addStaff")
    public String addStaff(@RequestParam("name") String name,@RequestParam("sex") String sex,
                           @RequestParam("age") int age,@RequestParam("type") String type,
                           @RequestParam("phone") String phone,@RequestParam("email") String email,
                           @RequestParam("username") String username,@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.addStaff(name,sex,age,type,phone,email,username,token);
    }

    @GetMapping("/getStaffInfoById")
    public String getStaffInfoById(@RequestParam("id") int id,@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.getStaffInfoById(id,token);
    }

    @PutMapping("/updateStaffById")
    public String updateStaffById(@RequestParam("name") String name,@RequestParam("sex") String sex,
                                  @RequestParam("age") int age,@RequestParam("type") String type,
                                  @RequestParam("phone") String phone,@RequestParam("email") String email,
                                  @RequestParam("username") String username,@RequestParam("id") int id,
                                  @RequestParam("token") String token)
            throws JsonProcessingException {
        return staffServiceObject.updateStaffById(name,sex,age,type,phone,email,username,id,token);
    }

    @DeleteMapping("/deleteStaffById")
    public String deleteStaffById(@RequestParam("id") int id,@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.deleteStaffById(id,token);
    }

    @PutMapping("/updatePasswordById")
    public String updatePasswordById(@RequestParam("id") int id,@RequestParam("password") String password,
                                     @RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.updatePasswordById(id,password,token);
    }

    @GetMapping("/getStaffIdAndName")
    public String getTypeIdAndName(@RequestParam("token") String token) throws JsonProcessingException {
        return staffServiceObject.getIdAndNameList(token);
    }
}
