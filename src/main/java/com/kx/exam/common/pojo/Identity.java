package com.kx.exam.common.pojo;

import java.util.List;

import com.kx.exam.model.AuthOperation;
import com.kx.exam.model.Oper_user;
import com.kx.exam.model.Userinfo;

/**
 * 封装Session
 * @author administrator
 */
public class Identity {
	private String sessionId;
	private String loginIp;
	private Oper_user loginUser;
	private List<AuthOperation> operationList;
	private String uuserid;
	private Userinfo uuserinfo;
	
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Oper_user getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(Oper_user loginUser) {
		this.loginUser = loginUser;
	}
	public List<AuthOperation> getOperationList() {
		return operationList;
	}
	public void setOperationList(List<AuthOperation> operationList) {
		this.operationList = operationList;
	}
	public String getUuserid() {
		return uuserid;
	}
	public Userinfo getUuserinfo() {
		return uuserinfo;
	}
	public void setUuserid(String uuserid) {
		this.uuserid = uuserid;
	}
	public void setUuserinfo(Userinfo uuserinfo) {
		this.uuserinfo = uuserinfo;
	}

}
