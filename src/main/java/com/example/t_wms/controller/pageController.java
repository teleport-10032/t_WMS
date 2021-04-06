package com.example.t_wms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageController {
    @RequestMapping("/bootflatTest")
    public String bootflatTest()
    {
        return "test/bootflatTest";
    }
    @RequestMapping("/eleTest")
    public String eleTest()
    {
        return "test/eleTest";
    }
    @RequestMapping("/eleTest2")
    public String eleTest2()
    {
        return "test/eleTest2";
    }
    @RequestMapping("/iViewTest")
    public String iViewTest()
    {
        return "test/iViewTest";
    }
    @RequestMapping("/layUITest")
    public String layUITest()
    {
        return "test/layUITest";
    }
    @RequestMapping("/bootstrapTest")
    public String bootstrapTest()
    {
        return "test/bootstrapTest";
    }
    @RequestMapping("/index2")
    public String index2(Model model)
    {
//        user userObject = new user();
//        userObject.setId(1);
//        userObject.setUsername("root");
//        model.addAttribute("user", userObject);
        return "index2";
    }


    @RequestMapping("/")
    public String index() {
        return "login";
    }
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
    @RequestMapping("staffAdmin")
    public String staffAdmin(){
        return "staffAdmin";
    }
    @RequestMapping("typeAdmin")
    public String typeAdmin(){
        return "typeAdmin";
    }
    @RequestMapping("goodsAdmin")
    public String goodsAdmin(){
        return "goodsAdmin";
    }
    @RequestMapping("inAdmin")
    public String inAdmin(){
        return "inAdmin";
    }
    @RequestMapping("outAdmin")
    public String outAdmin(){
        return "outAdmin";
    }
    @RequestMapping("inventoryAdmin")
    public String inventoryAdmin() {
        return "inventoryAdmin";
    }
    @RequestMapping("crmAdmin")
    public String crmAdmin() {
        return "crmAdmin";
    }
}
