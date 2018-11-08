package com.kx.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.model.Userinfo;
@Service
public interface UserinfoService {
	int updateById(Userinfo record);
    List<Userinfo> selectAll(int pageNum, int pageSize);
    Userinfo selectById(String id);
	Userinfo userlogin(String loginname);
    List<Userinfo> selectByCustomerid(String customerid);
    int insert(Userinfo record);
    int deleteById(String workOrderid);
    //列表
    PageAjax<Userinfo> queryPage(PageAjax<Userinfo> page, Userinfo userinfo);
    PageAjax<Userinfo> queryListOper(PageAjax<Userinfo> page, Userinfo userinfo);
	AjaxResult saveUserinfo(Userinfo userinfo);
	AjaxResult updateUserinfo(Userinfo userinfo) ;

	void insertUserToOpuser(String userid,String opuserid,String customerid,String productid);
	//修改审核员
    int delUsertoopuser(String userid,String opuserid,String customerid);
    Userinfo selectUsertopuser(String userid);
}
