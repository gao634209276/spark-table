package com.noah.service;

import com.alibaba.fastjson.JSONObject;
import com.noah.dao.WapdetailDao;
import com.noah.entry.Wapdetail;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * SparkServiceImpl
 * <p>
 * Created by noah on 17-6-14.
 */
@Service
public class SparkServiceImpl implements SparkService {

	public static Log log = LogFactory.getFactory().getInstance(SparkServiceImpl.class);

	@Autowired
	WapdetailDao wapdetailDao;

	public List<Wapdetail> query(JSONObject json) {

		String eventType = json.getString("activeType");
		String stateType = json.getString("stateType");
		String province = json.getString("provinceId");
		String channel = json.getString("appFrom");
		String recommendTime = json.getString("tuijianTime");
		String eventTime = json.getString("activeTime");
		log.info(json);
		if (eventType == null) {
			log.info("eventType null");
		}

		return wapdetailDao.getData(province, channel, recommendTime, eventTime, eventType, stateType);
	}


}
