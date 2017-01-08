package org.seckill.service.impl;

import java.util.Date;
import java.util.List;
import org.seckill.dao.SeckillDao;
import org.seckill.dao.SuccessKilledDao;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.entity.SuccessKilled;
import org.seckill.enums.SeckillStatEnum;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;
import org.seckill.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

@Service
public class SeckillServiceImpl implements SeckillService{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SeckillDao seckillDao;
	@Autowired
	private SuccessKilledDao successKilledDao;

    //md5盐值字符串,用于混淆md5
    private final String slat = "asdfasd2341242@#$@#$%$%%#@$%#@%^%^";
	@Override
	public List<Seckill> getSeckillList() {
		// TODO Auto-generated method stub
		return seckillDao.queryAll(0, 4);
	}

	@Override
	public Seckill getById(long seckillId) {
		// TODO Auto-generated method stub
		return seckillDao.queryById(seckillId);
	}

	@Override
	public Exposer exportSeckillUrl(long seckillId) {
		Seckill seckill = seckillDao.queryById(seckillId);
		if (seckill == null) {
			return new Exposer(false, seckillId);
		}
		Date startTime = seckill.getStartTime();
		Date endTime = seckill.getEndTime();
		Date nowTime = new Date();
		//不在秒杀时间内
		if (nowTime.getTime()<startTime.getTime()
				|| nowTime.getTime() > endTime.getTime()) {
			return new Exposer(false, seckillId, nowTime.getTime(), startTime.getTime(), endTime.getTime());
		}
		//返回一个秒杀url
		String md5 = getMD5(seckillId);
		return new Exposer(true, md5, seckillId);
	}

	@Override
	@Transactional
	public SeckillExecution executeSeckill(long seckillId, long userPhone, String md5)
			throws SeckillException, RepeatKillException, SeckillCloseException {
		// TODO Auto-generated method stub
		if (md5==null || !md5.equals(getMD5(seckillId))) {
			throw new SeckillException(SeckillStatEnum.DATA_REWRITE.getStateInfo());		
		}
		
		Date nowTime = new Date();
		
		
		try {
			int updateCount = seckillDao.reduceNumber(seckillId, nowTime);
			if (updateCount <= 0 ) {
				throw new SeckillCloseException(SeckillStatEnum.END.getStateInfo());
				
			}else {
				int insertCount = successKilledDao.insertSuccessKilled(seckillId, userPhone);	
				if (insertCount <= 0 ) {
					//库存已经减了，如果插入秒杀成功记录失败就抛出异常让spring做回滚操作把库存加回来
					throw new RepeatKillException(SeckillStatEnum.REPEAT_KILL.getStateInfo());
				}else {
					SuccessKilled successKilled = successKilledDao.queryByIdWithSeckill(seckillId, userPhone);
					return new SeckillExecution(seckillId, SeckillStatEnum.SUCCESS,successKilled);
				}
			}
		}catch(SeckillCloseException e1){	
			throw e1;
		} catch (RepeatKillException e2) {
			throw e2;
		}catch (Exception e) {
            //所有的编译期异常转化为运行期异常,spring的声明式事务做rollback
            throw new SeckillException("seckill inner error: " + e.getMessage());
		}

	}

    private String getMD5(long seckillId) {
        String base = seckillId + "/" + slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
       // LOG.info("_________________________________md5: " + md5);
        return md5;
    }
	
}
