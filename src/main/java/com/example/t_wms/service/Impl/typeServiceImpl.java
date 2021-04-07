package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.typeMapper;
import com.example.t_wms.pojo.type;
import com.example.t_wms.service.typeService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class typeServiceImpl implements typeService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    typeMapper typeMapperObject;

    @Override
    public String getTypeList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "admin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            int start = pre * (page - 1);
            int num = pre;

            List<type> list = typeMapperObject.getTypeList(start,num,key);

            s.put("data",list);
            s.put("total",typeMapperObject.getTypeNum());
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
