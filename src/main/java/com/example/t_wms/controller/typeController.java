package com.example.t_wms.controller;

import com.example.t_wms.service.typeService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class typeController {

    @Autowired
    typeService typeServiceObject;

    @GetMapping("getTypeList")
    public String getStaffList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token)
            throws JsonProcessingException {
        return typeServiceObject.getTypeList(page,pre,key,token);
    }

    @GetMapping("getTypeById")
    public String getTypeById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return typeServiceObject.getTypeById(id,token);
    }
    @PostMapping("addType")
    public String addType(@RequestParam("name") String name,@RequestParam("info") String info,
                          @RequestParam("token") String token) throws JsonProcessingException {
        return typeServiceObject.addType(name,info,token);
    }
    @PutMapping("updateTypeById")
    public String updateTypeById(@RequestParam("id") int id,@RequestParam("name") String name,
                                 @RequestParam("info") String info, @RequestParam("token") String token) throws JsonProcessingException {
        return typeServiceObject.updateTypeById(id,name,info,token);
    }

    @DeleteMapping("deleteTypeById")
    public String deleteTypeById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return typeServiceObject.deleteTypeById(id,token);
    }

}
