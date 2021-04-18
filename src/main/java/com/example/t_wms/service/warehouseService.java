package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface warehouseService {
    String getWarehouseList(int page, int pre, String key, String token) throws JsonProcessingException;
    String getWarehouseById(int id,String token) throws JsonProcessingException;
    String addWarehouse(String name,String position,String info,String token) throws JsonProcessingException;
    String updateWarehouseById(int id,String name,String position,String info,String token) throws JsonProcessingException;
    String deleteWarehouseById(int id,String token) throws JsonProcessingException;
}
