package com.example.t_wms.mapper;

import com.example.t_wms.pojo.staff;
import com.example.t_wms.pojo.warehouse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface warehouseMapper {
    List<warehouse> getWarehouseList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getWarehouseNum(@Param("key") String key);
    warehouse getWarehouseById(@Param("id") int id);
    int addWarehouse(@Param("name") String name,@Param("position") String position, @Param("info") String info);
    int updateWarehouseById(@Param("id") int id,@Param("name") String name,
                            @Param("position") String position, @Param("info") String info);
    int deleteWarehouseById(@Param("id") int id);
}
