package com.noah.controller;

import com.alibaba.fastjson.JSON;
import com.noah.service.TestServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/main") // url:/模块/资源/{id}/细分
public class MainController {


	@Autowired
	TestServiceImpl testServiceImpl;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	private String list(Model model) {
		//model.addAttribute("list", list);
		// list.jsp + model = ModelAndView
		return "list";// WEB-INF/jsp/"list".jsp
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	private String detail(@PathVariable("bookId") Long bookId, Model model) {
		//return "redirect:/book/list";
		//return "forward:/book/list";
		//model.addAttribute("book", book);
		return "detail";
	}


	//http://blog.csdn.net/kobejayandy/article/details/12690555
	// ajax json
	@RequestMapping(value = "/ajax/{testPath}",
			method = RequestMethod.POST,
			consumes = {"application/json;charset=utf-8"},//仅处理request Content-Type为“application/json”类型的请求
			produces = {"application/json;charset=utf-8"},//仅处理request请求中Accept头中包含了"application/json"的请求，同时暗示了返回的内容类型为application/json
			params="myParam=myValue", //仅处理请求中包含了名为“myParam”，值为“myValue”的请求
			headers="Referer=http://www.ifeng.com/" // 仅处理request的header中包含了指定“Refer”请求头和对应值为“http://www.ifeng.com/”的请求
	) @ResponseBody
	//@DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
	private Object testAjax(@PathVariable("testPath") String path, @RequestParam("id") Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", 0);
		map.put("path", path);
		map.put("id", id);
		String json = JSON.toJSONString(map);
		logger.info(json);
		return json;
	}
}
