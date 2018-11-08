package com.kx.exam.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kx.exam.common.annotation.Authority;
import com.kx.exam.common.annotation.ControllerLog;
import com.kx.exam.common.pojo.AjaxResult;
import com.kx.exam.common.pojo.PageAjax;
import com.kx.exam.model.AuthOperation;
import com.kx.exam.model.AuthRole;
import com.kx.exam.model.Oper_user;
import com.kx.exam.service.RoleService;
import com.kx.exam.service.Oper_userService;

@Controller
@RequestMapping("/admin/")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private Oper_userService oper_userService;

	@Authority(ifOper = "0",opCode = "0102", opName = "角色管理界面")
	@RequestMapping("rolemainPage")
	public String rolemainPage() {
		return "auth/role/main";
	}

	@ControllerLog("查询角色列表")
	@RequestMapping("rolequeryPage")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "0102", opName = "查询角色列表")
	public PageAjax<AuthRole> rolequeryPage(PageAjax<AuthRole> page, AuthRole role) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		role.setCustomerid(sessionuser.getCustomerid());
		return roleService.queryPage(page, role);
	}

	@Authority(ifOper = "0",opCode = "010201", opName = "添加角色页面")
	@RequestMapping("roleaddPage")
	public String addPage(Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		System.out.println("============="+alllist.size());
	
		map.put("list", alllist);
		return "auth/role/add";
	}

	@ControllerLog("添加角色")
	@RequestMapping("roleadd")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010201", opName = "添加角色")
	public AjaxResult roleadd(AuthRole role) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		role.setRoleid(this.getUuid());
		role.setCustomerid(sessionuser.getCustomerid());
		role.setCompid(sessionuser.getCompid());
		return roleService.saveRole(role);
	}

	@Authority(ifOper = "0",opCode = "010202", opName = "更新角色页面")
	@RequestMapping("roleupdatePage/{id}")
	public String roleupdatePage(@PathVariable("id") int id, Map<String, Object> map) {
		List<AuthRole> alllist = new ArrayList();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		//把角色传出去到页面渲染
		List<AuthRole> list = roleService.rootRolelist(sessionuser.getCustomerid());
		for(AuthRole vof:list) {
			alllist.add(vof);
			roleService.dotree(alllist, vof.getRoleid(), sessionuser.getCustomerid(), 1);
		}
		map.put("list", alllist);
		AuthRole role = roleService.queryByID(id);
		map.put("role", role);
		return "auth/role/update";
	}

	@ControllerLog("修改角色")
	@RequestMapping("roleupdate")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010202", opName = "修改角色")
	public AjaxResult roleupdate(AuthRole role) {
		return roleService.updateRole(role);
	}

	@ControllerLog("删除角色")
	@RequestMapping("roledeleteByID/{id}")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010203", opName = "删除角色")
	public AjaxResult roledeleteByID(@PathVariable("id") int id) {
		return roleService.deleteByID(id);
	}

	@Authority(ifOper = "0",opCode = "010204", opName = "角色用户管理页面")
	@RequestMapping("rolebindUserPage/{roleid}")
	public String rolebindUserPage(@PathVariable("roleid")String roleid, Map<String, Object> map) {
		AuthRole role = roleService.queryByID(roleid);
        map.put("role", role);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 读取session中的用户
		Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		Oper_user u= new Oper_user();
		u.setCustomerid(sessionuser.getCustomerid());
        List<Oper_user> users = oper_userService.queryList(u);
        List<Oper_user> hasUsers = oper_userService.queryRoleUsers(roleid);
        List<String> usernames = new ArrayList<String>();
        for(Oper_user oper_user: hasUsers){
        	usernames.add(oper_user.getUsername());
        }
        for (Oper_user oper_user : users) {
            if (usernames.contains(oper_user.getUsername())) {
            	oper_user.setStatus(1);
            }
        }
        map.put("users", users);
		return "auth/role/role_user";
	}

	@ControllerLog("角色绑定用户")
	@RequestMapping("rolebindUser")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010204", opName = "角色绑定用户")
	public AjaxResult rolebindUser(int roleid, String[] ids) {
	    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			// 读取session中的用户
			Oper_user sessionuser = (Oper_user) request.getAttribute("loginUser");
		return oper_userService.bindUser(roleid, ids,sessionuser.getCustomerid());
	}

	@Authority(ifOper = "0",opCode = "010205", opName = "角色权限管理页面")
	@RequestMapping("rolebindOperPage/{roleid}")
	public String rolebindOperPage(@PathVariable("roleid")String roleid, Map<String, Object> map) {
		HttpServletRequest request = getRequest();
		// 当前登录的用户
		Oper_user loginUser = (Oper_user) request.getAttribute("loginUser");
		List<AuthRole> roleList = roleService.queryNotAdmin(loginUser.getCustomerid());
		map.put("roleList", roleList);
		

		// 当前登录用户所属角色
		AuthRole loginRole = roleService.queryRoleById(loginUser.getRoleid());
		// 当前用户拥有的权限
		List<AuthOperation> operationList = loginRole.getOperations();
		map.put("operationList", operationList);
		
		// 角色拥有的权限
		List<AuthOperation> hasOperations = null;
		AuthRole role = roleService.queryRoleById(roleid);
		if (role != null) {
			hasOperations = role.getOperations();
		}

		// 角色没有的权限
		List<AuthOperation> noOperations = new ArrayList<AuthOperation>();
		for (AuthOperation operation : operationList) {
			if (!hasOperations.contains(operation)) {
				noOperations.add(operation);
			}
		}
		map.put("hasCount", hasOperations.size());
		map.put("noCount", noOperations.size());
		map.put("roleid", roleid);
		
		return "auth/role/opers_role";
	}

	@Authority(ifOper = "0",opCode = "010206", opName = "角色已绑定权限")
    @RequestMapping("rolehasOpers/{roleid}")
    public String rolehasOpers(Map<String, Object> map, @PathVariable("roleid") String roleid, @RequestParam(defaultValue = "") String opname) {
		List<AuthOperation> hasOperations = new ArrayList<AuthOperation>();
		AuthRole role = roleService.queryRoleById(roleid);
		if (role != null) {
			//选择角色拥有的权限
			List<AuthOperation> operationList = role.getOperations();
			if (operationList != null) {
				// 筛选条件
				if (StringUtils.isNotEmpty(opname)) {
					for (AuthOperation operation : operationList) {
						if (operation.getOpcode().contains(opname) || operation.getOpcode().contains(opname)) {
							hasOperations.add(operation);
						}
					}
				} else {
					hasOperations = operationList;
				}
			}
		}
		//排序
		Collections.sort(hasOperations, new Comparator<AuthOperation>() {
			@Override
			public int compare(AuthOperation o1, AuthOperation o2) {
				return o1.getOpcode().compareTo(o2.getOpcode());
			}
		});
		map.put("hasOperations", hasOperations);
        map.put("roleid", roleid);
        map.put("opname", opname);
        return "auth/role/opers_has";
    }

	@ControllerLog("绑定角色权限")
	@RequestMapping("rolebindOpers")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010205", opName = "绑定角色权限")
	public AjaxResult rolebindOpers(String roleid, int[]opids) {
		return roleService.bindOpers(roleid, opids);
	}
	
	@Authority(ifOper = "0",opCode = "010206", opName = "角色未绑定权限")
	@RequestMapping("rolenoOpers/{roleid}")
	public String rolenoOpers(Map<String, Object> map, @PathVariable("roleid") String roleid, @RequestParam(defaultValue = "") String opname) {
		HttpServletRequest request = getRequest();
		// 当前登录的用户
		Oper_user loginUser = (Oper_user) request.getAttribute("loginUser");
		// 当前登录用户所属角色
		AuthRole loginRole = roleService.queryRoleById(loginUser.getRoleid());
		// 当前用户拥有的权限
		List<AuthOperation> operationList = loginRole.getOperations();
		
		//选择角色拥有的权限
		AuthRole role = roleService.queryRoleById(roleid);
		List<String> opersCode = new ArrayList<String>();
		if (role != null) {
			List<AuthOperation> hasOperations = role.getOperations();
			for(AuthOperation operation : hasOperations){
				opersCode.add(operation.getOpcode());
			}
		}
		
		List<AuthOperation> noOperations = new ArrayList<AuthOperation>();
		//剔除角色拥有的权限
		for (AuthOperation operation : operationList) {
			if (!opersCode.contains(operation.getOpcode())) {
				// 搜索条件
				if (StringUtils.isNotEmpty(opname)) {
					if (operation.getOpname().contains(opname) || operation.getOpcode().contains(opname)) {
						noOperations.add(operation);
					}
				} else {
					noOperations.add(operation);
				}
			}
		}
		//排序
		Collections.sort(noOperations, new Comparator<AuthOperation>() {
			@Override
			public int compare(AuthOperation o1, AuthOperation o2) {
				return o1.getOpcode().compareTo(o2.getOpcode());
			}
		});
		map.put("noOperations", noOperations);
        map.put("roleid", roleid);
        map.put("opname", opname);
		return "auth/role/opers_no";
	}

	@ControllerLog("解除角色权限")
	@RequestMapping("roleunbindOpers")
	@ResponseBody
	@Authority(ifOper = "0",opCode = "010206", opName = "解除角色权限")
	public AjaxResult roleunbindOpers(String roleid, int[]opids) {
		return roleService.unbindOpers(roleid, opids);
	}
}
