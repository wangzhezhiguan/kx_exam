<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.colorSpan{
	display: inline-block;
    position: relative;
    background-color: #4f99c6 !important;
    border-color: #6fb3e0;
    height: 33px;
    text-align: center;
    line-height: 33px;
    border-radius: 3px;
    color: #fff;
    padding: 0 10px;
    cursor: pointer;
}

.colorInput{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
}
</style>
<form id="submitForm" class="form-horizontal">
	<input name="userid" value="${user.userid}" type="text" hidden="hidden">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>分配给审核员：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="opuserid" name="opuserid"">
				<c:forEach items="${list}" var="oper_user">
					<option <c:if test="${oper_user.opuserid==user.opuserid}">selected</c:if> value="${oper_user.opuserid}">${oper_user.opname}(${oper_user.role.rolename})</option>
				</c:forEach>
			</select>
		</div>
	</div>

    <div class="form-group">
        <label class="col-sm-3 control-label" for="uname"><font color="red">*</font>姓名：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="uname" name="uname" required value="${user.uname}" placeholder="请填写姓名"/>
            <div id="validation-uname" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="compname"><font color="red">*</font>单位/学校名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="compname" name="compname" value="${user.compname}" required placeholder="请填写单位/学校"/>
            <div id="validation-compname" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="mobile"><font color="red">*</font>手机号码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="mobile" name="mobile" value="${user.mobile}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">电子邮箱：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="email" name="email" value="${user.email}" placeholder="请填写电子邮箱" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">出生年月日：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="birthday" name="birthday" value="${user.birthday}" placeholder="请填写出生年月日" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">性别：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input checked value="1" <c:if test="${('1'==user.sex)||('男'==user.sex)}">selected</c:if>  name="sex" type="radio" class="ace"/>男♂
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="sex" <c:if test="${('0'==user.sex)||('女'==user.sex)}">selected</c:if>  type="radio" class="ace"/>女♀
				</label>
			</div>
        </div>
    </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>状态：</label>
				<div class="col-sm-8">
					<select class="form-control span2" id="status" name="status"">
					<option <c:if test="${0==user.status}">selected</c:if> value="0">审核中</option>
					<option <c:if test="${1==user.status}">selected</c:if> value="1">已通过</option>
					<option <c:if test="${2==user.status}">selected</c:if> value="2">业务员维护中</option>
					<option <c:if test="${4==user.status}">selected</c:if> value="4">审核分配中</option>
					<option <c:if test="${5==user.status}">selected</c:if> value="5">待审经理批准</option>
					<option <c:if test="${6==user.status}">selected</c:if> value="6">二次审核中</option>
					<option <c:if test="${7==user.status}">selected</c:if> value="7">待维护老客户</option>
					<option <c:if test="${8==user.status}">selected</c:if> value="8">已弃用</option>
					<option <c:if test="${9==user.status}">selected</c:if> value="9">停用</option>
				</div>
	</div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">身份证号码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="cardid" name="cardid" value="${user.cardid}" placeholder="请填写身份证号码" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">来源那个渠道：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="fromchannel" name="fromchannel" value="${user.fromchannel}" placeholder="请填写来源那个渠道" />
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/userUpdateOper", data);
	}
</script>