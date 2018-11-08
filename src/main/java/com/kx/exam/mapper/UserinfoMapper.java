package com.kx.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kx.exam.common.dao.MyMapper;
import com.kx.exam.model.Userinfo;


public interface UserinfoMapper  extends MyMapper<Userinfo> {
	List<Userinfo> queryList(@Param("userinfo")Userinfo userinfo);
	List<Userinfo> queryListOper(@Param("userinfo")Userinfo userinfo);
	
    int deleteById(@Param("userid") String userid);


   // int insert(Userinfo record);

    Userinfo selectById(@Param("userid") String userid);
	Userinfo userlogin(@Param("loginname") String loginname);
    
    List<Userinfo> selectByCustomerid(@Param("customerid") String customerid);
    //审核页面
    List<Userinfo> shenqueryList(@Param("userinfo")Userinfo userinfo);

    List<Userinfo> selectAlls();

    int updateuserinfo(@Param("userinfo") Userinfo userinfo);
    int updateById(Userinfo record);
    int updateByStatusId(Userinfo record);

	//用户与企业的关联
	void insertUserToOpuser(@Param("userid") String userid,@Param("opuserid") String opuserid,@Param("customerid") String customerid,@Param("productid") String productid);
	//修改审核员
    int delUsertoopuser(@Param("userid") String userid,@Param("opuserid") String opuserid,@Param("customerid") String customerid);
    Userinfo selectUsertopuser(@Param("userid") String userid);
}