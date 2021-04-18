package com.example.t_wms.mapper;

import com.example.t_wms.pojo.type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface typeMapper {
    List<type> getTypeList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getTypeNum(@Param("key") String key);
    type getTypeById(@Param("id") int id);
    int addType(@Param("name") String name,@Param("info") String info);
    int updateTypeById(@Param("id") int id,@Param("name") String name, @Param("info") String info);
    int deleteTypeById(@Param("id") int id);
}
