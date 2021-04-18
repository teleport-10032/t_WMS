package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface productService {
    String getProductList(int page, int pre, String key, String token) throws JsonProcessingException;
    String getProductNum(String token) throws JsonProcessingException;
}
