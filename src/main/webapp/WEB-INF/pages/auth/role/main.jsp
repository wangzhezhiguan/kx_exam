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
<div id="main-wrapper" style="vertical-align: unset;">
<%@include file="../../common/navigation.jsp" %>
<%@include file="../../common/menuControl.jsp" %>
<div id="content-wrapper"><!--开始-->
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加角色', 'admin/roleaddPage', 450);"><span class="btn-label icon fa fa-plus"></span>添加角色</button>
    </div>
  </div>
</div>
<div class="openAppGrid">
	<div id="openAppGrid"></div>
</div>
<script type="text/javascript">
    $(function (){
        $("#openAppGrid").sgrid({
            columns:[
                {field:"roleid",text:"角色ID", sortColumn:"roleid"},
                {field:"rolename", text:"角色英文名"},
                {field:"cname", text:"角色名称"},
                {field:"frole.cname", text:"所属父级", sortColumn:"parentid"},
                {field:"types", text:"角色类型", style:"text-align:center", formatter:function(index, content, data){
          					if(content==0)
                    	return "&nbsp;<font color='green'>超级管理员</font>";
                    else if(content==1)
                    	return "&nbsp;<font color='green'>管理员</font>";
                    else if(content==2)
                    	return "&nbsp;<font color='green'>审核员</font>";
                    else if(content==3)
                    	return "&nbsp;<font color='green'>放款员</font>";
                }},
                {field:"roleid", text:"操作", style:"text-align:center", formatter:function(index, content, data){
                    var editUrl = "admin/roleupdatePage/" + content;
                    var delUrl = "admin/roledeleteByID/" + content;
										var roleUserPageUrl = "admin/rolebindUserPage/" + content;
										var roleOperPageUrl = "admin/rolebindOperPage/" + content;
                    return "<a href='javascript:showModal(\"更新角色\", \""+editUrl+"\");' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>"
                        + "&nbsp;<a href='javascript:showModal(\"绑定角色用户\", \""+roleUserPageUrl+"\");' class='btn btn-xs btn-success'><i class='ace-icon fa fa-user'>分配用户</i></a>"
	                    + "&nbsp;<a href='javascript:goPage(\""+roleOperPageUrl+"\");' class='btn btn-xs btn-info'><i class='ace-icon fa fa-th-list'>分配权限</i></a>";
                }}
            ],
            cls: "",
            url: _urlPath + "admin/rolequeryPage",
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