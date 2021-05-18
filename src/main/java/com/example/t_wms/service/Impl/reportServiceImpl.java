package com.example.t_wms.service.Impl;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.mapper.outtMapper;
import com.example.t_wms.pojo.inn;
import com.example.t_wms.pojo.outt;
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
    @Autowired
    outtMapper outtMapperObject;

    @Override
    public String getInnReportData(int year) throws ParseException, JsonProcessingException {
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
            if(calendar.get(Calendar.YEAR) != year && -1 != year)
                continue;
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

    @Override
    public String getOuttReportData(int year) throws ParseException, JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        List<outt> list = outtMapperObject.getOuttList(0,outtMapperObject.getOuttNum(""),"");
        int len = list.size();
        int one = 0 , two = 0 , three = 0, four = 0;
        Calendar calendar = Calendar.getInstance();
        for(int i = 0 ; i < len ; i ++){
            String dateStr = list.get(i).getCreatedDate();
            Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
            calendar.setTime(date);
            if(calendar.get(Calendar.YEAR) != year && -1 != year)
                continue;
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

    @Override
    public String getYearList() throws ParseException, JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HashMap s = new HashMap();
        List<inn> innList = innMapperObject.getInnList(0,innMapperObject.getInnNum(""),"");
        List<outt> outtList = outtMapperObject.getOuttList(0,outtMapperObject.getOuttNum(""),"");
        HashSet<Integer> yearList = new HashSet<>();
        Calendar calendar = Calendar.getInstance();
        int innLen = innList.size();
        for(int i = 0 ; i < innLen ; i ++) {
            String dateStr = innList.get(i).getCreatedDate();
            Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
            calendar.setTime(date);
            yearList.add(calendar.get(Calendar.YEAR));
        }
        int outtLen = outtList.size();
        for(int i = 0 ; i < outtLen; i ++){
            String dateStr = outtList.get(i).getCreatedDate();
            Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
            calendar.setTime(date);
            yearList.add(calendar.get(Calendar.YEAR));
        }
        s.put("data",yearList);
        s.put("error","0");
        return mapper.writeValueAsString(s);
    }
}
