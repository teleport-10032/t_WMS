package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;


public interface staffService {
    //get staff list
    String getStaffList(int page,int pre,String key) throws JsonProcessingException;
    //add a staff
    String addStaff(String name, String sex, int age, String type, String phone, String email, String username) throws JsonProcessingException;
}
