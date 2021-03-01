package com.example.t_wms.Controller;

import com.example.t_wms.pojo.user;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/bootflatTest")
    public String bootflatTest()
    {
        return "bootflatTest";
    }
    @RequestMapping("/eleTest")
    public String eleTest()
    {
        return "eleTest";
    }
    @RequestMapping("/eleTest2")
    public String eleTest2()
    {
        return "eleTest2";
    }
    @RequestMapping("/iViewTest")
    public String iViewTest()
    {
        return "iViewTest";
    }
    @RequestMapping("/layUITest")
    public String layUITest()
    {
        return "layUITest";
    }
    @RequestMapping("/bootstrapTest")
    public String bootstrapTest()
    {
        return "bootstrapTest";
    }
    @RequestMapping("/index")
    public String index() {
        return "index";
    }
    @RequestMapping("/index2")
    public String index2(Model model)
    {
        user userObject = new user();
        userObject.setId(1);
        userObject.setUsername("root");
        model.addAttribute("user", userObject);
        return "index2";
    }

}
