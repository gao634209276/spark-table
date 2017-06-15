package com.noah.controller;

import com.alibaba.fastjson.JSONObject;
import com.noah.entry.User;
import com.noah.service.SparkServiceImpl;
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
	SparkServiceImpl sparkService;


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
	@RequestMapping(value = "/spark/user2")
	public List<User> get2(@RequestBody JSONObject obj) {
		List<User> list = new ArrayList<>();

		// 判断必选项
		if (obj.getString("") == null) {
			return null;
		}

		String eventType = obj.getString("eventType");
		String stateType = obj.getString("stateType");
		String province = obj.getString("province");
		String channel = obj.getString("channel");
		String recommendTime = obj.getString("recommendTime");
		String eventTime = obj.getString("eventTime");
		return null;
	}

}
