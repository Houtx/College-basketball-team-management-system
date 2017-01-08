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
	
	//指定jsp页面只能通过GET方法来请求此方法
	//在没有指定method参数的情况下，可以处理任何类型的请求
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Seckill> list = seckillService.getSeckillList();
		model.addAttribute("list",list);
		//list.jsp + model = ModelAndView
		return "list";// /WEB-INF/jsp/list.jsp
	}
	
	//@PathVariable 表示路径中的{seckilled}传递给long seckillId
	@RequestMapping(value="/{seckilled}/detail",method=RequestMethod.GET)
	public String detail(@PathVariable(value="seckilled")Long seckillId,Model model) {
		//注意Long是long的包装类，可以为null
		if (seckillId == null) {
			//redirect重定向给浏览器，让浏览器向Servlet再发送一次请求
			//forward直接向Servelt发送请求
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
	//@ResponseBody表示返回的是数据，不是页面
	//响应ajax的json请求
	//produces: 指定返回的内容类型,仅当request请求头中的(Accept)类型中包含该指定类型才返回;
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
		//@CookieValue value是绑定cookie的值，默认required=true
		//如果该值没有绑定cookie则抛出异常，required设置成false则忽略异常
		//所以下面判断killPhone是否为空，手动抛出异常
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
