package com.example.t_wms;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.mapper.outtMapper;
import com.example.t_wms.mapper.productMapper;
import com.example.t_wms.mapper.stockMapper;
import com.example.t_wms.pojo.inn;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@SpringBootTest
class TWmsApplicationTests {

    @Autowired
    innMapper innMapperObject;

    @Test
    void contextLoads() throws ParseException {
//        List<inn> list = innMapperObject.getInnList(0,innMapperObject.getInnNum(""),"");
//        int len = list.size();
//        int one = 0 , two = 0 , three = 0, four = 0;
//        Calendar calendar = Calendar.getInstance();
//        for(int i = 0 ; i < len ; i ++){
//            String dateStr = list.get(i).getCreatedDate();
//            Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
//            calendar.setTime(date);
//            int mouth = calendar.get(Calendar.MONTH) + 1;
////            System.out.print(date +" ");
////            System.out.println(mouth);
//            if(mouth == 1 || mouth == 2 || mouth == 3){
//                one += list.get(i).getProductNum();
//            }
//            else if(mouth == 4 || mouth == 5 || mouth == 6){
//                two += list.get(i).getProductNum();
//            }
//            else if(mouth == 7 || mouth == 8 || mouth == 9){
//                three += list.get(i).getProductNum();
//            }
//            else if(mouth == 10 || mouth == 11 || mouth == 12){
//                four += list.get(i).getProductNum();
//            }
//        }
    }

}
