package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.productMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.stockMapper;
import com.example.t_wms.pojo.product;
import com.example.t_wms.service.productService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ProductServiceImpl implements productService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    productMapper productMapperObject;
    @Autowired
    stockMapper stockMapperObject;

    @Override
    public String getProductList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null ){
            int start = pre * (page - 1);
            int num = pre;

            List<product> list = productMapperObject.getProductList(start,num,key);

            s.put("data",list);
            s.put("total",productMapperObject.getProductNum(key));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getProductNum(String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null ){

            s.put("productNum",productMapperObject.getProductNum(""));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getProductById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null ){

            s.put("data",productMapperObject.getProductById(id));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addProduct(String name, int typeId, String unit, double price, String info,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            if(productMapperObject.addProduct(name,typeId,unit,price,info) == 1){
                int productId = productMapperObject.getMaxId();
//                System.out.println(productId);
                if(stockMapperObject.addStock(0,productId) == 1){
                    s.put("error","0");
                }
                else
                    s.put("error","-3");
            }
            else{
                s.put("error","-2");
            }
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updateProductById(int id, String name, int typeId, String unit, double price, String info,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){

            if(productMapperObject.updateProductById(id,name,typeId,unit,price,info) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteProductById(int id, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            if(productMapperObject.deleteProductById(id) == 1)
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
        if(staffMapperObject.getStaffByToken(token) != null){
            s.put("data",productMapperObject.getIdAndName());
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }
}
