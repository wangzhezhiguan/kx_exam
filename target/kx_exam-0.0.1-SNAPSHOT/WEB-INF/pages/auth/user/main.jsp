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
    <title>管理员管理</title>
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
		<input type="text" class="form-control search-query" name="username" placeholder="管理员名称">
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
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加管理员', 'admin/opaddPage');"><span class="btn-label icon fa fa-plus"></span>添加用户</button>
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
                //{field:"opuserid",text:"用户ID", sortColumn:"opuserid"},
                {field:"username", text:"登录名"},
                {field:"opname", text:"姓名"},
                {field:"role.cname", text:"所属角色", sortColumn:"roleid"},
                {field:"email", text:"电子邮箱"},
                {field:"mobile", text:"手机号码"},{field:"belongto", text:"所属"},
                {field:"useable", text:"是否可用",formatter:function(index, content, data){
                    return content == 1 ? "<font color='blue'>可用</font>" : "<font color='red'>禁用</font>";
                }},
                {field:"loginip", text:"最后登录IP"},
                {field:"logintime", text:"最后登陆时间"},
                {field:"addtime", text:"创建时间"},
                {field:"opuserid", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
                	if("admin" == data.username){
                		return "禁止操作超级管理员";
                	}else{
	                    var editUrl = "admin/opupdatePage/" + content;
	                    var resetPwd = "admin/opupdatePwdPage?opuserid=" + content;
	                    var delUrl = "admin/opdeleteByID/" + content;
	                    return "<a href='javascript:showModal(\"更新用户\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
	                        + "&nbsp;<a href='javascript:showModal(\"重置密码\", \""+resetPwd+"\");' data-original-title='重置密码' class='btn btn-xs btn-success add-tooltip'><i class='fa fa-repeat'>重置密码</i></a>"
	                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");'  data-original-title='删除' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>";
                	}
                }}
            ],
            cls: "",
            url: _urlPath + "admin/opqueryPage",
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