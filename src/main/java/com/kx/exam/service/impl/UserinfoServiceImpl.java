package com.kx.exam.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
import com.kx.exam.mapper.UserinfoMapper;
import com.kx.exam.model.Userinfo;

import com.kx.exam.service.AbstratService;
import com.kx.exam.service.UserinfoService;

@Service(value = "userinfoService")
@Transactional
public class UserinfoServiceImpl extends AbstratService<Userinfo> implements UserinfoService{
	
	public  UserinfoServiceImpl() {
		System.out.println( "UserinfoServiceImpl created" );
	}
	
	@Autowired
	protected UserinfoMapper userinfoMapper ;
	@Override
	@ServiceLog("商户进件列表")
	public PageAjax<Userinfo> queryPage(PageAjax<Userinfo> page, Userinfo userinfo) {
		PageMethod.startPage(page.getPageNo(), page.getPageSize());
		List<Userinfo> list = userinfoMapper.queryList(userinfo);
		return AppUtil.returnPage(list);
	}
	@Override
	@ServiceLog("管理员下商户进件列表")
	public PageAjax<Userinfo> queryListOper(PageAjax<Userinfo> page, Userinfo userinfo){
		PageMethod.startPage(page.getPageNo(), page.getPageSize());
		List<Userinfo> list = userinfoMapper.queryListOper(userinfo);
		return AppUtil.returnPage(list);
	}
	@ServiceLog("添加客户")
	public AjaxResult saveUserinfo(Userinfo userinfo) {
		userinfoMapper.insert(userinfo);	
		return AppUtil.returnObj(null);
	}

	@ServiceLog("修改客户")
	public AjaxResult updateUserinfo(Userinfo userinfo) {
		String result = null;	
		/*Userinfo old=userinfoMapper.selectById(userinfo.getWorkOrderid());
		if(userinfo.getPic()==null||userinfo.getPic().equals("")) {
			userinfo.setPic(old.getPic());
		}
		if(userinfo.getStatus()==null||userinfo.getStatus().equals("")) {
			userinfo.setStatus(old.getStatus());
		}*/
		userinfoMapper.updateuserinfo(userinfo);		
		return AppUtil.returnObj(result);
	}
	public List<Userinfo> selectAll(int pageNum, int pageSize) {
		//使用分页插件,核心代码就这一行
        PageHelper.startPage(pageNum, pageSize);
		return userinfoMapper.selectAlls();
	}

	@Override
	public Userinfo selectById(String id){
		return userinfoMapper.selectById(id) ;
	}
	@Override
	public Userinfo userlogin(String loginname){
		return userinfoMapper.userlogin(loginname) ;
	}
	@Override
	public List<Userinfo> selectByCustomerid(String customerid) {
		return userinfoMapper.selectByCustomerid(customerid);
	}



	@Override
	public int updateById(Userinfo record) {
		return userinfoMapper.updateById(record) ;
	}
	
	@Override
	@Transactional(propagation = Propagation.NESTED)
	public int insert(Userinfo record) {
		return userinfoMapper.insert(record);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED )
	public int deleteById(String workOrderid) {
		return userinfoMapper.deleteByPrimaryKey(workOrderid) ;
	}

	public void insertUserToOpuser(String userid,String opuserid,String customerid,String productid){
		// TODO Auto-generated method stub
		userinfoMapper.insertUserToOpuser(userid, opuserid, customerid,productid);
	}
	//修改审核员
	public int delUsertoopuser(String userid,String opuserid,String customerid) {
		return userinfoMapper.delUsertoopuser(userid, opuserid, customerid);
	}
	public Userinfo selectUsertopuser(String userid) {
		return userinfoMapper.selectUsertopuser(userid);
	}
}
