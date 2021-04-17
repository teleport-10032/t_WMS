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
    @RequestMapping("/systemInfo")
    public String systemInfo()
    {
        return "superAdmin/systemInfo";
    }
    @RequestMapping("/basicInfoAdmin")
    public String basicInfoAdmin()
    {
        return "superAdmin/basicInfoAdmin";
    }
}
