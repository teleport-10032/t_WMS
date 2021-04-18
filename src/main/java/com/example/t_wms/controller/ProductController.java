package com.example.t_wms.controller;

import com.example.t_wms.service.productService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {
    

    @Autowired
    productService productServiceObject;

    @GetMapping("/getProductList")
    public String getGoodsList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.getProductList(page,pre,key,token);
    }

    @GetMapping("/getProductNum")
    public String getProductList(@RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.getProductNum(token);
    }



}
