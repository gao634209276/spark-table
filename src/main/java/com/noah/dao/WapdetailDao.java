package com.noah.dao;

import com.noah.entry.Wapdetail;
import org.apache.ibatis.annotations.Param;

/**
 * table t_codewapdetail Dao
 * Created by noah on 17-6-14.
 */
public interface WapdetailDao {
	/**
	 * t_codewapdetail
	 * eventType: $("#event_type").val(),
	 * stateType: $("#state_type").val(),
	 * province: $("#province").val,
	 * channel: $("#channel").val,
	 * recommendTime: $("#recommend_time").val,
	 * eventTime: $("#event_time").val
	 */
	Wapdetail getData(@Param("eventType") String eventType,
	                  @Param("stateType") String stateType,
	                  @Param("province") String province,
	                  @Param("channel") String channel,
	                  @Param("recommendTime") String recommendTime,
	                  @Param("eventTime") String eventTime);
}
