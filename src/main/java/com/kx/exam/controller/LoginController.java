package com.kx.exam.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONArray;
import com.kx.exam.common.annotation.Authority;
import com.kx.exam.common.annotation.ControllerLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.utils.DateUtil;
import com.kx.exam.model.Oper_user;
import com.kx.exam.service.LoginService;
import com.kx.exam.service.Oper_userService;
import com.kx.exam.service.UserinfoService;

/**
 * 登录Controller
 * @author administrator
 */
@Controller
@RequestMapping("/admin/")
public class LoginController extends BaseController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	protected UserinfoService userinfoService;
	@Autowired
	private Oper_userService oper_userService;

	/**
	 * 登录
	 * @param response
	 * @param userName
	 * @param password
	 * @return
	 */
	@ControllerLog("登录")
	@RequestMapping("login")
	@ResponseBody
	public AjaxResult login(HttpServletRequest request, HttpServletResponse response) {
		return loginService.login(request, response);
	}

	/**
	 * 登录成功进入主界面
	 * @param map
	 * @return
	 */
	/*@Authority(ifOper = "0",opCode = "0001", opName = "系统主界面")
	@RequestMapping("main")
	public String main(Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		// 读取session中的用户
		LoanRecord loanRecord = new LoanRecord();
		Date now = new Date();
		Date startDate = DateUtils.addDays(now, -30);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//sdf.format(startDate)
		loanRecord.setBegindate("2018-05-25");
		loanRecord.setEnddate("2018-06-10");//sdf.format(now)
		loanRecord.setCustomerid(sessionuser.getCustomerid());
		String stata = "4";//按照天数来查询结果
	 	List<LoanRecord> list = loanRecordService.queryLoanRecord(loanRecord,stata);
		//根据不同状态统计申请状态
	 	System.out.println(list);
	 	String loans = JSONArray.toJSONString(list);
		System.out.println(loans);
	 	model.addAttribute("list", loans);
		return "main/index";
	}*/	
	@Authority(ifOper = "0",opCode = "0001", opName = "系统主界面")
	@RequestMapping("main")
	public String main(Map<String, Object> map) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		String ifdaichao = (String) request.getAttribute("ifdaichao");
		Double total = 0.0;//	总共贷款金额
		Double altotal = 0.0;//已还金额									
		Double yuqitotal = 0.0;//逾期金额
		Double yintotal = 0.0;//盈利金额
	
		map.put("total", total);
		map.put("altotal", altotal);
		map.put("yuqitotal",yuqitotal);
		map.put("yintotal",yuqitotal);
		map.put("total", total);
		HashMap<String, Double> mapt = new HashMap<String, Double>();
		String date = "";
		boolean b = false;
		
		map.put("datelist", mapt);
		
		
		map.put("lrtoday", 0);
		map.put("lruser", 0);
		if(ifdaichao.equalsIgnoreCase("1"))
			return "main/indexchao";
		else
			return "main/index";
	}	

	/**
	 * 退出
	 * @param response
	 * @param request
	 * @return
	 */
	@ControllerLog("退出")
	@RequestMapping("logout")
	@ResponseBody
	public AjaxResult logout(HttpServletResponse response, HttpServletRequest request) {
		return loginService.logout(response, request);
	}
}
