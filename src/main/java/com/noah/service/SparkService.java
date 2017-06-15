package com.noah.service;

import com.alibaba.fastjson.JSONObject;
import com.noah.entry.Wapdetail;

import java.util.List;

/**
 * SparkService
 *
 * Created by noah on 17-6-14.
 */
public interface SparkService {


	List<Wapdetail> query(JSONObject json);
}
