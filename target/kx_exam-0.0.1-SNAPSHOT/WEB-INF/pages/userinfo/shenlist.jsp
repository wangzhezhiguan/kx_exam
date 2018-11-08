<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<option value="4">审核分配中</option>
			<option value="6">二次审核中</option>
			<option value="11">已弃用</option>
			<option value="12">停用</option>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加客户', 'admin/userinfo/preAdd');"><span class="btn-label icon fa fa-plus"></span>添加客户</button>
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
                {field:"uname", text:"姓名"},
                {field:"oper_user.opname", text:"电销员", sortColumn:"opuserid"},
       					{field:"mobile", text:"电话", sortColumn:"mobile"},
       					{field:"belongto", text:"所属"},       					
                {field:"sex", text:"性别",formatter:function(index, content, data){
                    return content == 0 ? "<font color='blue'>女♀</font>" : "<font color='red'>男♂</font>";
                }},  
                {field:"cardid", text:"身份证号"},
                {field:"compname", text:"单位/学校"},
                {field:"createdate", text:"注册时间"},
                {field:"status", text:"客户状态",formatter:function(index, content, data){
                				if(content == 0) return "<font color='blue'>审核中</font>";
												else if(content == 1) return "<font color='blue'>已通过</font>";
												else if(content == 2) return "<font color='blue'>业务员维护中</font>";
												else if(content == 3) return "<font color='blue'>区未覆盖</font>";
												else if(content == 4) return "<font color='blue'>审核分配中</font>";
												else if(content == 5) return "<font color='blue'>待审经理批准</font>";
												else if(content == 6) return "<font color='blue'>二次审核中</font>";
												else if(content == 7) return "<font color='blue'>待维护老客户</font>";
												else if(content == 8) return "<font color='blue'>未提现</font>";
												else if(content == 9) return "<font color='blue'>已开通未提现</font>";
												else if(content == 10) return "<font color='blue'>已提现</font>";
												else if(content == 11) return "<font color='blue'>已弃用</font>";
												else if(content == 12) return "<font color='blue'>停用</font>";
												else if(content == 13) return "<font color='blue'>已删除</font>";
                }}, 
                {field:"from_app", text:"APP"},
                {field:"from_channel", text:"来源渠道"},                
                {field:"userid", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){            
	                    var editUrl = "admin/userinfo/preUpdate/" + content;	      
	                    return "&nbsp;<a href='javascript:showModal(\"更新客户\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>";
                	//"<a href='javascript:showModal(\"更新工单\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
                }}
            ],
            cls: "",
            url: _urlPath + "admin/userinfo/shenqueryPage",
            sort:"createdate",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
</script>