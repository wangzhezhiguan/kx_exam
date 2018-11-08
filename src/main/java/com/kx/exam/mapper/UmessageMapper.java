package com.kx.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.Umessage;

public interface UmessageMapper   extends MyMapper<Umessage> {
	List<Umessage> queryList(@Param("umessage")Umessage umessage);
	
    int deleteByIds(@Param("messageid") String messageid);

    int insert(Umessage record);

    Umessage selectById(@Param("messageid") String messageid);

    List<Umessage> selectAlls(@Param("userid") String userid);

    int updateById(Umessage record);
    Integer sp_createRandom(@Param("loginName") String loginName);
}