package com.kx.exam.mapper;

import java.util.List;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.AuthRoleOperation;

public interface AuthRoleOperationMapper extends MyMapper<AuthRoleOperation> {

	void batchInsert(List<AuthRoleOperation> list);

	void delRoleOpers(List<AuthRoleOperation> list);
}