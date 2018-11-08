package com.kx.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.page.PageMethod;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.common.utils.AppUtil;
import com.kx.exam.mapper.ILogMapper;

import com.kx.exam.model.ILog;

@Service
public class LogService extends AbstratService<ILog> {
	
	@Autowired
	ILogMapper ilogMapper;


}
