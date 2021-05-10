package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;


public interface customerCrmService {
    String getCustomerCrmList(int page, int pre, String key, String token) throws JsonProcessingException;
    String getCrmListByStaffId(int staffId);
}
