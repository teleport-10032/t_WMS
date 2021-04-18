package com.example.t_wms.controller;

import com.example.t_wms.service.productService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("getProductById")
    public String getProductById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.getProductById(id,token);
    }
    @PostMapping("addProduct")
    public String addProduct(@RequestParam("name") String name,@RequestParam("typeId") int typeId,
                             @RequestParam("supplierId") int supplierId,@RequestParam("unit") String unit,
                             @RequestParam("price") double price,@RequestParam("info") String info,
                             @RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.addProduct(name,typeId,supplierId,unit,price,info,token);
    }
    @PutMapping("updateProductById")
    public String updateProductById(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("typeId") int typeId,
                                    @RequestParam("supplierId") int supplierId,@RequestParam("unit") String unit,
                                    @RequestParam("price") double price,@RequestParam("info") String info,
                                    @RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.updateProductById(id,name,typeId,supplierId,unit,price,info,token);
    }

    @DeleteMapping("deleteProductById")
    public String deleteProductById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return productServiceObject.deleteProductById(id,token);
    }



}
