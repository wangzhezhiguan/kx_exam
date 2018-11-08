package com.kx.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.Message;

public interface MessageMapper  extends MyMapper<Message> {
	List<Message> queryList(@Param("message")Message message);
    int deleteByIds(String messageid);
    int inserts(Message record);
    Message selectByIds(String messageid);

    List<Message> selectAlls();

    int updateByIds(Message record);
}