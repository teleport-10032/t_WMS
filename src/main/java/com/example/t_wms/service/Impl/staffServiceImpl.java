package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.staffMapper;
import com.example.t_wms.pojo.staff;
import com.example.t_wms.pojo.type;
import com.example.t_wms.service.staffService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.HashMap;
import java.util.List;

@Service
public class staffServiceImpl implements staffService {

    @Autowired
    private staffMapper staffMapperObject;

    @Override
    public String login(String username, String password, String type) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        //error : 0 means success, -1 means error username or password
        if(staffMapperObject.loginCheck(username,password,type) == 1)
        {
            s.put("error","0");
            byte[] lock = new byte[0];
            long w = 100000000;
            long r = 0;
            synchronized (lock) {
                r = (long) ((Math.random() + 1) * w);
            }
            String token = System.currentTimeMillis() + String.valueOf(r).substring(1);
            staffMapperObject.createTokenByUsername(username,token);
            s.put("token",token);
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getStaffTypeByToken(String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null)
        {
            s.put("type", staffMapperObject.getStaffByToken(token).getType());
            s.put("error", "0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getStaffNameByToken(String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null)
        {
            s.put("username", staffMapperObject.getStaffByToken(token).getName());
            s.put("error", "0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getStaffList(int page,int pre,String key,String token) throws JsonProcessingException {
        //error: -1 means Ultra vires
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null)
        {
            int start = pre * (page - 1);
            int num = pre;
            List<staff> list = staffMapperObject.getStaffList(start,num,key);
            int total = staffMapperObject.getStaffNum(key);
            s.put("data", list);
            s.put("total", total);
            s.put("error", "0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getStaffNum(String token) throws JsonProcessingException {
        //error: -1 means Ultra vires
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            int num = staffMapperObject.getStaffNum("");
            s.put("staffNum", num);
            s.put("error", "0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String addStaff(String name, String sex, int age, String type, String phone,
                           String email, String username,String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            if(staffMapperObject.getNumByUsername(username) != 0){
                s.put("error","-3");
            }
            else{
                int re = staffMapperObject.addStaff(name,sex,age,type,phone,email,username, DigestUtils.md5DigestAsHex("123123".getBytes()));
                if(re == 1)
                    s.put("error", "0");
                else
                    s.put("error","-2");
            }
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getStaffInfoById(int id,String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            staff staffObject = staffMapperObject.getStaffInfoById(id);
            s.put("data", staffObject);
            s.put("error", "0");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updateStaffById(String name, String sex, int age, String type, String phone,
                                  String email, String username, int id,String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null ){
            int re = staffMapperObject.updateStaffById(name,sex,age,type,phone,email,username, id);
            if(re == 1)
                s.put("error", "0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String deleteStaffById(int id,String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null ){
            int re = staffMapperObject.deleteStaffById(id);
            if(re == 1)
                s.put("error", "0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String updatePasswordById(int id, String password,String token) throws JsonProcessingException {

        //error: -1 means Ultra vires,-2 means system error
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            int re = staffMapperObject.updatePasswordById(id,password);
            if(re == 1)
                s.put("error", "0");
            else
                s.put("error","-2");
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

    @Override
    public String getIdAndNameList(String token) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        if(staffMapperObject.getStaffByToken(token) != null){
            List<staff> list = staffMapperObject.getIdAndNameList();
            s.put("error","0");
            s.put("data",list);
        }
        else
            s.put("error","-1");
        return mapper.writeValueAsString(s);
    }

}
