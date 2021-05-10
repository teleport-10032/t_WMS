package com.example.t_wms.controller;

import com.example.t_wms.service.stockService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class stockController {

    @Autowired
    stockService stockServiceObject;

    @GetMapping("getStockList")
    public String getStaffList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key,@RequestParam("typeId") int typeId,
                               @RequestParam("token") String token)
            throws JsonProcessingException {
        return stockServiceObject.getStockList(page,pre,key,typeId,token);
    }

    @GetMapping("addProductNumById")
    public String addProductNumById(@RequestParam("num") int num,@RequestParam("productId") int productId,
                                    @RequestParam("token") String token) throws JsonProcessingException {
        return stockServiceObject.addProductNumById(num,productId,token);
    }

    @GetMapping("getAlertNumById")
    public String getAlertNumById(@RequestParam("id") int id,
                                    @RequestParam("token") String token) throws JsonProcessingException {
        return stockServiceObject.getAlertNumById(id,token);
    }

    @PutMapping("setAlertNumById")
    public String setAlertNumById(@RequestParam("id") int id,@RequestParam("alertNum") int alertNum,@RequestParam("token") String token) throws JsonProcessingException {
        return stockServiceObject.setAlertNumById(id,alertNum,token);
    }


}
