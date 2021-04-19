package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface innService {
    String getInnList(int page, int pre, String key, String token) throws JsonProcessingException;

    String getInnById(int id,String token) throws JsonProcessingException;
    String addInn(String orderId,int productId,int supplierId,int productNum,String info,String token) throws JsonProcessingException;
    String updateInnById(int id,String orderId,int productId,int supplierId,int productNum,String info,String token) throws JsonProcessingException;
    String deleteInnById(int id,String token) throws JsonProcessingException;
}
