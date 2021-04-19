package com.example.t_wms.controller;

import com.example.t_wms.service.customerService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class customerController {
    @Autowired
    customerService customerServiceObject;
    
    @GetMapping("getCustomerList")
    public String getStaffList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token)
            throws JsonProcessingException {
        return customerServiceObject.getCustomerList(page,pre,key,token);
    }

    @GetMapping("getCustomerById")
    public String getCustomerById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return customerServiceObject.getCustomerById(id,token);
    }
    @PostMapping("addCustomer")
    public String addCustomer(@RequestParam("name") String name,@RequestParam("companyName") String companyName,@RequestParam("address") String address,
                              @RequestParam("telephone") String telephone,@RequestParam("email") String email,@RequestParam("site") String site,
                              @RequestParam("bank") String bank,@RequestParam("bankAccount") String bankAccount,@RequestParam("bankName") String bankName,
                              @RequestParam("taxNumber") String taxNumber,@RequestParam("debts") double debts,@RequestParam("info") String info,
                              @RequestParam("token") String token
                              ) throws JsonProcessingException {
        return customerServiceObject.addCustomer(name,companyName,address,telephone, email,site, bank,bankAccount,bankName,taxNumber,debts,info,token);
    }
    @PutMapping("updateCustomerById")
    public String updateCustomerById(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("companyName") String companyName,@RequestParam("address") String address,
                                     @RequestParam("telephone") String telephone,@RequestParam("email") String email,@RequestParam("site") String site,
                                     @RequestParam("bank") String bank,@RequestParam("bankAccount") String bankAccount,@RequestParam("bankName") String bankName,
                                     @RequestParam("taxNumber") String taxNumber,@RequestParam("debts") double debts,@RequestParam("info") String info,
                                     @RequestParam("token") String token) throws JsonProcessingException {
        return customerServiceObject.updateCustomerById(id,name,companyName,address,telephone, email,site, bank,bankAccount,bankName,taxNumber,debts,info,token);
    }

    @DeleteMapping("deleteCustomerById")
    public String deleteCustomerById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return customerServiceObject.deleteCustomerById(id,token);
    }

    @GetMapping("getCustomerIdAndName")
    public String getCustomerIdAndName(@RequestParam("token") String token) throws JsonProcessingException {
        return customerServiceObject.getIdAndName(token);
    }

}
