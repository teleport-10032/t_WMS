package com.example.t_wms.controller;


import com.example.t_wms.service.customerCrmService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
public class customerCrmController {

    @Autowired
    customerCrmService customerCrmServiceObject;

    @GetMapping("/getCustomerCrmList")
    public String getCustomerCrmList(@RequestParam("page") int page, @RequestParam("pre") int pre,
                                     @RequestParam("key") String key, @RequestParam("token") String token) throws JsonProcessingException {
        return customerCrmServiceObject.getCustomerCrmList(page,pre,key,token);
    }

    @GetMapping("/getVisitListByCustomerId")
    public String getVisitListByCustomerId(@RequestParam("customerId") int customerId,@RequestParam("token") String token) throws JsonProcessingException {
        return customerCrmServiceObject.getVisitListByCustomerId(customerId,token);
    }

    @DeleteMapping("/deleteVisitById")
    public String deleteVisitById(@RequestParam("id") int id,@RequestParam("token") String token) throws JsonProcessingException {
        return customerCrmServiceObject.deleteVisitById(id,token);
    }

    @PostMapping("/addVisit")
    public String addVisit(@RequestParam("customerId") int customerId, @RequestParam("date") String date, @RequestParam("info") String info, @RequestParam("token") String token) throws JsonProcessingException {
        return customerCrmServiceObject.addVisit(customerId,date,info,token);
    }

}
