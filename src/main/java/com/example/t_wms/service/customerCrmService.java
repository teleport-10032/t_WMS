package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.Date;


public interface customerCrmService {
    String getCustomerCrmList(int page, int pre, String key, String token) throws JsonProcessingException;
    String getVisitListByCustomerId(int customerId,String token) throws JsonProcessingException;
    String deleteVisitById(int id,String token) throws JsonProcessingException;
    String addVisit(int customerId, String date, String info, String token) throws JsonProcessingException;
}
