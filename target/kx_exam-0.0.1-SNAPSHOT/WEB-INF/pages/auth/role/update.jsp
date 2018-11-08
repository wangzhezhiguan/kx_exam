<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
	<input name="roleid" value="${role.roleid}" type="text" hidden="hidden">
	    <div class="form-group">
     <label class="col-sm-3 control-label" for="roleid">所属角色：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="parentid" name="parentid"">
				<c:forEach items="${list}" var="roles">
					<option <c:if test="${role.roleid == roles.roleid}">selected</c:if> value="${roles.parentid}">${roles.cname}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	 <div class="form-group">
    <label class="col-sm-3 control-label" for="types">角色类型：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="classify" name="types">
				<option value="0" <c:if test="${role.types == 0}">selected</c:if>>超级管理员</option>
				<option value="1" <c:if test="${role.types == 1}">selected</c:if>>管理员</option>				
				<option value="2" <c:if test="${role.types == 2}">selected</c:if>>审核员</option>
				<option value="3" <c:if test="${role.types == 3}">selected</c:if>>放贷财务员</option>
		</select>
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rolename"><font color="red">*</font>角色英文名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="rolename" name="rolename" value="${role.rolename}"/>
            <div id="validation-rolename" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="cname"><font color="red">*</font>角色名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="cname" name="cname" value="${role.cname}"/>
            <div id="validation-cname" class="validate-error help-block"></div>
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/roleupdate", data);
	}
</script>