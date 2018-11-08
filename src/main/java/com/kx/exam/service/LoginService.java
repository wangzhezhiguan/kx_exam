package com.kx.exam.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kx.exam.common.Constant;
import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.Identity;
import com.kx.exam.common.pojo.ParamData;
import com.kx.exam.common.support.DataCache;
import com.kx.exam.common.utils.AppUtil;
import com.kx.exam.common.utils.CookieUtil;
import com.kx.exam.common.utils.DateUtil;
import com.kx.exam.common.utils.IPUtil;
import com.kx.exam.common.utils.MD5Util;
import com.kx.exam.mapper.AuthRoleMapper;
import com.kx.exam.mapper.Oper_userMapper;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.Oper_user;

/**
 * 登录管理业务层
 * @author administrator
 */
@Service
public class LoginService extends AbstratService<Oper_user> {
	@Autowired
	private Oper_userMapper userMapper;
	@Autowired
	private AuthRoleMapper roleMapper;
	@Autowired
	private DataCache dataCache;

	@ServiceLog("登录")
	public AjaxResult login(HttpServletRequest request, HttpServletResponse response) {
		String verifyCode = (String) request.getSession().getAttribute(Constant.VERIFY_CODE);
		String result = null;
		ParamData params = new ParamData();
		String vcode = params.getString("vcode");
		if (params.containsKey("vcode") && (StringUtils.isEmpty(verifyCode) || !verifyCode.equalsIgnoreCase(vcode))) {
			result = "验证码错误";
		}else{
			String username = params.getString("username");
			String loginIp = params.getString("loginIp");
			String key = username + loginIp + Constant.LOGIN_ERROR_TIMES;
			Oper_user oper_user = userMapper.queryByUsername(username);
			
			if (oper_user == null || !oper_user.getPassword().equals(params.getString("password"))) {
				int errTimes = dataCache.getInt(key);
				//记录密码错误次数,达到3次则需要输出验证码
				dataCache.setValue(key, errTimes += 1);
				result = "用户名或密码错误|" + errTimes;
			}else if(Constant.ROLE_ANONYMOUS.equals(oper_user.getRole().getRolename())){
				result = "用户未分组,无法登录";
			}else{
				// 更新登录IP和登录时间
				oper_user.setLoginip(loginIp);
				oper_user.setLogintime(DateUtil.getCurDateTime());
				userMapper.updateByPrimaryKeySelective(oper_user);
				
				Identity identity = new Identity();
				AuthRole role = roleMapper.queryRoleById(oper_user.getRoleid());

				identity.setOperationList(role.getOperations());
				identity.setLoginUser(oper_user);
				identity.setLoginIp(loginIp);
				String sessionId = getSessionId(username, identity.getLoginIp());
				identity.setSessionId(sessionId);
				dataCache.setValue(username + loginIp, identity);
				dataCache.setValue(sessionId, username);
				dataCache.remove(key);
				CookieUtil.set(Constant.SESSION_IDENTITY_KEY, sessionId, response);
			}
		}
		return AppUtil.returnObj(result);
	}

	@ServiceLog("退出")
	public AjaxResult logout(HttpServletResponse response, HttpServletRequest request) {
		String sessionId = CookieUtil.get(Constant.SESSION_IDENTITY_KEY, request);

		if (StringUtils.isNotEmpty(sessionId)) {
			dataCache.remove(sessionId);
			String userName = (String) dataCache.getValue(sessionId);
			if (StringUtils.isNotEmpty(userName)) {
				dataCache.remove(userName + IPUtil.getIpAdd(request));
			}
			CookieUtil.delete(Constant.SESSION_IDENTITY_KEY, request, response);
		}
		return AppUtil.returnObj(null);
	}

	private String getSessionId(String userName, String ip) {
		String str = userName + "_" + System.currentTimeMillis() + "_" + ip;
		try {
			return MD5Util.encrypt(str);
		} catch (Exception e) {
			return "生成token错误";
		}
	}
}
