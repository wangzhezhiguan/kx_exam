package com.kx.exam.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kx.exam.common.annotation.Authority;
import com.kx.exam.common.annotation.ControllerLog;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.model.ILog;
import com.kx.exam.model.Oper_user;
import com.kx.exam.service.LogService;

@Controller
@RequestMapping("/admin/")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;

	@Authority(ifOper = "0",opCode = "0301", opName = "日志管理界面")
	@RequestMapping("logmainPage")
	public String mainPage(){
		return "log/main";
	}
	@Authority(ifOper = "0",opCode = "0301", opName = "财务日志管理界面")
	@RequestMapping("preFinanceLog")
	public String preFinanceLog(){
		return "log/financeMain";
	}

	@ControllerLog("查询日志列表")
	@RequestMapping("logqueryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0301", opName = "查询日志列表")
	public PageAjax<ILog> logqueryPage(PageAjax<ILog> page, ILog log) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		log.setCustomerid(sessionuser.getCustomerid());
		page.setOrderBy("operDate desc");
		return logService.queryPage(page, log);
	}
}
