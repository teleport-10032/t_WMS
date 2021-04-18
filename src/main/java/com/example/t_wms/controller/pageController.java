package com.example.t_wms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageController {
    @RequestMapping("/")
    public String index() {
        return "login";
    }
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
    @RequestMapping("/superAdmin/systemInfo")
    public String systemInfo()
    {
        return "superAdmin/systemInfo";
    }
    @RequestMapping("/superAdmin/basicInfoAdmin")
    public String basicInfoAdmin()
    {
        return "superAdmin/basicInfoAdmin";
    }
    @RequestMapping("/superAdmin/staffAdmin")
    public String staffAdmin()
    {
        return "superAdmin/staffAdmin";
    }
    @RequestMapping("/superAdmin/warehouseAdmin")
    public String warehouseAdmin()
    {
        return "superAdmin/warehouseAdmin";
    }
}
