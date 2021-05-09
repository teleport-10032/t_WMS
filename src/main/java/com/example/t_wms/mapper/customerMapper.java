package com.example.t_wms.mapper;

import com.example.t_wms.pojo.customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface customerMapper {
    List<customer> getCustomerList(@Param("start") int start, @Param("num") int num, @Param("key") String key);
    int getCustomerNum(@Param("key") String key);
    customer getCustomerById(@Param("id") int id);
    int addCustomer(@Param("name") String name,@Param("companyName") String companyName,
                    @Param("address") String address,@Param("telephone") String telephone,
                    @Param("email") String email,@Param("site") String site,
                    @Param("bank") String bank,@Param("bankAccount") String bankAccount,
                    @Param("bankName") String bankName,@Param("taxNumber") String taxNumber,
                    @Param("debts") double debts,@Param("info") String info);
    int updateCustomerById(@Param("id") int id,@Param("name") String name,
                           @Param("companyName") String companyName, @Param("address") String address,
                           @Param("telephone") String telephone, @Param("email") String email,
                           @Param("site") String site, @Param("bank") String bank,
                           @Param("bankAccount") String bankAccount,@Param("bankName") String bankName,
                           @Param("taxNumber") String taxNumber, @Param("debts") double debts,@Param("staffId") int staffId,
                           @Param("info") String info);
    int deleteCustomerById(@Param("id") int id);
    List<customer> getIdAndName();
}
