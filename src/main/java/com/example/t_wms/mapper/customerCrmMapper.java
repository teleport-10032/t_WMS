package com.example.t_wms.mapper;

import com.example.t_wms.pojo.customer;
import com.example.t_wms.pojo.customerCrm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface customerCrmMapper {

    List<customer> getCrmListByStaffId(@Param("staffId") int staffId);

    int getVisitNumByCustomerId(@Param("customerId") int customerId);

    List<customerCrm> getVisitListByCustomerId(@Param("customerId") int customerId);

    int deleteVisitById(@Param("id") int id);

    int addVisit(@Param("customerId") int customerId, @Param("date")  String date, @Param("info") String info);

}
