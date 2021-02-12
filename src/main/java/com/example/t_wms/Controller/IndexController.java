package com.example.t_wms.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {

    @GetMapping(value = "/hello")
    public String hello(@RequestParam("id") String id) {
        return id+"HelloWorld"+id;
    }
    

}
