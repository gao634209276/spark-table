package com.noah;

import com.noah.dao.DualDao;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class Test {
	@Autowired
	private DualDao dualDao;

	@org.junit.Test
	public void test() {
		System.out.println(dualDao.getAll());
	}
}
