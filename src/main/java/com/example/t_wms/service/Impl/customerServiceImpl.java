package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.customerMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.pojo.customer;
import com.example.t_wms.service.customerService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class customerServiceImpl implements customerService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    customerMapper customerMapperObject;

    @Override
    public String getCustomerList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {
            int start = pre * (page - 1);
            int num = pre;

            List<customer> list = customerMapperObject.getCustomerList(start,num,key);

            s.put("data",list);
            s.put("total",customerMapperObject.getCustomerNum(key));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getCustomerById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {

            s.put("data",customerMapperObject.getCustomerById(id));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addCustomer(String name, String companyName, String address, String telephone, String email, String site, String bank, String bankAccount, String bankName, String taxNumber, double debts, String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {
            if(customerMapperObject.addCustomer(name,companyName,address,telephone, email,site,
                    bank,bankAccount,bankName,taxNumber,0,info) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updateCustomerById(int id, String name, String companyName, String address, String telephone, String email, String site, String bank, String bankAccount, String bankName, String taxNumber, double debts, String info, int staffId, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {
            if(customerMapperObject.updateCustomerById(id,name,companyName,address,telephone, email,site,
                    bank,bankAccount,bankName,taxNumber,staffId,info) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteCustomerById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {

            if(customerMapperObject.deleteCustomerById(id) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getIdAndName(String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null) {

            s.put("data",customerMapperObject.getIdAndName());
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
