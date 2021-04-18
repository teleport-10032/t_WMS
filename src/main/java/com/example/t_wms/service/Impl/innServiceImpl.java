package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.pojo.inn;
import com.example.t_wms.service.innService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class innServiceImpl implements innService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    innMapper innMapperObject;

    @Override
    public String getInnList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            int start = pre * (page - 1);
            int num = pre;

            List<inn> list = innMapperObject.getInnList(start,num,key);

            s.put("data",list);
            s.put("total",innMapperObject.getInnNum(key));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
