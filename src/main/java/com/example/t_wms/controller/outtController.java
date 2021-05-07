package com.example.t_wms.controller;

import com.example.t_wms.service.outtService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class outtController {
    @Autowired
    outtService OuttServiceObject;

    @GetMapping("/getOuttList")
    public String getOuttList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token) throws JsonProcessingException {
        return OuttServiceObject.getOuttList(page,pre,key,token);
    }

    @GetMapping("getOuttById")
    public String getOuttById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return OuttServiceObject.getOuttById(id,token);
    }
    @PostMapping("addOutt")
    public String addOutt(@RequestParam("orderId") String orderId,@RequestParam("productId") int productId,
                         @RequestParam("customerId") int customerId, @RequestParam("productNum") int productNum,
                         @RequestParam("info") String info,@RequestParam("token") String token) throws JsonProcessingException {
        return OuttServiceObject.addOutt(orderId,productId,customerId,productNum,info,token);
    }
    @PutMapping("updateOuttById")
    public String updateOuttById(@RequestParam("id") int id,@RequestParam("info") String info,@RequestParam("token") String token) throws JsonProcessingException {
        return OuttServiceObject.updateOuttById(id,info,token);
    }

    @DeleteMapping("deleteOuttById")
    public String deleteOuttById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return OuttServiceObject.deleteOuttById(id,token);
    }
}
