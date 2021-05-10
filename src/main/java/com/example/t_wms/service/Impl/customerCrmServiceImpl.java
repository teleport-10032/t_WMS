package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.customerMapper;
import com.example.t_wms.pojo.customer;
import com.example.t_wms.pojo.customerCrm;
import com.example.t_wms.service.customerCrmService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@Service
public class customerCrmServiceImpl implements customerCrmService {

    @Autowired
    customerMapper customerMapperObject;

    @Override
    public String getCustomerCrmList(int page, int pre, String key, String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        int start = pre * (page - 1);
        int num = pre;
        //客户id 客户名称 负责人名称 成交订单数 回访次数 欠款
        List<customer> list = customerMapperObject.getCustomerList(start,num,key);
        List<customerCrm> reList = new LinkedList<>();
        int len = list.size();
        for(int i = 0 ; i < len ; i ++){
            customerCrm tmp = new customerCrm();
            reList.add(tmp);
            reList.get(i).setCustomerId(list.get(i).getId());
            reList.get(i).setCustomerName(list.get(i).getName());
            reList.get(i).setStaffName(list.get(i).getStaffName());
            reList.get(i).setDebts(list.get(i).getDebts());
        }
        s.put("error","0");
        s.put("data",reList);
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getCrmListByStaffId(int staffId) {
        return null;
    }
}
