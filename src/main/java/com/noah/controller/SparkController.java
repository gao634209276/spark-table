package com.noah.controller;

import com.alibaba.fastjson.JSONObject;
import com.noah.entry.User;
import com.noah.entry.Wapdetail;
import com.noah.service.SparkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Spark COntroller
 * Created by noah on 17-6-14.
 */
@Controller
public class SparkController {
	@Autowired
	SparkService sparkServiceImpl;

	/**
	 * t_codewapdetail
	 * eventType: $("#event_type").val(),
	 * stateType: $("#state_type").val(),
	 * province: $("#province").val,
	 * channel: $("#channel").val,
	 * recommendTime: $("#recommend_time").val,
	 * eventTime: $("#event_time").val
	 */
	@ResponseBody
	@RequestMapping(value = "/spark/data")
	public List<Wapdetail> getData(@RequestBody JSONObject json) {
		List<User> list = new ArrayList<>();
		// 判断必选项
		/*if (json.getString("") == null) {
			return null;
		}*/
		return sparkServiceImpl.query(json);
	}

}
