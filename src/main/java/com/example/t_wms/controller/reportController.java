package com.example.t_wms.controller;

import com.example.t_wms.service.reportService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;

@RestController
public class reportController {

    @Autowired
    reportService reportServiceObject;

    @GetMapping("/getInnReportData")
    public String getInnReportData(@RequestParam("year") int year,@RequestParam("productId") int productId) throws ParseException, JsonProcessingException {
        return reportServiceObject.getInnReportData(year,productId);
    }
    @GetMapping("/getOuttReportData")
    public String getOuttReportData(@RequestParam("year") int year,@RequestParam("productId") int productId) throws ParseException, JsonProcessingException {
        return reportServiceObject.getOuttReportData(year,productId);
    }

    @GetMapping("/getYearList")
    public String getYearList() throws ParseException, JsonProcessingException {
        return reportServiceObject.getYearList();
    }

}
