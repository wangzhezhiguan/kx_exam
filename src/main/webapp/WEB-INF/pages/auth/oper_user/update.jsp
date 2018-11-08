<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
	<input name="opuserid" value="${oper_user.opuserid}" type="text" hidden="hidden">
    <div class="form-group">
     <label class="col-sm-3 control-label" for="roleid">所属角色：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="roleid" name="roleid"">
				<c:forEach items="${list}" var="role">
					<option <c:if test="${oper_user.roleid == role.roleid}">selected</c:if> value="${role.roleid}">${role.cname}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="username">登录名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="username" name="username" value="${oper_user.username}" readonly/>
            <div id="validation-username" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="opname"><font color="red">*</font>姓名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="opname" name="opname"  value="${oper_user.opname}" required placeholder="请填写姓名"/>
            <div id="validation-opname" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="mobile"><font color="red">*</font>手机号码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="mobile" name="mobile" value="${oper_user.mobile}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email"><font color="red">*</font>电子邮箱：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="email" name="email" value="${oper_user.email}"/>
        </div>
    </div>
    	<div class="form-group">
        <label class="col-sm-3 control-label" for="email"><font color="red">*</font>推广二维码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="weixin" name="weixin" required placeholder="推广二维码" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">是否可用：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input value="1" name="useable" type="radio" class="ace" <c:if test="${1 == oper_user.useable}">checked</c:if>/>是
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="useable" type="radio" class="ace" <c:if test="${0 == oper_user.useable}">checked</c:if>/>否
				</label>
			</div>
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/opupdate", data);
	}
</script>