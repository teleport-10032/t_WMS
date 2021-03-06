package com.example.t_wms.mapper;

import com.example.t_wms.pojo.staff;
import com.example.t_wms.pojo.type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface staffMapper {

    //login
    //check a user is exist by username,password,type
    int loginCheck(@Param("username") String username,
                   @Param("password") String password,@Param("type") String type);
    //write token to db by username and token
    int createTokenByUsername(@Param("username") String username,
                              @Param("token") String token);

    //ver
    //get staff by token
    staff getStaffByToken(@Param("token") String token);

    //admin
    //staff list
    List<staff> getStaffList(@Param("start") int start,@Param("num") int num,@Param("key") String key);
    //the sum of staff
    int getStaffNum(@Param("key") String key);
    //add a staff
    int addStaff(@Param("name") String name,@Param("sex") String sex,
                 @Param("age") int age,@Param("type") String type,
                 @Param("phone") String phone,@Param("email") String email,
                 @Param("username") String username,@Param("password") String password);
    //get staff info
    staff getStaffInfoById(@Param("id") int id);
    //update staff by id
    int updateStaffById(@Param("name") String name,@Param("sex") String sex,
                        @Param("age") int age,@Param("type") String type,
                        @Param("phone") String phone,@Param("email") String email,
                        @Param("username") String username,@Param("id") int id);
    //delete staff by id
    int deleteStaffById(@Param("id") int id);
    //update password by id
    int updatePasswordById(@Param("id") int id,@Param("password") String password);

    List<staff> getIdAndNameList();


    int getNumByUsername(@Param("username") String username);
}
