package com.kx.exam.service;

import java.util.List;

import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.model.Message;
public interface MessageService {

    List<Message> selectAlls(int pageNum, int pageSize);
    Message selectById(String id);
    int insert(Message record);
    int deleteById(String id);
    //列表
    PageAjax<Message> queryPage(PageAjax<Message> page, Message message);
	AjaxResult saveMessage(Message message);


}
