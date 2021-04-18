package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface typeService {
    String getTypeList(int page, int pre, String key, String token) throws JsonProcessingException;

    String getTypeById(int id,String token) throws JsonProcessingException;
    String addType(String name,String info,String token) throws JsonProcessingException;
    String updateTypeById(int id,String name,String info,String token) throws JsonProcessingException;
    String deleteTypeById(int id,String token) throws JsonProcessingException;
}
