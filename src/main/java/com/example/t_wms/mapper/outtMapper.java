package com.example.t_wms.mapper;

import com.example.t_wms.pojo.outt;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface outtMapper {
    List<outt> getOuttList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getOuttNum(String key);
    outt getOuttById(@Param("id") int id);
    int addOutt(@Param("orderId") String orderId,@Param("productId") int productId,
               @Param("customerId") int customerId,@Param("productNum") int productNum,
                @Param("createdDate") String createdDate,@Param("lastModifyDate") String lastModifyDate,
                @Param("info") String info);
    int updateOuttById(@Param("id") int id,@Param("orderId") String orderId,@Param("productId") int productId,
                      @Param("customerId") int customerId,@Param("productNum") int productNum,
                      @Param("lastModifyDate") String lastModifyDate,@Param("info") String info);
    int deleteOuttById(@Param("id") int id);
}
