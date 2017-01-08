package org.seckill.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dao.SeckillDao;
import org.seckill.dao.SuccessKilledDao;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;
import org.seckill.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
		,"classpath:spring/spring-service.xml"})
public class SeckillServiceImplTest {
	@Autowired
	private SeckillService seckillService; 
//	@Autowired
//	private SeckillDao;
//	@Autowired
//	private SuccessKilledDao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Test
	public void testGetSeckillList() {
		System.out.println(seckillService.getSeckillList());
	}

	@Test
	public void testGetById() {
        long id = 1000;
        Seckill seckill = seckillService.getById(id);
        System.out.println(seckill);
	}

	@Test
	public void testSeckillLogic() {
        long id = 1000L;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        if (exposer.isExposed()) {
        	System.out.println(exposer);
			long phone = 13160672521L;
			String md5= exposer.getMd5();
			SeckillExecution execution = seckillService.executeSeckill(id, phone, md5);
			System.out.println(execution);
			
		}else {
			//ÃëÉ±Î´¿ªÆô
			System.out.println("ÃëÉ±Î´¿ªÆô");
		}
        
	}

	@Test
	public void testExecuteSeckill() {
		//9b8082b22ded08718a4255e9f482a80c
		try {
			long id = 1001L;
			long phone = 13160672521L;
			String md5= "9b8082b22ded08718a4255e9f482a80c";
			SeckillExecution execution = seckillService.executeSeckill(id, phone, md5);
			System.out.println(execution);
		} catch (RepeatKillException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SeckillCloseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SeckillException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}

}
