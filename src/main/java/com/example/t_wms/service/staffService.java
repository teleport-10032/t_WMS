package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;


public interface staffService {
    //get staff list
    String getStaffList(int page,int pre,String key) throws JsonProcessingException;
    //add a staff
    String addStaff(String name, String sex, int age, String type, String phone, String email, String username) throws JsonProcessingException;
    //get staff info
    String getStaffInfoById(int id) throws JsonProcessingException;
    //update staff by id
    String updateStaffById(String name, String sex, int age, String type, String phone, String email, String username,int id) throws JsonProcessingException;
    //delete staff by id
    String deleteStaffById(int id) throws JsonProcessingException;
}
