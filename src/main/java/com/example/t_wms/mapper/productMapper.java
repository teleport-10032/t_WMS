package com.example.t_wms.mapper;

import com.example.t_wms.pojo.product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface productMapper {
    List<product> getProductList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getProductNum(String key);
    product getProductById(@Param("id") int id);
    int addProduct(@Param("name") String name,@Param("typeId") int typeId,
                   @Param("unit") String unit,@Param("price") double price,@Param("info") String info);
    int updateProductById(@Param("id") int id,@Param("name") String name,@Param("typeId") int typeId,
                          @Param("unit") String unit,
                          @Param("price") double price,@Param("info") String info);
    int deleteProductById(@Param("id") int id);
    List<product> getIdAndName();
    int getMaxId();
}

