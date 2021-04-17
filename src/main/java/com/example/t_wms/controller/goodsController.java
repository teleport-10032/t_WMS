package com.example.t_wms.controller;

import com.example.t_wms.service.goodsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class goodsController {
    
    @Autowired
    goodsService goodsServiceObject;

//    @GetMapping("/getGoodsList")
//    public String getGoodsList(@RequestParam("page") int page,@RequestParam("pre") int pre,
//                               @RequestParam("key") String key,@RequestParam("token") String token) throws JsonProcessingException {
//        return goodsServiceObject.getGoodsList(page,pre,key,token);
//    }

}
