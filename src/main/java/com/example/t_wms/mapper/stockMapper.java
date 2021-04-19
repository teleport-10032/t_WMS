package com.example.t_wms.mapper;

import com.example.t_wms.pojo.stock;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface stockMapper {
    List<stock> getStockList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getStockNum(@Param("key") String key);
}
