package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface staffService {

    //login,if successful then return token
    String login(String username,String password,String type) throws JsonProcessingException;

    //ver
    String getStaffTypeByToken(String token) throws JsonProcessingException;
    String getStaffNameByToken(String token) throws JsonProcessingException;

    //get staff list
    String getStaffList(int page,int pre,String key,String token) throws JsonProcessingException;
    //get staff Num
    String getStaffNum(String token) throws JsonProcessingException;
    //add a staff
    String addStaff(String name, String sex, int age, String type, String phone,
                    String email, String username,String token) throws JsonProcessingException;
    //get staff info
    String getStaffInfoById(int id,String token) throws JsonProcessingException;
    //update staff by id
    String updateStaffById(String name, String sex, int age, String type, String phone,
                           String email, String username,int id,String token) throws JsonProcessingException;
    //delete staff by id
    String deleteStaffById(int id,String token) throws JsonProcessingException;
    //update password by id
    String updatePasswordById(int id, String password,String token) throws JsonProcessingException;

    String getIdAndNameList(String token) throws JsonProcessingException;


}
