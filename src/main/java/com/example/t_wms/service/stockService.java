package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface stockService {
    String getStockList(int page, int pre, String key,int typeId, String token) throws JsonProcessingException;
    String addProductNumById(int num,int productId,String token) throws JsonProcessingException;

    String getAlertNumById(int id,String token) throws JsonProcessingException;
    String setAlertNumById(int id,int alertNum,String token) throws JsonProcessingException;
}
