package com.example.t_wms.mapper;

import com.example.t_wms.pojo.stock;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface stockMapper {
    List<stock> getStockListByTypeAndKey(@Param("start") int start, @Param("num") int num, @Param("key") String key,@Param("typeId") int typeId);
    List<stock> getStockListByKey(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int addStock(@Param("num") int num,@Param("productId") int productId);
    int addProductNumById(@Param("num") int num,@Param("productId") int productId);
    stock getStockById(@Param("id") int id);
    int getAlertNumById(@Param("id") int id);
    int setAlertNumById(@Param("id") int id,@Param("alertNum") int alertNum);

    int getStockNum(@Param("key") String key);
    int getStockNumByType(@Param("typeId") int typeId,@Param("key") String key);
}
