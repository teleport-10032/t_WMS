package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.outtMapper;
import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.mapper.stockMapper;
import com.example.t_wms.pojo.outt;
import com.example.t_wms.service.outtService;
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
public class outtServiceImpl implements outtService {

    @Autowired
    staffMapper staffMapperObject;
    @Autowired
    outtMapper outtMapperObject;
    @Autowired
    stockMapper stockMapperObject;

    @Override
    public String getOuttList(int page, int pre, String key, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            int start = pre * (page - 1);
            int num = pre;

            List<outt> list = outtMapperObject.getOuttList(start,num,key);

            s.put("data",list);
            s.put("total",outtMapperObject.getOuttNum(key));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getOuttById(int id,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            s.put("data",outtMapperObject.getOuttById(id));
            s.put("error","0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addOutt(String orderId, int productId, int supplierId, int productNum,String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();

        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createdDate = simpleDateFormat.format(new Date());
            if(outtMapperObject.addOutt(orderId,productId,supplierId,productNum,createdDate,createdDate,info) == 1
                    && stockMapperObject.addProductNumById(productNum*(-1),productId) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updateOuttById(int id, String orderId, int productId, int supplierId, int productNum, String info, String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {
            DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String lastModifyDate = simpleDateFormat.format(new Date());
            if(outtMapperObject.updateOuttById(id,orderId,productId,supplierId,productNum,lastModifyDate,info) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteOuttById(int id,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null &&
                "superAdmin".equals(staffMapperObject.getStaffByToken(token).getType())) {

            if(outtMapperObject.deleteOuttById(id) == 1)
                s.put("error","0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

}
