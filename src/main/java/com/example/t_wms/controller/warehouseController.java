package com.example.t_wms.controller;

import com.example.t_wms.service.warehouseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class warehouseController {
    @Autowired
    warehouseService warehouseServiceObject;

    @GetMapping("getWarehouseList")
    public String getWarehouseList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token)
            throws JsonProcessingException {
        return warehouseServiceObject.getWarehouseList(page,pre,key,token);
    }
    @GetMapping("getWarehouseById")
    public String getWarehouseById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return warehouseServiceObject.getWarehouseById(id,token);
    }
    @PostMapping("addWarehouse")
    public String addWarehouse(@RequestParam("name") String name,@RequestParam("position") String position,
                               @RequestParam("info") String info,@RequestParam("token") String token) throws JsonProcessingException {
        return warehouseServiceObject.addWarehouse(name,position,info,token);
    }
    @PutMapping("updateWarehouseById")
    public String updateWarehouseById(@RequestParam("id") int id,@RequestParam("name") String name,
                                      @RequestParam("position") String position, @RequestParam("info") String info,
                                      @RequestParam("token") String token) throws JsonProcessingException {
        return warehouseServiceObject.updateWarehouseById(id,name,position,info,token);
    }

    @DeleteMapping("deleteWarehouseById")
    public String deleteWarehouseById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return warehouseServiceObject.deleteWarehouseById(id,token);
    }

}
