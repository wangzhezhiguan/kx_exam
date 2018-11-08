package com.kx.exam.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kx.exam.common.annotation.ServiceLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.utils.AppUtil;
import com.kx.exam.mapper.AuthRoleMapper;
import com.kx.exam.mapper.AuthRoleOperationMapper;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.AuthRoleOperation;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class RoleService extends AbstratService<AuthRole> {

	@Autowired
	private AuthRoleMapper roleMapper;
	@Autowired
	private AuthRoleOperationMapper roleOperMapper;
	
	public AuthRole queryRoleById(String roleid){
		return roleMapper.queryRoleById(roleid);
	}

	@ServiceLog("新增角色")
	public AjaxResult saveRole(AuthRole role) {
		String result = null;
		AuthRole $role = new AuthRole();
		if(role.getCustomerid()==null||role.getCustomerid().equals(""))
			$role = roleMapper.queryByRolename(role.getRolename());
		else
			$role = roleMapper.queryByRolename1(role.getRolename(),role.getCustomerid());
		if (null == $role) {
			save(role);
			roleMapper.insertAuth_role_operation(role.getRoleid(), "0");
		} else {
			result = "角色名已存在";
		}
		return AppUtil.returnObj(result);
	}

	@ServiceLog("更新角色")
	public AjaxResult updateRole(AuthRole role) {
		String result = null;
		AuthRole $role = new AuthRole();
		if(role.getCustomerid()==null||role.getCustomerid().equals(""))
			$role = roleMapper.queryByRolename(role.getRolename());
		else
			$role = roleMapper.queryByRolename1(role.getRolename(),role.getCustomerid());
		if (null != $role && $role.getRoleid() != role.getRoleid()) {
			result = "角色名已存在";
		} else {
			updateByID(role);
		}
		return AppUtil.returnObj(result);
	}

	public List<AuthRole> queryNotAdmin(String customerid) {
		Example example = new Example(AuthRole.class);
		Criteria criteria = example.createCriteria();
		criteria.andNotEqualTo("rolename", "admin");
		criteria.andEqualTo("customerid",customerid);
		return roleMapper.selectByExample(example);
	}

	@ServiceLog("绑定角色权限")
	public AjaxResult bindOpers(String roleid, int[] opids) {
		List<AuthRoleOperation> list = new ArrayList<AuthRoleOperation>();
		AuthRoleOperation roleOperation = null;
		for(int opid: opids){
			roleOperation = new AuthRoleOperation();
			roleOperation.setRoleid(roleid);
			roleOperation.setOpid(opid);
			list.add(roleOperation);
		}
		//通用mapper的批量插入竟然不行
//		roleOperMapper.insertList(list);
		roleOperMapper.batchInsert(list);
		return AppUtil.returnObj(null);
	}

	@ServiceLog("解除角色权限")
	public AjaxResult unbindOpers(String roleid, int[] opids){
		List<AuthRoleOperation> list = new ArrayList<AuthRoleOperation>();
		AuthRoleOperation roleOperation = null;
		for(int opid: opids){
			roleOperation = new AuthRoleOperation();
			roleOperation.setRoleid(roleid);
			roleOperation.setOpid(opid);
			list.add(roleOperation);
		}
		roleOperMapper.delRoleOpers(list);
		return AppUtil.returnObj(null);
	}
	//所有父级
	public List<AuthRole> rootRolelist(String customerid){
			return roleMapper.rootRolelist(customerid);
		}
		//所有子级
	public List<AuthRole> childRolelist(String roleid,String customerid){
			return roleMapper.childRolelist(roleid, customerid);
	}
	public List<AuthRole> dotree(List<AuthRole> list,String roleid,String customerid,int i){
		List<AuthRole> listc = childRolelist(roleid, customerid);
		
		if(listc!=null) {
			if(listc.size()>0) {
				for(AuthRole voc:listc) {
					String s="";
					for(int n = 0;n<i;n++)
						s = s+"&emsp;";
					voc.setCname(s+"∟"+voc.getCname());
					list.add(voc);
					dotree(list,voc.getRoleid(),customerid,i+1);
				}
			}
		}
		return null;
	}

}
