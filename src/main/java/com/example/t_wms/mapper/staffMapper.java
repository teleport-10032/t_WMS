package com.example.t_wms.mapper;

import com.example.t_wms.pojo.staff;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface staffMapper {
    //staff list
    List<staff> getStaffList(@Param("start") int start,@Param("num") int num,@Param("key") String key);
    //the sum of staff
    int getStaffNum();
}
