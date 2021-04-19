package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface stockService {
    String getStockList(int page, int pre, String key, String token) throws JsonProcessingException;
    String addProductNumById(int num,int productId,String token) throws JsonProcessingException;
}
