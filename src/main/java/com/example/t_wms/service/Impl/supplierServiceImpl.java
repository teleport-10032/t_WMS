package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.supplierMapper;
import com.example.t_wms.pojo.supplier;
import com.example.t_wms.pojo.type;
import com.example.t_wms.service.supplierService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class supplierServiceImpl implements supplierService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    supplierMapper supplierMapperObject;

    @Override
    public String getSupplierList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            int start = pre * (page - 1);
            int num = pre;

            List<supplier> list = supplierMapperObject.getSupplierList(start,num,key);

            s.put("data",list);
            s.put("total",supplierMapperObject.getSupplierNum(key));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getSupplierById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            s.put("data",supplierMapperObject.getSupplierById(id));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addSupplier(String name, String companyName, String address, String telephone, String email, String site, String bank, String bankAccount, String bankName, String taxNumber, double debts, String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            if(supplierMapperObject.addSupplier(name,companyName,address,telephone, email,site,
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
    public String updateSupplierById(int id, String name, String companyName, String address, String telephone, String email, String site, String bank, String bankAccount, String bankName, String taxNumber, double debts, String info,  int staffId,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            if(supplierMapperObject.updateSupplierById(id,name,companyName,address,telephone, email,site,
                    bank,bankAccount,bankName,taxNumber,info,staffId) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteSupplierById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            if(supplierMapperObject.deleteSupplierById(id) == 1)
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
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            s.put("data",supplierMapperObject.getIdAndName());
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
