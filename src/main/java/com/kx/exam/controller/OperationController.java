package com.kx.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kx.exam.common.annotation.Authority;
import com.kx.exam.common.annotation.ControllerLog;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.model.AuthOperation;
import com.kx.exam.service.OperationService;

@Controller
@RequestMapping("/admin/")
public class OperationController extends BaseController {

	@Autowired
	private OperationService opService;

	@Authority(ifOper = "0",opCode = "0103", opName = "权限管理界面")
	@RequestMapping("opermainPage")
	public String opermainPage(){
		return "auth/oper/main";
	}

	@ControllerLog("查询权限列表")
    @RequestMapping("operqueryPage")
    @ResponseBody
    @Authority(ifOper = "0",opCode = "0103", opName = "查询权限列表")
    public PageAjax<AuthOperation> operqueryPage(PageAjax<AuthOperation> page, AuthOperation oper) {
        return opService.queryPage(page, oper);
    }
}
