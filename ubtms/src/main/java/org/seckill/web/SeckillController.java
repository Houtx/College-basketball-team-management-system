package org.seckill.web;

import java.util.Date;
import java.util.List;

import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.dto.SeckillResult;
import org.seckill.entity.Seckill;
import org.seckill.enums.SeckillStatEnum;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;
import org.seckill.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/seckill")
public class SeckillController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SeckillService seckillService;
	
	//ָ��jspҳ��ֻ��ͨ��GET����������˷���
	//��û��ָ��method����������£����Դ����κ����͵�����
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Seckill> list = seckillService.getSeckillList();
		model.addAttribute("list",list);
		//list.jsp + model = ModelAndView
		return "list";// /WEB-INF/jsp/list.jsp
	}
	
	//@PathVariable ��ʾ·���е�{seckilled}���ݸ�long seckillId
	@RequestMapping(value="/{seckilled}/detail",method=RequestMethod.GET)
	public String detail(@PathVariable(value="seckilled")Long seckillId,Model model) {
		//ע��Long��long�İ�װ�࣬����Ϊnull
		if (seckillId == null) {
			//redirect�ض��������������������Servlet�ٷ���һ������
			//forwardֱ����Servelt��������
			return "redirect:/seckill/list";
		}
		Seckill seckill = seckillService.getById(seckillId);
	
		if (seckill == null) {
			return "forward:/seckill/list";
		}
		model.addAttribute("seckill", seckill);
		return "detail";
	}
	
	@RequestMapping(value="/{seckillId}/exposer",method=RequestMethod.POST,
			produces={"application/json;charset=UTF-8"})
	@ResponseBody
	//@ResponseBody��ʾ���ص������ݣ�����ҳ��
	//��Ӧajax��json����
	//produces: ָ�����ص���������,����request����ͷ�е�(Accept)�����а�����ָ�����Ͳŷ���;
	public SeckillResult<Exposer> exposer(@PathVariable(value="seckillId")Long seckillId) {
		SeckillResult<Exposer> result;
		
		try {
			Exposer exposer = seckillService.exportSeckillUrl(seckillId);
			result = new SeckillResult<Exposer>(true, exposer);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result = new SeckillResult<Exposer>(false, e.getMessage());
		}
		return result;
	}
	
	
	
	@RequestMapping(value = "/{seckillId}/{md5}/execution",method=RequestMethod.POST,
			produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public SeckillResult<SeckillExecution> execute(@PathVariable(value="seckillId") Long seckillId,
			@PathVariable(value="md5") String md5,@CookieValue(value="killPhone",required=false) Long killPhone) {
		//@CookieValue value�ǰ�cookie��ֵ��Ĭ��required=true
		//�����ֵû�а�cookie���׳��쳣��required���ó�false������쳣
		//���������ж�killPhone�Ƿ�Ϊ�գ��ֶ��׳��쳣
		if (killPhone==null) {
			return new SeckillResult<SeckillExecution>(false, SeckillStatEnum.NOT_LOGIN.getStateInfo());						
		}
		
		try {
			SeckillExecution execution = seckillService.executeSeckill(seckillId, killPhone, md5);
			return new SeckillResult<SeckillExecution>(true, execution);
		} catch (RepeatKillException e) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.REPEAT_KILL);
            return new SeckillResult<SeckillExecution>(true, execution);
		} catch (SeckillCloseException e) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.END);
            return new SeckillResult<SeckillExecution>(true, execution);
		} catch (SeckillException e) {
			logger.error(e.getMessage(), e);
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.INNER_ERROR);
            return new SeckillResult<SeckillExecution>(true, execution);
		}
	}
	
	
    @RequestMapping(value = "/time/now", method = RequestMethod.GET)
    @ResponseBody
    public SeckillResult<Long> time() {
        Date now = new Date();
        return new SeckillResult(true, now.getTime());
    }

}
