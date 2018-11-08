package com.kx.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kx.exam.common.annotation.Authority;
import com.kx.exam.common.annotation.ControllerLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.common.utils.QRCodeUtil;
import com.kx.exam.common.utils.StringUtils;
import com.kx.exam.model.AuthOperation;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.AuthRoleOperation;
import com.kx.exam.model.Oper_user;
import com.kx.exam.service.AuthOperationService;
import com.kx.exam.service.AuthRoleOperationService;
import com.kx.exam.service.Oper_userService;
import com.kx.exam.service.RoleService;


@Controller
@RequestMapping("/admin/")
public class Oper_userController extends BaseController {

	@Autowired
	private Oper_userService oper_userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private AuthRoleOperationService authRoleOperationService;
	@Autowired
	private AuthOperationService authOperationService;
	/**存放地址*/
	@Value("${global.upload.docBase}")
	private String docBase;
	/**图片访问地址*/
	@Value("${publicURL}") //在配置文件中
	private String publicurl;
	@Authority(ifOper = "0",opCode = "0101", opName = "用户管理界面")
	@RequestMapping("opmainPage")
	public String opmainPage(Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		map.put("list", alllist);
		
		return "auth/oper_user/main";
	}

	@ControllerLog("查询用户列表")
	@RequestMapping("opqueryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0101", opName = "查询用户列表")
	public PageAjax<Oper_user> opqueryPage(PageAjax<Oper_user> page, Oper_user oper_user) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//System.out.println("========1==========="+sessionuser.getUsername());
		if(!sessionuser.getUsername().equalsIgnoreCase("admin")) {
			//System.out.println("========2==========="+sessionuser.getCustomerid());
			oper_user.setCustomerid(sessionuser.getCustomerid());
			if(!sessionuser.getRole().getRolename().equalsIgnoreCase("admin")) {
				oper_user.setCompid(sessionuser.getCompid());
				oper_user.setOpuserid(sessionuser.getOpuserid());
			}
		}
		//展示页面真正内容
		return oper_userService.queryPage(page, oper_user);
	}

	@Authority(ifOper = "0",opCode = "010101", opName = "添加用户页面")
	@RequestMapping("opaddPage")
	public String addPage(Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		
		map.put("list", alllist);
		return "auth/oper_user/add";
	}

	@ControllerLog("添加用户")
	@RequestMapping("opadd")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010101", opName = "添加用户")
	public AjaxResult opadd(Oper_user oper_user) {
		oper_user.setOpuserid(this.getUuid());
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		String rid="";
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		if(sessionuser.getUsername().equalsIgnoreCase("admin")) {
			rid=this.getUuid();
			oper_user.setOpuserid(this.getUuid());
			oper_user.setCompid(this.getUuid());
			oper_user.setIfoper("0");;
			oper_user.setCustomerid(oper_userService.comp_getCompno());
			AuthRole role = new AuthRole();
			role.setRoleid(rid);
			role.setCname("管理员");
			role.setRolename("admin");
			role.setCustomerid(oper_user.getCustomerid());
			role.setCompid(oper_user.getCompid());
			roleService.saveRole(role);
			oper_user.setRoleid(rid);
			List<AuthOperation> alllist = new ArrayList();
			List<AuthRoleOperation> list = new ArrayList();
			alllist = authOperationService.queryAllOpers();
			for(AuthOperation aop:alllist) {
				AuthRoleOperation aro = new AuthRoleOperation();
				aro.setOpid(aop.getOpid());
				aro.setRoleid(rid);
				list.add(aro);
			}
			authRoleOperationService.batchInsert(list);
			//获得所有操作功能
			//operationService.doroleoper(oper_user.getOpuserid(), oper_user.getCompid(), oper_user.getCustomerid());
		}else {
			oper_user.setCustomerid(sessionuser.getCustomerid());
			oper_user.setCompid(sessionuser.getCompid());
		}
		if(oper_user.getOpname()==null||oper_user.getOpname().equals("")) {
			oper_user.setOpname(oper_user.getUsername());
		}
		if(!(oper_user.getMobile()==null||oper_user.getMobile().equals("")))
			oper_user.setBelongto(StringUtils.getContentUsingStringBean("http://www.ip138.com:8080/search.asp?action=mobile&mobile="+oper_user.getMobile().replaceAll(" ", "")));
		//推广二维生产
		oper_user.setQrcode("/uploadwallet"+QRCodeUtil.encode(publicurl+"invitelogin.jsp?uid="+oper_user.getOpuserid()+"&customerid="+oper_user.getCustomerid(), docBase+"logo.png",docBase,"/qrcode/", true));
		return oper_userService.saveUser(oper_user);
	}

	@Authority(ifOper = "0",opCode = "010102", opName = "更新用户页面")
	@RequestMapping("opupdatePage/{opuserid}")
	public String opupdatePage(@PathVariable("opuserid") String opuserid, Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		map.put("list", alllist);
		Oper_user oper_user = oper_userService.queryByID(opuserid);
		map.put("oper_user", oper_user);
		return "auth/oper_user/update";
	}

	@ControllerLog("修改用户")
	@RequestMapping("opupdate")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010102", opName = "修改用户")
	public AjaxResult opupdate(Oper_user oper_user) {
		if(!(oper_user.getMobile()==null||oper_user.getMobile().equals("")))
			oper_user.setBelongto(StringUtils.getContentUsingStringBean("http://www.ip138.com:8080/search.asp?action=mobile&mobile="+oper_user.getMobile().replaceAll(" ", "")));
		return oper_userService.updateUser(oper_user);
	}
	
	@Authority(ifOper = "0",opCode = "010103", opName = "重置用户密码页面")
	@RequestMapping("opupdatePwdPage")
	public String opupdatePwdPage(Map<String, Object> map, String opuserid) {
		map.put("id", opuserid);
		return "auth/oper_user/update_pwd";
	}

	@ControllerLog("重置用户密码")
	@RequestMapping("opupdatePwd")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010103", opName = "重置用户密码")
	public AjaxResult updatePwd(Oper_user oper_user) {
		return oper_userService.update(oper_user);
	}
	
	@Authority(ifOper = "0",opCode = "010104", opName = "修改个人密码页面")
	@RequestMapping("opupdatePasswdPage")
	public String opupdatePasswdPage(Map<String, Object> map, String opuserid) {
		map.put("opuserid", opuserid);
		return "auth/oper_user/update_passwd";
	}

	@ControllerLog("修改个人密码")
	@RequestMapping("opupdatePasswd")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010104", opName = "修改个人密码")
	public AjaxResult opupdatePasswd(HttpServletResponse response, HttpServletRequest request, String opuserid, String oldPwd, String newPwd) {
		System.out.println("=======:"+opuserid+","+oldPwd+","+newPwd);
		return oper_userService.updatePwd(response, request, opuserid, oldPwd, newPwd);
	}

	@ControllerLog("删除用户")
	@RequestMapping("opdeleteByID/{opuserid}")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010104", opName = "删除用户")
	public AjaxResult opdeleteByID(@PathVariable("opuserid") String opuserid) {
		return oper_userService.deleteByID(opuserid);
	}
	@Authority(ifOper = "0",opCode = "0106", opName = "推广页面界面")
	@RequestMapping("extensionPage")
	public String extensionPage(Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		map.put("list", alllist);
		map.put("publicurl", publicurl);
		return "auth/oper_user/extensionPage";
	}

	@ControllerLog("查询用户列表")
	@RequestMapping("extensionqueryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0106", opName = "查询推广页面列表")
	public PageAjax<Oper_user> extensionqueryPage(PageAjax<Oper_user> page, Oper_user oper_user) {
		//展示页面真正内容
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		oper_user.setCustomerid(sessionuser.getCustomerid());
		return oper_userService.queryPage(page, oper_user);
	}
}
