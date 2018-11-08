<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="main-navbar" class="navbar navbar-inverse" role="navigation">
	<button type="button" id="main-menu-toggle">
		<i class="navbar-icon fa fa-bars icon"></i><span class="hide-menu-text">隐藏菜单</span>
	</button>
	<div class="navbar-inner">
		<div class="navbar-header">
			<a href="#" class="navbar-brand" style="font-size: 22px;"><div style="vertical-align: unset;"></div><c:if test="${loginUser.compname==null||loginUser.compname==''}">客户管理平台</c:if><c:if test="${loginUser.compname!=null&&loginUser.compname!=''}">${loginUser.compname}</c:if></a>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar-collapse">
				<i class="navbar-icon fa fa-bars"></i>
			</button>
		</div>
		<div id="main-navbar-collapse" class="collapse navbar-collapse main-navbar-collapse">
			<div>
				<ul class="nav navbar-nav">
					<li><a href="javascript:goIndex()">首页</a></li>
				</ul>
	<c:if test="${loginUser.username!='admin'}">	
					<ul class="nav navbar-nav pull-center center-navbar-nav">

						<li class="dropdown">
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${loginUser.balance<=0}">	余额不足 </c:if><c:if test="${loginUser.balance>0}">${loginUser.balance}</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;风控余额&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
						</li>
						<li class="dropdown">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${loginUser.smsbalance<=0}">	余额不足 </c:if><c:if test="${loginUser.balance>0}">${loginUser.smsbalance}</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;短信余额&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
						</li>
					</ul>
			</c:if>
				
				<div class="right clearfix">
					<ul class="nav navbar-nav pull-right right-navbar-nav">

						<li class="dropdown">
							<a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown" id="showHeadImg">
								<img src="${ctx}/assets/images/user-head-default.png" alt=""><span>${loginUser.username}</span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:showModal('修改密码', 'admin/opupdatePasswdPage?opuserid=${loginUser.opuserid}');"><i class="dropdown-icon fa fa-cog"></i>&nbsp;&nbsp;修改密码</a></li>
								<li class="divider"></li>
								<li><a href="javascript:index()"><i class="dropdown-icon fa fa-home"></i>&nbsp;&nbsp;Druid监控</a></li>
								<li><a href="javascript:logout()"><i class="dropdown-icon fa fa-power-off"></i>&nbsp;&nbsp;退出</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
