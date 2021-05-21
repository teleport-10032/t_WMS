package com.example.t_wms.mapper;

import com.example.t_wms.pojo.inn;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface innMapper {
    List<inn> getInnList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    List<inn> getInnListByProductId(@Param("productId") int productId);

    int getInnNum(String key);

    inn getInnById(@Param("id") int id);
    int addInn(@Param("orderId") String orderId,@Param("productId") int productId,
               @Param("supplierId") int supplierId,@Param("productNum") int productNum,
               @Param("createdDate") String createdDate,@Param("lastModifyDate") String lastModifyDate,
               @Param("pay") double pay,@Param("staffId") int staffId,@Param("info") String info);
/*    int updateInnById(@Param("id") int id,@Param("orderId") String orderId,@Param("productId") int productId,
                      @Param("supplierId") int supplierId,@Param("productNum") int productNum,
                      @Param("lastModifyDate") String lastModifyDate,@Param("info") String info);*/
    int updateInnById(@Param("id") int id,@Param("lastModifyDate") String lastModifyDate,@Param("info") String info);
    int deleteInnById(@Param("id") int id);
}
