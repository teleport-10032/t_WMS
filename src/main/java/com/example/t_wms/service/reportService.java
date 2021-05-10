package com.example.t_wms.service;


import com.fasterxml.jackson.core.JsonProcessingException;

import java.text.ParseException;
import java.util.List;

public interface reportService {
    String getInnReportData() throws ParseException, JsonProcessingException;
}
