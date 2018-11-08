package com.kx.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.Oper_user;

public interface Oper_userMapper extends MyMapper<Oper_user> {

	Oper_user queryByUsername(@Param("username") String username);

	List<Oper_user> queryList(@Param("oper_user")Oper_user oper_user);
	
	List<Oper_user> selectByCustomerid(@Param("customerid")String customerid);
	Oper_user selectByOperUserid(@Param("opuserid")String opuserid);
	List<String> queryRoleUids(@Param("roleid")int roleid);
	//很多商户号
	String comp_getCompno();
}