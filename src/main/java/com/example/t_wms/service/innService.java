package com.example.t_wms.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface innService {
    String getInnList(int page, int pre, String key, String token) throws JsonProcessingException;
}
