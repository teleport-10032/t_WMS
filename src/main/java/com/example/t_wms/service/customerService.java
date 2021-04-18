package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface customerService {
    String getCustomerList(int page, int pre, String key, String token) throws JsonProcessingException;

    String getCustomerById(int id,String token) throws JsonProcessingException;
    String addCustomer(String name,String companyName, String address,String telephone,
                       String email,String site,String bank,String bankAccount,String bankName,
                       String taxNumber, double debts,String info, String token) throws JsonProcessingException;
    String updateCustomerById(int id,String name,String companyName, String address,String telephone,
                              String email,String site,String bank,String bankAccount,String bankName,
                              String taxNumber, double debts,String info, String token) throws JsonProcessingException;
    String deleteCustomerById(int id,String token) throws JsonProcessingException;
}
