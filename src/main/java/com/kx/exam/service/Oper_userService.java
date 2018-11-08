package com.kx.exam.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.page.PageMethod;
import com.kx.exam.common.Constant;
import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.common.support.DataCache;
import com.kx.exam.common.utils.AppUtil;
import com.kx.exam.common.utils.CookieUtil;
import com.kx.exam.common.utils.DateUtil;
import com.kx.exam.common.utils.IPUtil;
import com.kx.exam.mapper.AuthRoleMapper;
import com.kx.exam.mapper.Oper_userMapper;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.Oper_user;

@Service
public class Oper_userService extends AbstratService<Oper_user> {

	@Autowired
	private Oper_userMapper userMapper;
	@Autowired
	private AuthRoleMapper roleMapper;
	@Autowired
	private DataCache dataCache;
	
	public void saveRole(AuthRole authRole){
		roleMapper.insertRole(authRole);
	}
	public void addRoleOperation(String roleid,String ifoper){
		roleMapper.insertAuth_role_operation(roleid, ifoper);
	}

	@Override
	@ServiceLog("查询用户列表")
	public PageAjax<Oper_user> queryPage(PageAjax<Oper_user> page, Oper_user oper_user) {
		PageMethod.startPage(page.getPageNo(), page.getPageSize());
		List<Oper_user> list = userMapper.queryList(oper_user);
		return AppUtil.returnPage(list);
	}

	@ServiceLog("添加用户")
	public AjaxResult saveUser(Oper_user oper_user) {
		String result = null;
		Oper_user $user = userMapper.queryByUsername(oper_user.getUsername());
		if (null == $user) {
			oper_user.setAddtime(DateUtil.getCurDateTime());
			save(oper_user);
		} else {
			result = "用户名已存在";
		}
		return AppUtil.returnObj(result);
	}

	@ServiceLog("修改用户")
	public AjaxResult updateUser(Oper_user user) {
		String result = null;
		Oper_user $user = userMapper.queryByUsername(user.getUsername());
		if (null != $user && !$user.getOpuserid().equalsIgnoreCase(user.getOpuserid())) {
			result = "用户名已存在";
		} else {
			updateByID(user);
		}
		return AppUtil.returnObj(result);
	}

	@ServiceLog("修改个人密码")
	public AjaxResult updatePwd(HttpServletResponse response, HttpServletRequest request, String opuserid, String oldPwd, String newPwd) {
		Oper_user oper_user = null;
		if(StringUtils.isNotEmpty(oldPwd)){
			oper_user = queryByID(opuserid);
			if(!oldPwd.equals(oper_user.getPassword())){
				return new AjaxResult(0, "旧密码不正确");
			}
		}
		oper_user = new Oper_user();
		oper_user.setOpuserid(opuserid);
		oper_user.setPassword(newPwd);
		int ret = userMapper.updateByPrimaryKeySelective(oper_user);
		if(ret > 0){
			String sessionId = CookieUtil.get(Constant.SESSION_IDENTITY_KEY, request);
			if (StringUtils.isNotEmpty(sessionId)) {
				dataCache.remove(sessionId);
				String userName = (String) dataCache.getValue(sessionId);
				if (StringUtils.isNotEmpty(userName)) {
					dataCache.remove(userName + IPUtil.getIpAdd(request));
				}
				CookieUtil.delete(Constant.SESSION_IDENTITY_KEY, request, response);
			}
		}
		return new AjaxResult(1, "修改成功");
	}

	@ServiceLog("查询用户列表")
	public List<Oper_user> queryRoleUsers(String roleid) {
		Oper_user oper_user = new Oper_user();
		oper_user.setRoleid(roleid);
		return userMapper.select(oper_user);
	}

	@ServiceLog("角色绑定用户")
	public AjaxResult bindUser(int roleid, String[] ids,String customerid) {
		AuthRole role = roleMapper.queryByRolename(Constant.ROLE_ANONYMOUS);
		//剔除的用户
		List<Map<String, String>> userList = new ArrayList<Map<String, String>>();
		Map<String, String> user = null;
		//该角色原拥有的用户
		List<String> opuserids = userMapper.queryRoleUids(roleid);
		for(String id: opuserids){
			if(!Arrays.asList(ids).contains(id)){
				user = new HashMap<String, String>();
				user.put("opuserid", id);
				user.put("roleid", role.getRoleid()+"");
				userList.add(user);
			}
		}
		dao.batchUpdate("Oper_userMapper.bindUser", userList);
		//新增的用户
		userList = new ArrayList<Map<String, String>>();
		for(String id: ids){
			user = new HashMap<String, String>();
			user.put("opuserid", id);
			user.put("roleid", roleid+"");
			userList.add(user);
		}
		dao.batchUpdate("Oper_userMapper.bindUser", userList);
		return AppUtil.returnObj(null);
	}
	@ServiceLog("通过商户号获得操作员信息")
	public List<Oper_user> selectByCustomerid(String customerid){
		return userMapper.selectByCustomerid(customerid);
	}
	@ServiceLog("通过ID获得对象")
	public Oper_user selectByOperUserid(String opuserid){
		return userMapper.selectByOperUserid(opuserid);
	}
	@ServiceLog("获得商户号")
	public String comp_getCompno() {
		return userMapper.comp_getCompno();
	}
}
