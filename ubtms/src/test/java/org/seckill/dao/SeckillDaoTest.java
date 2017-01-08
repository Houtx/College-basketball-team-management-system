package org.seckill.dao;

import static org.junit.Assert.fail;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.Seckill;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//spring-test,junit ����������������
//junit����ʱ����springIOC����
@RunWith(SpringJUnit4ClassRunner.class)
//����junit spring�������ļ�·��
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillDaoTest {
	//����ע��
	@Resource
	private SeckillDao seckillDao;
	@Test
	public void testReduceNumber() {
		//fail("Not yet implemented");
		Date killTime = new Date();
		int updateCount = seckillDao.reduceNumber(1000L, killTime);
		System.out.println("updateCount="+updateCount);
	}

	@Test
	public void testQueryById() {
		//fail("Not yet implemented");
		long id = 1000;
		Seckill seckill = seckillDao.queryById(id);
		System.out.println(seckill.getName());
		System.out.println(seckill.toString());
	}

	@Test
	public void testQueryAll() {
		//fail("Not yet implemented");
		List<Seckill> seckills = seckillDao.queryAll(0, 100);
		for (Seckill seckill : seckills) {
			System.out.println(seckill.getName());
		}
		
	}

}
