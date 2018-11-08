package com.kx.exam.mapper;

import java.util.List;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.AuthOperation;

public interface AuthOperationMapper extends MyMapper<AuthOperation> {
	List<AuthOperation> queryAllOpers();
}