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
    <title>操作日志管理</title>
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

				<script>
					init.push(function () {

						var options2 = {
							orientation: $('body').hasClass('right-to-left') ? "auto right" : 'auto auto'
						}
						$('#bs-datepicker-range').datepicker(options2);

						
					});
				</script>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="uname" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="tradetype" onchange="javascript:formSubmit();">
			<option value="">==类型==</option>
			<option value="0">短信</option>
			<option value="1">运营商查询</option>
			<option value="2">黑名单</option>
			<option value="3">综合征信</option>
			<option value="4">四大借贷数据</option>
			<option value="5">芝麻分</option>
			<option value="9">短信充值</option>
			<option value="9">查询充值</option>
		</select>
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 400px;">
						<div class="input-daterange input-group" id="bs-datepicker-range">
							<input style="width:200px;" type="text" class="input-sm form-control" name="startdate" placeholder="开始时间">
							<span class="input-group-addon">to</span>
							<input style="width:200px;" type="text" class="input-sm form-control" name="enddate" placeholder="结束时间">
						</div>
</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
  </div>
</div>
<div class="openAppGrid">
	<div id="openAppGrid"></div>
</div>
<!-- Get jQuery from Google CDN -->

<!--[if lte IE 9]>
	<script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">'+"<"+"/script>"); </script>
<![endif]-->
<script type="text/javascript">

    $(function (){
        $("#openAppGrid").sgrid({
            columns:[
                {field:"financelogid",text:"文件ID"},
                {field:"uname", text:"操作人"},
                {field:"status", text:"状态", formatter:function(index, content, data){
                	if(content=="0"){return "<font color='blue'>正在处理</font>";}
                	else if(content=="1"){return "<font color='green'>处理成功</font>";}
                	else{return "<font color='red'>处理失败</font>";};
                }},
                {field:"tradetype", text:"日志类型", formatter:function(index, content, data){
                	if(content=="0"){return "<font color='blue'>短信</font>";}
                	else if(content=="1"){return "<font color='green'>运营商查询</font>";}
                	else if(content=="2"){return "<font color='yellow'>黑名单查询</font>";}
                	else if(content=="3"){return "<font >综合征信</font>";}
                	else if(content=="4"){return "<font color='red'>四大借贷数据</font>";}
                	else if(content=="5"){return "<font >芝麻分查询</font>";}
                	else if(content=="8"){return "<font >短信充值</font>";}
                	else{return "<font color='red'>查询充值</font>";};
                }},
                {field:"paymode", text:"支付类型", formatter:function(index, content, data){
                	if(content=="0"){return "<font color='blue'>扣余额</font>";}
                	else if(content=="1"){return "<font color='blue'>支付宝</font>";}
                	else if(content=="2"){return "<font color='green'>微信</font>";}
                	else{return "<font color='red'>银联转账</font>";};
                }},
                {field:"trademoney", text:"交易金额"},
                {field:"createdate", text:"操作日期"}
            ],	
            cls: "",
            url: _urlPath + "admin/logqueryPageFinance",
            sort:"createdate",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
    

	window.PixelAdmin.start(init);
</script>
		</div> <!-- / #content-wrapper 结束内容 -->
	<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->
<%@include file="../common/bottom.jsp" %>
</body>
</html>