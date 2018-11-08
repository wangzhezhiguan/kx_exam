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
		<input type="text" class="form-control search-query" name="username" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="type" onchange="javascript:formSubmit();">
			<option value="">==操作类型==</option>
			<option value="0">操作日志</option>
			<option value="1">异常日志</option>
		</select>
	</div>
						<div class="input-daterange input-group" id="bs-datepicker-range">
							<input type="text" class="input-sm form-control" name="startDate" placeholder="开始时间">
							<span class="input-group-addon">to</span>
							<input type="text" class="input-sm form-control" name="endDate" placeholder="结束时间">
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
                {field:"id",text:"文件ID"},
                {field:"username", text:"操作人"},
                {field:"type", text:"日志类型", formatter:function(index, content, data){
                	return 1 == content ? "<font color='red'>异常日志</font>" : "<font color='blue'>操作日志</font>";
                }},
                {field:"url", text:"请求地址"},
                {field:"method", text:"方法"},
                {field:"params", text:"请求参数",limit:15,formatter:function(index, content, data){
                	content = content.replace(/<(?:.|\s)*?>/g,"");
                	if(content.length > 30){
                		content = content.substr(0, 30) + "...";
                	}
                	return content;
                }},
                {field:"requestip", text:"访问IP"},
                {field:"description", text:"操作描述"},
                {field:"detail", text:"异常详情"},
                {field:"operDate", text:"操作日期"}
            ],	
            cls: "",
            url: _urlPath + "admin/logqueryPage",
            sort:"id",
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