package com.example.t_wms;

import com.example.t_wms.mapper.productMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TWmsApplicationTests {

    @Autowired
    productMapper productMapperObject;

    @Test
    void contextLoads() {
        System.out.println(productMapperObject.getGoodsNum());
    }

}
