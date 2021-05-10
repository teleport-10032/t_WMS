package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface productService {
    String getProductList(int page, int pre, String key, String token) throws JsonProcessingException;
    String getProductNum(String token) throws JsonProcessingException;
    
    String getProductById(int id,String token) throws JsonProcessingException;
    String addProduct(String name,int typeId,String unit,double price,String info,String token) throws JsonProcessingException;
    String updateProductById(int id,String name,int typeId,String unit,double price,String info,String token) throws JsonProcessingException;
    String deleteProductById(int id,String token) throws JsonProcessingException;
    String getIdAndName(String token) throws JsonProcessingException;
}
