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
<%@include file="../common/top.jsp" %>
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
<div id="main-wrapper" style="vertical-align: unset;">
<%@include file="../common/navigation.jsp" %>
<%@include file="../common/menuControl.jsp" %>
<div id="content-wrapper">
	<div class="col-sm-3 panel panel-success" style="padding: unset;">
		<div class="panel-heading">
			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">管理员信息</a></h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body" style="padding: unset; margin: unset">
				<table class="table-condensed" style="padding: unset; margin: unset">
					<tr class="active"><td class="text-right">管理员：</td><td>${loginUser.username}</td></tr>
					<tr class="active"><td class="text-right">角　色：</td><td>${loginUser.role.cname}</td></tr>
					<tr class="active"><td class="text-right">电子邮箱：</td><td>${loginUser.email}</td></tr>
					<tr class="active"><td class="text-right">最后登录IP：</td><td>${loginUser.loginip}</td></tr>
					<tr class="active"><td class="text-right">最后登录时间：</td><td>${loginUser.logintime}</td></tr>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->
<%@include file="../common/bottom.jsp" %>
</body>
</html>