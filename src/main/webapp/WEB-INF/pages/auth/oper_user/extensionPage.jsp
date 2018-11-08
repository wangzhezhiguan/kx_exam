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
    <title>业务员推广管理</title>
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
<div id="main-wrapper" style="vertical-align: unset;">
<%@include file="../../common/navigation.jsp" %>
<%@include file="../../common/menuControl.jsp" %>
<div id="content-wrapper"><!--开始-->
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="username" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="roleid" onchange="javascript:formSubmit();">
			<option value="">==所属角色==</option>
			<c:forEach items="${list}" var="role">
				<option value="${role.roleid}">${role.cname}</option>
			</c:forEach>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加用户', 'admin/opaddPage');"><span class="btn-label icon fa fa-plus"></span>添加用户</button>
    </div>
  </div>
</div>
<div class="openAppGrid">
	<div id="openAppGrid"></div>
</div>
<script type="text/javascript">
    $(function (){
        $("#openAppGrid").sgrid({
        	rownumbers: true,
            columns:[
      
                {field:"username", text:"登录名"},
                {field:"opname", text:"姓名"},
                {field:"role.cname", text:"所属角色", sortColumn:"roleid"},
                {field:"qrcode", text:"推广二维码",formatter:function(index, content, data){
                    return "<img src='${publicurl}"+content+"' width='42px' height='42px' onclick=\"showdialog('${publicurl}"+content+"','560','550');\"/>";
                }},
                {field:"opuserid", text:"推广页面",formatter:function(index, content, data){
                    return "${publicurl}invitelogin.jsp?uid="+content+"&customerid=${loginUser.customerid}";
                }}
                
            ],
            cls: "",
            url: _urlPath + "admin/extensionqueryPage",
            sort:"id",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
</script>
		</div> <!-- / #content-wrapper 结束内容 -->
	<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->
<%@include file="../../common/bottom.jsp" %>
</body>
</html>