package com.example.t_wms.controller;

import com.example.t_wms.service.reportService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;

@RestController
public class reportController {

    @Autowired
    reportService reportServiceObject;

    @GetMapping("/getInnReportData")
    public String getInnReportData() throws ParseException, JsonProcessingException {
        return reportServiceObject.getInnReportData();
    }
}
