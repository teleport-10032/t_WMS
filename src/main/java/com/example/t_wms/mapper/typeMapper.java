package com.example.t_wms.mapper;

import com.example.t_wms.pojo.type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface typeMapper {
    //get type list
    List<type> getTypeList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    //get type num
    int getTypeNum();
}
