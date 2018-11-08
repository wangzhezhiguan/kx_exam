<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>分配给操作员：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="opuserid" name="opuserid"">
				<c:forEach items="${list}" var="oper_user">
					<option value="${oper_user.opuserid}">${opuser.uname}(${opuser.role.rolename})</option>
				</c:forEach>
			</select>
		</div>
	</div>

    <div class="form-group">
        <label class="col-sm-3 control-label" for="uname"><font color="red">*</font>姓名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="uname" name="uname" required placeholder="请填写姓名"/>
            <div id="validation-uname" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="compname"><font color="red">*</font>单位/学校名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="compname" name="compname" required placeholder="请填写单位/学校"/>
            <div id="validation-compname" class="validate-error help-block"></div>
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
        <label class="col-sm-3 control-label" for="email">出生年月日：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="birthday" name="birthday" placeholder="请填写出生年月日" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">性别：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input checked value="1" name="sex" type="radio" class="ace"/>男♂
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="sex" type="radio" class="ace"/>女♀
				</label>
			</div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">身份证号码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="cardid" name="cardid" placeholder="请填写身份证号码" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">来源那个渠道：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="fromchannel" name="fromchannel" placeholder="请填写来源那个渠道" />
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		//var password = $("#password").val();
	//	var rePass = $("#rePass").val();
		//if(password != rePass){
		//	modalErr("两次密码不一致");
		//	return;
		//}
		//password = hex_md5(password);
		var data = $("#submitForm").serialize() ;
		ajaxRequest("admin/add", data);
	}
</script>