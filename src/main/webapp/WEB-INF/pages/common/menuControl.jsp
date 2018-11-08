<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="main-menu" role="navigation">
	<div id="main-menu-inner">
		<div class="menu-content top" id="menu-content-demo">
		    <div>
		        <div class="text-bg"><span class="text-semibold">${loginUser.username}</span></div>
		        <img src="${ctx}/assets/images/user-head-default.png" alt="" class="">
		        <div class="btn-group">
		            <a href="javascript:showModal('修改密码', 'admin/opupdatePasswdPage?opuserid=${loginUser.opuserid}');" data-original-title="修改密码" class="btn btn-xs btn-primary btn-outline dark add-tooltip"><i class="fa fa-cog"></i></a>
		            <a href="javascript:logout()" data-original-title="退出" class="btn btn-xs btn-danger btn-outline dark add-tooltip"><i class="fa fa-power-off"></i></a>
		            <a href="javascript:index()" data-original-title="Druid监控" class="btn btn-xs btn-danger btn-outline dark add-tooltip"><i class="fa fa-home fa-fw"></i></a>
		        </div>
		        <a href="#" class="close">&times;</a>
		    </div>
		</div>
		<ul class="navigation">
			<c:if test="${ifdaichao==0}">
				<li>
					<a href="main" onclick="skipurl('main');return false;"><i class="menu-icon fa fa-dashboard"></i><span class="mm-text">平台公告</span></a>
				</li>
			</c:if>
		  <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-legal"></i><span class="mm-text">风控查询</span></a>
		        <ul class="open">		           
		            <li>
		                <a tabindex="-1" href="usercreditsearch" onclick="skipurl('usercreditsearch');return false;"> <span class="mm-text">信用报告</span></a>
		            </li>
		             <li>
		                <a tabindex="-1" href="usercreditlist" onclick="skipurl('usercreditlist');return false;"><span class="mm-text">查询结果列表</span></a>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-barcode"></i><span class="mm-text">客户管理</span></a>
		        <ul class="open">		           
		            <li>
		                <a tabindex="-1" href="loanrecordlist" onclick="skipurl('loanrecordlist');return false;"> <span class="mm-text">客户申请列表</span></a>
		            </li>
		             <c:if test="${loginUser.ifoper==1}">
		             <li>
		                <a tabindex="-1" href="userinfolist" onclick="skipurl('userinfolist');return false;"><span class="mm-text">客户进件列表</span></a>
		            </li>
		          </c:if>
		        </ul>
		    </li>
		    <c:if test="${loginUser.ifoper==1}">
				<li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-th-list"></i><span class="mm-text">贷超管理</span></a>
		        <ul class="open">
		            <li>
		                <a tabindex="-1" href="daiProductlist" onclick="skipurl('daiProductlist');return false;"><span class="mm-text">产品管理</span></a>
		            </li>
		            <c:if test="${ifdaichao==0}">
		            <li>
		                <a tabindex="-1" href="productlist" onclick="skipurl('productlist');return false;"> <span class="mm-text">贷款产品列表</span></a>
		            </li>
		             </c:if>
		        </ul>
		    </li>
		  </c:if>
		
				<li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-stack-overflow"></i><span class="mm-text">运营管理</span></a>
		        <ul class="open">
		            <li>
		                <a tabindex="-1" href="compProductlist" onclick="skipurl('compProductlist');return false;"><span class="mm-text">渠道列表</span></a>
		            </li>
		             <c:if test="${ifdaichao==0}">
		            <li>
		                <a tabindex="-1" href="extensionPage" onclick="skipurl('extensionPage');return false;"> <span class="mm-text">业务员推广列表</span></a>
		            </li>
		             </c:if>
		        </ul>
		    </li>
	
		    <c:if test="${ifdaichao==0}">
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-warning"></i><span class="mm-text">逾期管理</span></a>
		        <ul class="open">
		            <li>
		                <a tabindex="-1" href="overdueloanlist" onclick="skipurl('overdueloanlist');return false;"><span class="mm-text">逾期列表</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="overdueAuditList" onclick="skipurl('overdueAuditList');return false;"> <span class="mm-text">申请延期列表</span></a>
		            </li>
		        </ul>
		    </li>
		  
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-jpy"></i><span class="mm-text">财务管理</span></a>
		        <ul class="open">
		            <li>
		                <a tabindex="-1" href="auditloanlist" onclick="skipurl('auditloanlist');return false;"><span class="mm-text">审核贷款列表</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="alreadyloanlist" onclick="skipurl('alreadyloanlist');return false;"> <span class="mm-text">已放贷列表</span></a>
		            </li>
		        </ul>
		    </li>
		    </c:if>
		    <c:if test="${loginUser.ifoper==1}">
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-credit-card"></i><span class="mm-text">商户管理</span></a>
		        <ul>
		            <li>
		                <a tabindex="-1" href="preCustomerMain" onclick="skipurl('preCustomerMain');return false;"><span class="mm-text">商户管理</span></a>
		            </li>		           
		        </ul>
		    </li>
		 </c:if>

		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-credit-card"></i><span class="mm-text">系统日志</span></a>
		        <ul>
		            <li>
		                <a tabindex="-1" href="logmainPage" onclick="skipurl('logmainPage');return false;"><span class="mm-text">操作日志</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="preFinanceLog" onclick="skipurl('preFinanceLog');return false;"><span class="mm-text">财务日志</span></a>
		            </li>
		            <c:if test="${ifdaichao==0}">
		            <li>
		                <a tabindex="-1" href="auditingloglist" onclick="skipurl('auditingloglist');return false;"><span class="mm-text">审核记录</span></a>
		            </li>
		            </c:if>
		        </ul>
		    </li>

		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-bar-chart-o"></i><span class="mm-text">统计情况</span></a>
		        <ul>
		        	 <li>
		                <a tabindex="-1" href="flowcomplist" onclick="skipurl('flowcomplist');return false;"><span class="mm-text">商户流量统计</span></a>
		            </li>
		            <!--li>
		                <a tabindex="-1" href="preStatisticsMain" onclick="skipurl('preStatisticsMain');return false;"><span class="mm-text">统计情况</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="preStatisticsMain" onclick="skipurl('preStatisticsMain');return false;"><span class="mm-text">客户使用统计</span></a>
		            </li-->
		        </ul>
		    </li>
		     <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-cogs"></i><span class="mm-text">权限管理</span></a>
		        <ul class="submenu" style="display: block;">
		            <li>
		                <a tabindex="-1" href="opmainPage" onclick="skipurl('opmainPage');return false;"><span class="mm-text">管理员管理</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="rolemainPage" onclick="skipurl('rolemainPage');return false;"> <span class="mm-text">角色管理</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="opermainPage" onclick="skipurl('opermainPage');return false;"> <span class="mm-text">操作管理</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="preInfoConfigure" onclick="skipurl('preInfoConfigure');return false;"> <span class="mm-text">信息配置</span></a>
		            </li>
		        </ul>
		    </li>
		  	<!--li class="mm-dropdown" opCode="02">
		        <a href="#"><i class="menu-icon fa fa-barcode"></i><span class="mm-text">整合技术</span></a>
		        <ul>
		            <li opCode="0201">
		                <a tabindex="-1" href="javascript:goPage('admin/tech/filePage')"><span class="mm-text">文件管理</span></a>
		            </li>
		            <li opCode="0202">
		                <a tabindex="-1" href="javascript:goPage('admin/tech/articlePage')"><span class="mm-text">文章管理</span></a>
		            </li>
		        </ul>
		    </li-->
		</ul>
	</div>
</div>
<script type="text/javascript">
	function skipurl(url){
		document.location.href="/admin/"+url;
	}

</script>
