package com.example.t_wms.controller;

import com.example.t_wms.service.staffService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class staffController {

    @Autowired
    staffService staffServiceObject;

    @RequestMapping("hello")
    public String hello()
    {
        return "Hello Traveler";
    }

    @GetMapping("getStaffList")
    public String getStaffList(@RequestParam("page") int page,@RequestParam("pre") int pre,@RequestParam("key") String key)
            throws JsonProcessingException {
        return staffServiceObject.getStaffList(page,pre,key);
    }


}
