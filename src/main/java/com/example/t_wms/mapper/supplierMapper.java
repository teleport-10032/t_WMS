package com.example.t_wms.mapper;

import com.example.t_wms.pojo.supplier;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface supplierMapper {
    List<supplier> getSupplierList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getSupplierNum(@Param("key") String key);
    supplier getSupplierById(@Param("id") int id);
    int addSupplier(@Param("name") String name,@Param("companyName") String companyName,
                    @Param("address") String address,@Param("telephone") String telephone,
                    @Param("email") String email,@Param("site") String site,
                    @Param("bank") String bank,@Param("bankAccount") String bankAccount,
                    @Param("bankName") String bankName,@Param("taxNumber") String taxNumber,
                    @Param("debts") double debts,@Param("info") String info);
    int updateSupplierById(@Param("id") int id,@Param("name") String name,
                           @Param("companyName") String companyName, @Param("address") String address,
                           @Param("telephone") String telephone, @Param("email") String email,
                           @Param("site") String site, @Param("bank") String bank,
                           @Param("bankAccount") String bankAccount,@Param("bankName") String bankName,
                           @Param("taxNumber") String taxNumber, @Param("info") String info,@Param("staffId") int staffId);
    int deleteSupplierById(@Param("id") int id);
    List<supplier> getIdAndName();
    int addDebtsById(@Param("id") int id,@Param("debts") double debts);
}
