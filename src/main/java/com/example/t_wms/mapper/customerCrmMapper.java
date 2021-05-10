package com.example.t_wms.mapper;

import com.example.t_wms.pojo.customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface customerCrmMapper {
    //id 客户id staffId time info
    //getCrmList by staffId
    List<customer> getCrmListByStaffId(@Param("staffId") int staffId);
}
