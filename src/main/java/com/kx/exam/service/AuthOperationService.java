package com.kx.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.mapper.AuthOperationMapper;
import com.kx.exam.model.AuthOperation;
@Service
public class AuthOperationService extends AbstratService<AuthOperation> {
	@Autowired
	private AuthOperationMapper authOperationMapper;
	@ServiceLog("获得功能列表")
	public List<AuthOperation> queryAllOpers(){
		return authOperationMapper.queryAllOpers();
	}

}
