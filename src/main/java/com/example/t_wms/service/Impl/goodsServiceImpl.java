package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.goodsMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.pojo.goods;
import com.example.t_wms.service.goodsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

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
        if(staffMapperObject.getStaffByToken(token) != null &&
                "admin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            int start = pre * (page - 1);
            int num = pre;

            List<goods> list = goodsMapperObject.getGoodsList(start,num,key);

            s.put("data",list);
            s.put("total",goodsMapperObject.getGoodsNum());
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
