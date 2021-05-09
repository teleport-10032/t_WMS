package com.example.t_wms.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface customerCrmMapper {
    //客户id 客户名称 负责人名称 成交订单数 成交总额 欠款 回访次数 近30天回访次数

}
