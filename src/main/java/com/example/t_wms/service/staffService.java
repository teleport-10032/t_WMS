package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;


public interface staffService {
    //staff list
    String getStaffList(int page,int pre,String key) throws JsonProcessingException;
}
