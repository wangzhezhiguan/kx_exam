package com.kx.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.page.PageMethod;
import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.common.utils.AppUtil;
import com.kx.exam.mapper.MessageMapper;
import com.kx.exam.model.Message;
import com.kx.exam.service.MessageService;

@Service(value = "messageService")
@Transactional
public class MessageServiceImpl implements MessageService{
	
	public  MessageServiceImpl() {
		System.out.println( "MessageServiceImpl created" );
	}	
	@Autowired
	protected MessageMapper messageMapper ;
	@ServiceLog("消息列表")
	public PageAjax<Message> queryPage(PageAjax<Message> page, Message message) {
		PageMethod.startPage(page.getPageNo(), page.getPageSize());
		List<Message> list = messageMapper.queryList(message);
		return AppUtil.returnPage(list);
	}

	@ServiceLog("消息产品")
	public AjaxResult saveMessage(Message message) {
		messageMapper.insert(message);	
		return AppUtil.returnObj(null);
	}

	@Override
	public List<Message> selectAlls(int pageNum, int pageSize) {
		//使用分页插件,核心代码就这一行
        PageHelper.startPage(pageNum, pageSize);
		return messageMapper.selectAlls();
	}

	@Override
	public Message selectById(String id) {
		return messageMapper.selectByIds(id) ;
	}
	
	@Override
	@Transactional(propagation = Propagation.NESTED)
	public int insert(Message record) {
		return messageMapper.insert(record);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED )
	public int deleteById(String id) {
		return messageMapper.deleteByIds(id) ;
	}


}
