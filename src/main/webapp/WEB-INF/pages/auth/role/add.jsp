<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<form id="submitForm" class="form-horizontal">
	    <div class="form-group">
     <label class="col-sm-3 control-label" for="roleid">所属角色：</label><!--<c:if test="${role.roleid == roles.roleid}">selected</c:if> -->
		<div class="col-sm-8">
			<select class="form-control span2" id="parentid" name="parentid">
				<option value="">选择父级角色</option>
				<c:forEach items="${list}" var="rolesvo">
					<option value="${rolesvo.roleid}">${rolesvo.cname}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	 <div class="form-group">
    <label class="col-sm-3 control-label" for="types">角色类型：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="classify" name="types">
				<option value="0">超级管理员</option>
				<option value="1">管理员</option>				
				<option value="2">审核员</option>
				<option value="3">放贷财务员</option>
		</select>
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rolename"><font color="red">*</font>角色英文名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="rolename" name="rolename" placeholder="角色英文名称"/>
            <div id="validation-rolename" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="cname"><font color="red">*</font>角色名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="cname" name="cname" placeholder="角色名称" />
            <div id="validation-cname" class="validate-error help-block"></div>
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/roleadd", data);
	}
</script>