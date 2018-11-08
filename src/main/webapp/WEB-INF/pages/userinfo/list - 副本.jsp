<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>用户池列表</title>
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
<div id="content-wrapper"><!--开始-->
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 150px">
		<input type="text" class="form-control search-query" name="uname" placeholder="关键字">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 150px;">
	<select class="form-control" name="status">
			<option value="">==客户状态==</option>
		<option value="0">审核中</option>
		<option value="1">已通过</option>
		<option value="2">业务员维护中</option>
		<option value="3">区未覆盖</option>
		<option value="4">审核分配中</option>
		<option value="5">待审经理批准</option>
		<option value="6">二次审核中</option>
		<option value="7">待维护老客户</option>
		<option value="8">已弃用</option>
		<option value="9">停用</option>
		<option value="10">已删除</option>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
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
            {field:"rownum", text:"序列",formatter:function(index, content, data){
            			
                 	return index+1;                    
                }}, 
                {field:"userid", text:"姓名",width:80, style:"text-align:center", formatter:function(index, content, data){             
                	var renurl = "/admin/userRenzhen/"+ content;	      
				    return "&nbsp;&nbsp;<a href='"+renurl+"' data-original-title='点击查看详情'  class='btn btn-xs btn-info add-tooltip'><i class='fa fa-clipboard'>"+data.uname+"</i></a>"
				}},
                {field:"oper_user.opname", text:"销售员", sortColumn:"opuserid"},
       					{field:"mobile", text:"手机号", sortColumn:"mobile"},
       					{field:"belongto", text:"手机归属地"},       					
                //{field:"sex", text:"性别",formatter:function(index, content, data){
                   // return content == 0 ? "<font color='blue'>女♀</font>" : "<font color='red'>男♂</font>";
               // }},  
                {field:"cardid", text:"身份证号"},
                {field:"compname", text:"单位/学校"},
                {field:"createdate", text:"注册时间"},
                {field:"ifbasic", text:"基本认证情况",formatter:function(index, content, data){
                		var sstr = "";
                	if(content == 0) sstr=sstr+ "<a class='label'>基本未认证</a><br/><br/>";
									else if(content == 1) sstr=sstr+"<a class='label label-success'>基本已认证</a><br/><br/>";
										sstr+=(data.ifid == "1") ? "<a class='label label-success'>身份证已认证</a><br/><br/>" : "<a class='label'>身份证未认证</a><br/><br/>";
										sstr+=(data.ifcontacts == "1") ? "<a class='label label-success'>联系人已认证</a><br/><br/>" : "<a class='label'>联系人未认证</a><br/><br/>";
										sstr+=(data.ifcarrier == "1") ? "<a class='label label-success'>营运商已认证</a>" : "<a class='label'>营运商未认证</a>";
             			return sstr;
                }},                 
                 {field:"ifrenzheng", text:"认证是否审核通过",formatter:function(index, content, data){
    									var editrenUrl = "admin/preRenUpdate/" + data.userid,ssc="";	 
                    if(content == "1"){ ssc = "<a class='label label-success'>已通过</a><br/><br/>";
                    	return ssc;
										}else if(content == "0"){ ssc = "<a class='label'>等待认证</a><br/><br/>";
											return ssc+"&nbsp;<a href='javascript:showModal( \"认证处理\", \""+editrenUrl+"\");'  data-original-title='认证处理' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>认证处理</i></a>&nbsp;";
										}else if(content == "2"){ ssc = "<a class='label label-info'>审核中</a><br/><br/>";
											return ssc+"&nbsp;<a href='javascript:showModal( \"认证处理\", \""+editrenUrl+"\");'  data-original-title='认证处理' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>认证处理</i></a>&nbsp;";
										}else{  ssc = "<a class='label label-danger'>需重新认证</a><br/><br/>";
											return ssc+"&nbsp;<a href='javascript:showModal( \"认证处理\", \""+editrenUrl+"\");'  data-original-title='认证处理' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>认证处理</i></a>&nbsp;";
										}	
	                    
                }}, 
                {field:"status", text:"客户状态",formatter:function(index, content, data){
                				if(content == 0) return "<font color='blue'>审核中</font>";
												else if(content == 1) return "<font color='blue'>已通过</font>";
												else if(content == 2) return "<font color='blue'>业务员维护中</font>";
												else if(content == 3) return "<font color='blue'>区未覆盖</font>";
												else if(content == 4) return "<font color='blue'>审核分配中</font>";
												else if(content == 5) return "<font color='blue'>待审经理批准</font>";
												else if(content == 6) return "<font color='blue'>二次审核中</font>";
												else if(content == 7) return "<font color='blue'>待维护老客户</font>";										
												else if(content == 8) return "<font color='blue'>已弃用</font>";
												else if(content == 9) return "<font color='blue'>停用</font>";
												else if(content == 10) return "<font color='blue'>已删除</font>";
                }}, 
                {field:"from_app", text:"APP"},
                {field:"from_channel", text:"来源渠道"},                
                {field:"userid", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){             
	                    var editUrl = "/admin/preUserUpdateOper/" + content;		      
	                    return "&nbsp;<a href='javascript:showModal( \"重分配销售员\", \""+editUrl+"\");'  data-original-title='重分配销售员' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>重分配销售员</i></a>";
                	
                }},{field:"userid", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
             
	                    var editUrl = "admin/preUserinfoUpdate/" + content;	
	                    var editrenUrl = "admin/preRenUpdate/" + content;	  
	                    var renurl = "/admin/userRenzhen/"+ content;     //&nbsp;<a href='javascript:showModal( \"认证处理\", \""+editrenUrl+"\");'  data-original-title='认证处理' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>认证处理</i></a>
	                    return "&nbsp;<a href='javascript:showModal( \"审核处理\", \""+editUrl+"\");'  data-original-title='审核处理' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-edit'>审核处理</i></a>"+
	                    "&nbsp;<a href='"+renurl+"'  class='btn btn-xs btn-success add-tooltip'><i class='fa fa-clipboard'>详情</i></a>";
                	//"<a href='javascript:showModal(\"更新工单\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
                }}
            ],
            cls: "",
            url: _urlPath + "admin/myUserinfoQeryPage",
            sort:"createdate",
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
<%@include file="../common/bottom.jsp" %>
</body>
</html>