package com.noah.controller;

import com.alibaba.fastjson.JSONArray;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * http://www.cnblogs.com/huanzei/p/4990922.html
 * Created by Noah on 2017/6/12.
 */
public class TestController {

	//这里是拉取数据列表
	@RequestMapping(value = "/getJson")
	@ResponseBody
	public Object test() {
		String sqlStr = "select * from boot t";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sqlStr);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());

		return list;
	}
	//这里是实现单条数据删除功能
	@RequestMapping(value = "/remove")
	@ResponseBody
	public Object remove(@RequestParam String id) {
		String sqlStr = "delete  from boot t where t.N_ID = ?";
		int log1 = 0;
		try {
			log1 = jdbcTemplate.update(sqlStr, id);
			System.out.println("log - " + log);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return log1;
	}

	//这里是拉取编辑需要的显示数据
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Object edit(@RequestParam String id) {
		ModelAndView mv = new ModelAndView("/system/workSync/edit.jsp");
		String sqlStr = "select *  from boot t where t.N_ID = ?";
		Map<String, Object> list = null;
		try {
			if (null == id) {
			} else {
				list = jdbcTemplate.queryForMap(sqlStr, id);
				mv.addObject("map", list);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
	//提交编辑的数据以及提交录入的数据
	@RequestMapping(value = "/edited")
	@ResponseBody
	public Object edited(final Info info, HttpServletRequest request) {//Request Object use @RequestBody, not @RequestParam
		info.toString();

		String id = info.getId();
		String sqlStr = "update boot t set t.VC_NAME=?,VC_LIKE=?,VC_NOTE=?  where t.N_ID = ?";
		if (null == id || id.equals("")) {
			id = String.valueOf(System.currentTimeMillis());
			sqlStr = "INSERT INTO BOOT(VC_NAME,VC_LIKE,VC_NOTE,N_ID) VALUES (?,?,?,?)";
		}
		final String vcId = id;
		ModelAndView mv = new ModelAndView("/system/workSync/bootstrap-table.jsp");
		int logStr = 0;
		String logString = "";
		try {
			logStr = jdbcTemplate.update(sqlStr, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, info.getName());
					ps.setString(2, info.getLike());
					ps.setString(3, info.getNote());
					ps.setString(4, vcId);
				}
			});
			if (logStr != 0)
				logString = "Edit Success.";
			else
				logString = "Edit Error.";

			mv.addObject("logStr", logString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
}
