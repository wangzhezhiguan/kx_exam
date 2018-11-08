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
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>状态：</label>
				<div class="col-sm-8">
					<select class="form-control span2" id="ifrenzheng" name="ifrenzheng"">			
					<option <c:if test="${1==user.status}">selected</c:if> value="1">认证中</option>
					<option <c:if test="${2==user.status}">selected</c:if> value="2">认证通过</option>
					<option <c:if test="${3==user.status}">selected</c:if> value="3">需要重新认证</option>

				</div>
	</div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/userinfo/renupdate", data);
	}
</script>