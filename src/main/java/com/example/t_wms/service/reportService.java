package com.example.t_wms.service;


import com.fasterxml.jackson.core.JsonProcessingException;

import java.text.ParseException;
import java.util.List;

public interface reportService {
    String getInnReportData(int year,int productId) throws ParseException, JsonProcessingException;
    String getOuttReportData(int year,int productId) throws ParseException, JsonProcessingException;
    String getYearList() throws ParseException, JsonProcessingException;
}
