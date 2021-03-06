package com.example.t_wms;

import com.example.t_wms.mapper.staffMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

@SpringBootTest
class TWmsApplicationTests {

    @Autowired
    private staffMapper staffMapperObject;
    @Test
    void contextLoads() {
        System.out.println(DigestUtils.md5DigestAsHex("1234".getBytes()));
    }

}
