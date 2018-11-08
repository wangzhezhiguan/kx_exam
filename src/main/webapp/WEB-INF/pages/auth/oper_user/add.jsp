<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>所属角色：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="roleid" name="roleid"">
				<c:forEach items="${list}" var="role">
					<option value="${role.roleid}">${role.cname}</option>
				</c:forEach>
			</select>
		</div>
	</div>

    <div class="form-group">
        <label class="col-sm-3 control-label" for="username"><font color="red">*</font>登录名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="username" name="username" required placeholder="请填写登录名"/>
            <div id="validation-username" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="password"><font color="red">*</font>登录密码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="password" id="password" required placeholder="请填写登录密码" />
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rePass"><font color="red">*</font>确认密码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="password" id="rePass" required placeholder="请填写确认密码" />
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="opname"><font color="red">*</font>姓名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="opname" name="opname" required placeholder="请填写姓名"/>
            <div id="validation-opname" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="mobile"><font color="red">*</font>手机号码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="mobile" name="mobile"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">电子邮箱：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="email" name="email" placeholder="请填写电子邮箱" />
        </div>
    </div>
	<div class="form-group">
        <label class="col-sm-3 control-label" for="email"><font color="red">*</font>推广微信码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="weixin" name="weixin" required placeholder="推广微信码" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">是否可用：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input checked value="1" name="useable" type="radio" class="ace"/>是
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="useable" type="radio" class="ace"/>否
				</label>
			</div>
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var password = $("#password").val();
		var rePass = $("#rePass").val();
		if(password != rePass){
			modalErr("两次密码不一致");
			return;
		}
		password = hex_md5(password);
		var data = $("#submitForm").serialize() + "&password="+password;
		ajaxRequest("admin/opadd", data);
	}
</script>