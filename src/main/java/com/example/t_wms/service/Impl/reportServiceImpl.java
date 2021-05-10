package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.pojo.inn;
import com.example.t_wms.service.reportService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class reportServiceImpl implements reportService {

    @Autowired
    innMapper innMapperObject;

    @Override
    public String getInnReportData() throws ParseException, JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        List<inn> list = innMapperObject.getInnList(0,innMapperObject.getInnNum(""),"");
        int len = list.size();
        int one = 0 , two = 0 , three = 0, four = 0;
        Calendar calendar = Calendar.getInstance();
        for(int i = 0 ; i < len ; i ++){
            String dateStr = list.get(i).getCreatedDate();
            Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
            calendar.setTime(date);
            int mouth = calendar.get(Calendar.MONTH) + 1;
//            System.out.print(date +" ");
//            System.out.println(mouth);
            if(mouth == 1 || mouth == 2 || mouth == 3){
                one += list.get(i).getProductNum();
            }
            else if(mouth == 4 || mouth == 5 || mouth == 6){
                two += list.get(i).getProductNum();
            }
            else if(mouth == 7 || mouth == 8 || mouth == 9){
                three += list.get(i).getProductNum();
            }
            else if(mouth == 10 || mouth == 11 || mouth == 12){
                four += list.get(i).getProductNum();
            }
        }
        List<Integer> reList = new LinkedList<>();
        reList.add(one);reList.add(two);reList.add(three);reList.add(four);
        s.put("data",reList);
        s.put("error","0");
        return mapper.writeValueAsString(s);
    }
}
