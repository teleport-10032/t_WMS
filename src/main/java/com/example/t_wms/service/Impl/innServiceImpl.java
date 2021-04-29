package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.stockMapper;
import com.example.t_wms.pojo.inn;
import com.example.t_wms.service.innService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class innServiceImpl implements innService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    innMapper innMapperObject;
    @Autowired
    stockMapper stockMapperObject;

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

    @Override
    public String getInnById(int id,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            s.put("data",innMapperObject.getInnById(id));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addInn(String orderId, int productId, int supplierId, int productNum,String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createdDate = simpleDateFormat.format(new Date());
            if(innMapperObject.addInn(orderId,productId,supplierId,productNum,createdDate,createdDate,info) == 1
                && stockMapperObject.addProductNumById(productNum,productId) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updateInnById(int id, String orderId, int productId, int supplierId, int productNum, String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String lastModifyDate = simpleDateFormat.format(new Date());
            if(innMapperObject.updateInnById(id,orderId,productId,supplierId,productNum,lastModifyDate,info) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteInnById(int id,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            if(innMapperObject.deleteInnById(id) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

}
