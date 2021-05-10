package com.example.t_wms.controller;

import com.example.t_wms.service.innService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class innController {
    @Autowired
    innService innServiceObject;
    @GetMapping("/getInnList")
    public String getInnList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.getInnList(page,pre,key,token);
    }

    @GetMapping("getInnById")
    public String getInnById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.getInnById(id,token);
    }
    @PostMapping("addInn")
    public String addInn(@RequestParam("orderId") String orderId,@RequestParam("productId") int productId,
                         @RequestParam("supplierId") int supplierId, @RequestParam("productNum") int productNum,
                         @RequestParam("info") String info,@RequestParam("pay") double pay,
                         @RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.addInn(orderId,productId,supplierId,productNum,info,pay,token);
    }
//    @PutMapping("updateInnById")
//    public String updateInnById(@RequestParam("id") int id,@RequestParam("orderId") String orderId,@RequestParam("productId") int productId,
//                                @RequestParam("supplierId") int supplierId, @RequestParam("productNum") int productNum,
//                                @RequestParam("info") String info,@RequestParam("token") String token) throws JsonProcessingException {
//        return innServiceObject.updateInnById(id,orderId,productId,supplierId,productNum,info,token);
//    }
    @PutMapping("updateInnById")
    public String updateInnById(@RequestParam("id") int id, @RequestParam("info") String info,@RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.updateInnById(id,info,token);
    }

    @DeleteMapping("deleteInnById")
    public String deleteInnById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.deleteInnById(id,token);
    }
}
