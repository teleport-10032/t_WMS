package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.ibatis.annotations.Param;

public interface supplierService {
    String getSupplierList(int page, int pre, String key, String token) throws JsonProcessingException;

    String getSupplierById(int id,String token) throws JsonProcessingException;
    String addSupplier(String name,String companyName, String address,String telephone,
                       String email,String site,String bank,String bankAccount,String bankName,
                       String taxNumber, double debts,String info, String token) throws JsonProcessingException;
    String updateSupplierById(int id,String name,String companyName, String address,String telephone,
                              String email,String site,String bank,String bankAccount,String bankName,
                              String taxNumber, double debts,String info, int staffId, String token) throws JsonProcessingException;
    String deleteSupplierById(int id,String token) throws JsonProcessingException;
    String getIdAndName(String token) throws JsonProcessingException;
}
