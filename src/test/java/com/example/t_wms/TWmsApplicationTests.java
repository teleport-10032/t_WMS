package com.example.t_wms;

import com.example.t_wms.mapper.innMapper;
import com.example.t_wms.mapper.outtMapper;
import com.example.t_wms.mapper.productMapper;
import com.example.t_wms.mapper.stockMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TWmsApplicationTests {

    @Autowired
    innMapper innMapperObject;
    @Autowired
    outtMapper outtMapperObject;
    @Autowired
    stockMapper stockMapperObject;

    @Test
    void contextLoads() {
        int num = outtMapperObject.getOuttById(1003).getProductNum();
        int productId = outtMapperObject.getOuttById(1003).getId();
        System.out.println(num);
        System.out.println(productId);
        System.out.println(stockMapperObject.addProductNumById(num,productId));
    }

}
