<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>审核管理</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<%@include file="../../common/top.jsp" %>
</head>
<body class="theme-default main-menu-animated">
<div class="z-loading-wrap">
     <div class="spinner">
       <img src="${ctx}/assets/images/loading2.gif" />
     </div>
     <div class="z-msg">拼命加载中...</div>
 </div>


<script src="${ctx}/assets/demo/demo.js"></script>
<script src="${ctx}/assets/js/util/lunarUtil.js"></script>
<script src="${ctx}/assets/js/util/Util.js"></script>


<div id="content-wrapper"><!--开始-->

<form class="form-horizontal" role="form" id="resetFrm">
  	<input type="hidden" value="${role.roleid}" id="roleid"/>
	<div class="form-group">
		<label class="col-sm-3 control-label" for="cname">角色名称</label>
		<div class="col-sm-8">
            <input class="form-control" type="text" value="${role.cname}" name="cname"/>
        </div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label" for="ids">用户设置</label>
		<div class="col-sm-8">
			<select multiple="multiple" size="${fn:length(users)}" name="ids" id="ids">
				<c:forEach items="${users}" var="user">
		  			<option <c:if test="${1 == user.status}">selected</c:if> value="${user.opuserid}">${user.username}</option>
		  		</c:forEach>
			</select>
		</div>
	</div>
</form>

<script type="text/javascript">
	jQuery(function($){
	    $("select[name='ids']").bootstrapDualListbox({
	    	moveAllLabel: "全部选中",
	    	removeAllLabel: "全部移除",
	    	infoTextEmpty: "没有记录",
	    	infoText: "{0}条记录",
	    	selectedListLabel: "已拥有用户",
	    	nonSelectedListLabel: "未拥有用户",
	    	showFilterInputs: false,
	    	filterPlaceHolder: "过滤",
	    	selectorMinimalHeight: 200,
	    	infoTextFiltered: "<span class='label label-purple label-lg'>Filtered</span>"
	    });
	});
	submit = function(){
		var data = "roleid=" + $("#roleid").val() + "&ids=";
		var ids = $("#ids").val();
		if(null != ids){
			data += ids;
		}
		ajaxRequest("admin/rolebindUser", data);
	}
</script>
		</div> <!-- / #content-wrapper 结束内容 -->
<%@include file="../../common/bottom.jsp" %>
</body>
</html>