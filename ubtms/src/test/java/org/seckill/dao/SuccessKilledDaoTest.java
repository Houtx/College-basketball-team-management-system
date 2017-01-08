package org.seckill.dao;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//junit启动时加载springIOC窗口
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件路径
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SuccessKilledDaoTest {
	@Resource
	private SuccessKilledDao successKilledDao;
	@Test
	public void testInsertSuccessKilled() {
		//fail("Not yet implemented");
		long id = 1000L;
		long phone = 13502781182L;
		int insertCount = successKilledDao.insertSuccessKilled(id, phone);
		System.out.println("insertCount="+insertCount);
	}

	@Test
	public void testQueryByIdWithSeckill() {
		//fail("Not yet implemented");
		long id = 1000L;
		long phone = 13502781181L;
		SuccessKilled successKilled = successKilledDao.queryByIdWithSeckill(id, phone);
		System.out.println(successKilled);
		System.out.println(successKilled.getSeckill().getName());
	}

}
