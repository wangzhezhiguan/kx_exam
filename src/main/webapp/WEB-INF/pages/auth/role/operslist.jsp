<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易店生活</title>
<link rel="stylesheet" href="/static/plugins/layui/css/layui.css">
<link rel="stylesheet" href="/static/css/global.css" media="all">
<link rel="stylesheet" href="/static/css/command.css" media="all">
<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
<script type="text/javascript" src="/static/plugins/layui/layui.js?r=${random }"></script>
<script type="text/javascript" src="/static/js/command.js?r=${random }"></script>
<script type="text/javascript" src="/static/module/rolePermission/rolePermission-list.js?r=${random }"></script>
<!-- 定义模板 -->
<script type="text/html" id="tablePage">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="isOpenFormat">
	{{# if (d.isOpen == 1) { }}  
		<span class="layui-badge layui-bg-black">启用</span>
	{{# } else { }}
		<span class="layui-badge">关闭</span>
	{{# } }}
</script>
<style>
.layui-table[lay-skin=line] {
border-width: 0 0 0 0 !important;
width:100%;
}
</style>
</head>
<body>
	<div class="admin-main">
		<!-- 操作栏 -->
		<blockquote class="layui-elem-quote">
			<a href="javascript:void(0);" class="layui-btn layui-btn-small" id="addBtn"><i class="fa fa-plus-circle" aria-hidden="true"></i> 添加
			</a> <a href="javascript:void(0);" class="layui-btn layui-btn-small" id="searchBtn"><i class="fa fa-search" aria-hidden="true"></i></i> 搜索
			</a>
		</blockquote>

		<!-- 表格 -->
		<table id="tableContent" class="layui-table" lay-filter="tableEvent"></table>
	</div>
</body>
</html>