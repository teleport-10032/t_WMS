package com.example.t_wms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

    @RequestMapping("/index")
    public String index()
    {
        return "index";
    }
    @RequestMapping("/index2")
    public String index2()
    {
        return "index2";
    }

}
