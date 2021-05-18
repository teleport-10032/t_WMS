package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.stockMapper;
import com.example.t_wms.mapper.typeMapper;
import com.example.t_wms.pojo.stock;
import com.example.t_wms.pojo.type;
import com.example.t_wms.service.stockService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@Service
public class stockServiceImpl implements stockService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    stockMapper stockMapperObject;

    @Override
    public String getStockList(int page, int pre, String key,int typeId, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            int start = pre * (page - 1);
            int num = pre;

            List<stock> list = new LinkedList<>();
            int length = 0;
            if(typeId == -1){
                list = stockMapperObject.getStockListByKey(start,num,key);
                length = stockMapperObject.getStockNum(key);
            }
            else{

                list = stockMapperObject.getStockListByTypeAndKey(start,num,key,typeId);
                length = stockMapperObject.getStockNumByType(typeId,key);
            }
            int len = list.size();
            for(int i = 0 ; i < len ; i ++){
                if(list.get(i).getNum() < list.get(i).getAlertNum()){
                    list.get(i).setAlert(true);
                }else{
                    list.get(i).setAlert(false);
                }
            }

            s.put("data",list);
            s.put("len",length);
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addProductNumById(int num, int productId, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            if(stockMapperObject.addProductNumById(num,productId) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getAlertNumById(int id,String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
                s.put("error","0");
                s.put("data",stockMapperObject.getAlertNumById(id));
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String  setAlertNumById(int id, int alertNum,String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            if(stockMapperObject.setAlertNumById(id,alertNum) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
