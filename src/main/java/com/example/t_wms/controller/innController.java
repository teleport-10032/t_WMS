package com.example.t_wms.controller;

import com.example.t_wms.service.innService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class innController {
    @Autowired
    innService innServiceObject;
    @GetMapping("/getInnList")
    public String getInnList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token) throws JsonProcessingException {
        return innServiceObject.getInnList(page,pre,key,token);
    }
}
