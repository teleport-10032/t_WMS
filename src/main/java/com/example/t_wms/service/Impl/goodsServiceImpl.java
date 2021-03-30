package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.goodsMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.service.goodsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class goodsServiceImpl implements goodsService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    goodsMapper goodsMapperObject;

    @Override
    public String getGoodsList(int page, int pre, String key, String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token).getType() != null &&
                !"admin".equals(staffMapperObject.getStaffByToken(token))) {

        }
        return mapper.writeValueAsString(s);
    }
}
