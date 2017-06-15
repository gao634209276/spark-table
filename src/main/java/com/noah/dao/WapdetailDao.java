package com.noah.dao;

import com.noah.entry.Wapdetail;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * table t_codewapdetail Dao
 * Created by noah on 17-6-14.
 */
//@MapperScan
@Repository
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
	List<Wapdetail> getData(@Param("provinceId") String province,
	                        @Param("appFrom") String channel,
	                        @Param("tuijianTime") String recommendTime,
	                        @Param("activeTime") String eventTime,
	                        @Param("activeType") String eventType,
	                        @Param("stateType") String stateType);
}
