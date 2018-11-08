package com.kx.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.mapper.AuthRoleOperationMapper;
import com.kx.exam.model.AuthRoleOperation;
@Service
public class AuthRoleOperationService extends AbstratService<AuthRoleOperation> {
	@Autowired
	private AuthRoleOperationMapper authRoleOperationMapper;
	@ServiceLog("插入权限列表")
	public void batchInsert(List<AuthRoleOperation> list){
		 authRoleOperationMapper.batchInsert(list);
	}
	@ServiceLog("删除权限列表")
	public void delRoleOpers(List<AuthRoleOperation> list){
		 authRoleOperationMapper.delRoleOpers(list);
	}

}
