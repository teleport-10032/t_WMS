package com.example.t_wms.controller;

import com.example.t_wms.service.supplierService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class supplierController {
    @Autowired
    supplierService supplierServiceObject;
    
    @GetMapping("getSupplierList")
    public String getStaffList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                               @RequestParam("key") String key, @RequestParam("token") String token)
            throws JsonProcessingException {
        return supplierServiceObject.getSupplierList(page,pre,key,token);
    }

    @GetMapping("getSupplierById")
    public String getSupplierById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return supplierServiceObject.getSupplierById(id,token);
    }
    @PostMapping("addSupplier")
    public String addSupplier(@RequestParam("name") String name,@RequestParam("companyName") String companyName,@RequestParam("address") String address,
                              @RequestParam("telephone") String telephone,@RequestParam("email") String email,@RequestParam("site") String site,
                              @RequestParam("bank") String bank,@RequestParam("bankAccount") String bankAccount,@RequestParam("bankName") String bankName,
                              @RequestParam("taxNumber") String taxNumber,@RequestParam("debts") double debts,@RequestParam("info") String info,
                              @RequestParam("token") String token
                              ) throws JsonProcessingException {
        return supplierServiceObject.addSupplier(name,companyName,address,telephone, email,site, bank,bankAccount,bankName,taxNumber,debts,info,token);
    }
    @PutMapping("updateSupplierById")
    public String updateSupplierById(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("companyName") String companyName,@RequestParam("address") String address,
                                     @RequestParam("telephone") String telephone,@RequestParam("email") String email,@RequestParam("site") String site,
                                     @RequestParam("bank") String bank,@RequestParam("bankAccount") String bankAccount,@RequestParam("bankName") String bankName,
                                     @RequestParam("taxNumber") String taxNumber,@RequestParam("debts") double debts,@RequestParam("info") String info,
                                     @RequestParam("staffId") int staffId, @RequestParam("token") String token) throws JsonProcessingException {
        return supplierServiceObject.updateSupplierById(id,name,companyName,address,telephone, email,site, bank,bankAccount,bankName,taxNumber,debts,info,staffId,token);
    }

    @DeleteMapping("deleteSupplierById")
    public String deleteSupplierById(@RequestParam("id") int id, @RequestParam("token") String token) throws JsonProcessingException {
        return supplierServiceObject.deleteSupplierById(id,token);
    }

    @GetMapping("getSupplierIdAndName")
    public String getSupplierIdAndName(@RequestParam("token") String token) throws JsonProcessingException {
        return supplierServiceObject.getIdAndName(token);
    }
}
