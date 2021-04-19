package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface outtService {
    String getOuttList(int page, int pre, String key, String token) throws JsonProcessingException;

    String getOuttById(int id,String token) throws JsonProcessingException;
    String addOutt(String orderId,int productId,int customerId,int productNum,String info,String token) throws JsonProcessingException;
    String updateOuttById(int id,String orderId,int productId,int customerId,int productNum,String info,String token) throws JsonProcessingException;
    String deleteOuttById(int id,String token) throws JsonProcessingException;
}
