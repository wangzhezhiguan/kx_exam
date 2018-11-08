package com.kx.exam.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kx.exam.common.utils.StringUtils;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.Oper_user;
import com.kx.exam.model.Userinfo;
import com.kx.exam.service.Oper_userService;
import com.kx.exam.service.RoleService;
import com.kx.exam.service.UserinfoService;
@Controller
@RequestMapping("/admin/")
public class UserinfoController extends BaseController {

	@Autowired
	protected UserinfoService userinfoService;
	@Autowired
	private Oper_userService oper_userService;

	@Autowired
	private RoleService roleService;

 	@Authority(ifOper = "0",opCode = "0501", opName = "客户池界面")
	@RequestMapping("userinfolist")
	public String userinfolist(Map<String, Object> map) {
    	//如果有需要选择的内容 填写了传到页面上渲染		
		return "userinfo/list";
	}
	@ControllerLog("查询客户列表")
	@RequestMapping("userinfoQueryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0501", opName = "查询客户池列表")
	public PageAjax<Userinfo> userinfoQueryPage(PageAjax<Userinfo> page, Userinfo userinfo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		
		if(sessionuser.getIfoper().equalsIgnoreCase("0"))
			userinfo.setCustomerid(sessionuser.getCustomerid());
		//展示页面真正内容
		return userinfoService.queryPage(page, userinfo);
	}
	@Authority(ifOper = "0",opCode = "0502", opName = "客户池界面")
	@RequestMapping("myUserinfolist")
	public String myUserinfolist(Map<String, Object> map) {
    	//如果有需要选择的内容 填写了传到页面上渲染		
		return "userinfo/mylist";
	}
	
	@ControllerLog("查询客户列表")
	@RequestMapping("myUserinfoQeryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0502", opName = "查询客户池列表")
	public PageAjax<Userinfo> myUserinfoQeryPage(PageAjax<Userinfo> page, Userinfo userinfo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		
		String roleid = sessionuser.getRoleid();
		AuthRole role = roleService.queryByID(roleid);
		if(sessionuser.getIfoper().equalsIgnoreCase("0")) {
			if("0".equals(role.getTypes())){//0超级管理员1管理员2销售员3财务
				userinfo.setCustomerid(sessionuser.getCustomerid());
			}else{
				userinfo.setOpuserid(sessionuser.getOpuserid());
			}
			return userinfoService.queryPage(page, userinfo);
		}
		return userinfoService.queryListOper(page, userinfo);
		//展示页面真正内容
		
	}
	/*@Authority(ifOper = "0",opCode = "050101", opName = "添加工单页面")
	@RequestMapping("preUserinfoAdd")
	public String preUserinfoAdd(Map<String, Object> map) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把操作管理员传出去到页面渲染
		List<Oper_user> list = oper_userService.selectByCustomerid(sessionuser.getCustomerid());

		map.put("list", list);
		return "userinfo/add";
	}*/
	/*@ControllerLog("添加客户")
	@RequestMapping("userinfoAdd")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "050101", opName = "添加客户")
	public AjaxResult userinfoAdd(Userinfo userinfo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user oper_user = (Oper_user) request.getAttribute("loginUser");
		//userinfo.setWorkOrderid(this.getUuid());
		userinfo.setStatus("0");
		userinfo.setOpuserid(oper_user.getOpuserid());
		//userinfo.setDeptid(this.getUuid());
		userinfo.setLoginname(userinfo.getMobile());
		userinfo.setPassword("123456");
		userinfo.setCreatedate(DateUtil.format(new Date(),"yyyy-MM-dd HH:mm:ss"));
		try {
		return userinfoService.saveUserinfo(userinfo);
		}catch (Exception e) {
			e.printStackTrace();
			return new AjaxResult(1, "未知错误", null);
		}
	}*/
	/*@Authority(ifOper = "0",opCode = "0501", opName = "客户池界面")
	@RequestMapping("shenUserinfolist")
	public String shenUserinfolist(Map<String, Object> map) {
    	//如果有需要选择的内容 填写了传到页面上渲染		
		return "userinfo/shenlist";
	}
	
	@ControllerLog("查询审核客户列表")
	@RequestMapping("shenUserinfoQueryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0501", opName = "查询审核客户列表")
	public PageAjax<Userinfo> shenUserinfoQueryPage(PageAjax<Userinfo> page, Userinfo userinfo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		userinfo.setOpuserid(sessionuser.getOpuserid());
		//展示页面真正内容
		return userinfoService.queryPage(page, userinfo);
	}*/
	@Authority(ifOper = "0",opCode = "050101", opName = "更新用户页面")
	@RequestMapping("preUserinfoUpdate/{userid}")
	public String preUserinfoUpdate(@PathVariable("userid") String userid, Map<String, Object> map) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把操作管理员传出去到页面渲染
		List<Oper_user> list = oper_userService.selectByCustomerid(sessionuser.getCustomerid());

		map.put("list", list);
		Userinfo user = userinfoService.selectById(userid);
		map.put("user", user);
		
		return "userinfo/update";
	}
	@ControllerLog("修改客户")
	@RequestMapping("userinfoUpdate")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "050101", opName = "修改客户")
	public AjaxResult userinfoUpdate(Userinfo user) {
		if(!(user.getMobile()==null||user.getMobile().equals("")))
			user.setBelongto(StringUtils.getContentUsingStringBean("http://www.ip138.com:8080/search.asp?action=mobile&mobile="+user.getMobile().replaceAll(" ", "")));
		return userinfoService.updateUserinfo(user);
	}

	@Authority(ifOper = "0",opCode = "050302", opName = "认证用户页面")
	@RequestMapping("preRenUpdate/{userid}")
	public String preRenUpdate(@PathVariable("userid") String userid, Map<String, Object> map) {
	
		Userinfo user = userinfoService.selectById(userid);
		map.put("user", user);
		
		return "userinfo/renupdate";
	}
	@ControllerLog("认证处理客户")
	@RequestMapping("renupdate")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "050302", opName = "认证处理客户")
	public AjaxResult renupdate(Userinfo user) {
		return userinfoService.updateUserinfo(user);
	}
	//修改进件用户重分配销售员
	@Authority(ifOper = "0",opCode = "050303", opName = "用户重分配销售员")
	@RequestMapping("preUserUpdateOper/{userid}")
	public String preUserUpdateOper(@PathVariable("userid") String userid, Map<String, Object> map) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		List<Oper_user> list = oper_userService.selectByCustomerid(sessionuser.getCustomerid());
		Userinfo user = userinfoService.selectById(userid);
		map.put("user", user);
		map.put("list", list);		
		return "userinfo/userUpdateOper";
	}
	@ControllerLog("修改进件用户重分配销售员")
	@RequestMapping("userUpdateOper")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "050303", opName = "用户重分配销售员")
	public AjaxResult userUpdateOper(Userinfo user) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		
		userinfoService.delUsertoopuser(user.getUserid(), user.getOpuserid(), sessionuser.getCustomerid());
		userinfoService.insertUserToOpuser(user.getUserid(), user.getOpuserid(), sessionuser.getCustomerid(),null);
		return userinfoService.updateUserinfo(user);
	}
}

