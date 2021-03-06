package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.pojo.staff;
import com.example.t_wms.service.staffService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class staffServiceImpl implements staffService {

    @Autowired
    private staffMapper staffMapperObject;

    @Override
    public String getStaffList(int page,int pre,String key) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        int start = pre * (page - 1);
        int num = pre;
        List<staff> list = staffMapperObject.getStaffList(start,num,key);
        int total = staffMapperObject.getStaffNum();
        HashMap s = new HashMap();
        s.put("data", list);
        s.put("total", total);
        s.put("error", "0");
        return mapper.writeValueAsString(s);
    }
}
