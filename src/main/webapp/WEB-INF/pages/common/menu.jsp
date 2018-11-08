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
		    <li class="mm-dropdown" opCode="04">
		        <a href="#"><i class="menu-icon fa fa-desktop"></i><span class="mm-text">工单管理</span></a>
		        <ul>
		            <li opCode="0401">
		                <a tabindex="-1" href="javascript:goPage('admin/workorder/mywork')"><span class="mm-text">我的工单</span></a>
		            </li>
		             <li opCode="0402">
		                <a tabindex="-1" href="javascript:goPage('admin/workorder/newwork')"><span class="mm-text">新工单</span></a>
		            </li>
		             <li opCode="0403">
		                <a tabindex="-1" href="javascript:goPage('admin/workorder/waitwork')"><span class="mm-text">待处理工单</span></a>
		            </li>
		            <li opCode="0404">
		                <a tabindex="-1" href="javascript:goPage('admin/workorder/doingwork')"><span class="mm-text">处理中工单</span></a>
		            </li>
		            <li opCode="0405">
		                <a tabindex="-1" href="javascript:goPage('admin/workorder/finishwork')"><span class="mm-text">已处理工单</span></a>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-bullhorn"></i><span class="mm-text">电销中心</span></a>
		        <ul>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">客户池</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/rolemainPage')"> <span class="mm-text">我的客户</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opermainPage')"> <span class="mm-text">工作量统计</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opermainPage')"> <span class="mm-text">外部数据</span></a>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-legal"></i><span class="mm-text">风控中心</span></a>
		        <ul>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="#"><span class="mm-text">信审管理</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="javascript:goPage('admin/auditing/list')"><span class="mm-text">审核客户</span></a>
											</li>
		                </ul>
		            </li>	
		    
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="#"> <span class="mm-text">工作量统计</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">审核量统计</span></a>
											</li>
		                </ul>
		            </li>	            
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-jpy"></i><span class="mm-text">信贷管理</span></a>
		        <ul>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">全部客户管理</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/product/list')"><span class="mm-text">信贷产品管理</span></a>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-check"></i><span class="mm-text">支付管理</span></a>
		        <ul>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">代付日志</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">代付消息</span></a>
		            </li>
		            <li>
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">线上还款记录</span></a>
		            </li>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">合同管理</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">电子合作管理</span></a>
											</li>
											<li>
												<a tabindex="-1" href="#"><span class="mm-text">合同模板</span></a>
											</li>
		                </ul>
		            </li>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">代扣管理</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">代扣订单</span></a>
											</li>
		                </ul>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-key"></i><span class="mm-text">营运中心</span></a>
		        <ul>
	
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">营运情况统计</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">我的二维码</span></a>
											</li>
											<li>
												<a tabindex="-1" href="#"><span class="mm-text">推广情况统计</span></a>
											</li>
		                </ul>
		            </li>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">活动管理</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">优惠劵管理</span></a>
											</li>
		                </ul>
		            </li>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">消息中心</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">系统消息</span></a>
											</li>
											<li>
												<a tabindex="-1" href="#"><span class="mm-text">意见反馈</span></a>
											</li>
		                </ul>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown">
		        <a href="#"><i class="menu-icon fa fa-money"></i><span class="mm-text">债务管理</span></a>
		        <ul>
	
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="#"><span class="mm-text">催收平台</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="javascript:goPage('admin/callAccount/list')"><span class="mm-text">快速查询</span></a>
											</li>
											<li>
												<a tabindex="-1" href="javascript:goPage('admin/callAccount/xlist')"><span class="mm-text">现金贷客户催收</span></a>
											</li>
											<li>
												<a tabindex="-1" href="javascript:goPage('admin/callAccount/flist')"><span class="mm-text">分期贷客户催收</span></a>
											</li>
											<li>
												<a tabindex="-1" href="javascript:goPage('admin/amountlate/list')"><span class="mm-text">滞纳金管理</span></a>
											</li>
		                </ul>
		            </li>
		            <li  class="mm-dropdown">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">工作情况统计</span></a>
		                <ul>
		                	<li>
												<a tabindex="-1" href="#"><span class="mm-text">催收员催款统计</span></a>
											</li>
											<li>
												<a tabindex="-1" href="#"><span class="mm-text">回访情况统计</span></a>
											</li>
											<li>
												<a tabindex="-1" href="#"><span class="mm-text">催收效果统计</span></a>
											</li>
		                </ul>
		            </li>		           
		        </ul>
		    </li>
		    <li class="mm-dropdown" opCode="01">
		        <a href="#"><i class="menu-icon fa fa-cogs"></i><span class="mm-text">权限管理</span></a>
		        <ul>
		            <li opCode="0101">
		                <a tabindex="-1" href="javascript:goPage('admin/opmainPage')"><span class="mm-text">用户管理</span></a>
		            </li>
		            <li opCode="0102">
		                <a tabindex="-1" href="javascript:goPage('admin/rolemainPage')"> <span class="mm-text">角色管理</span></a>
		            </li>
		            <li opCode="0103">
		                <a tabindex="-1" href="javascript:goPage('admin/oper/mainPage')"> <span class="mm-text">操作管理</span></a>
		            </li>
		        </ul>
		    </li>

		    <li class="mm-dropdown" opCode="02">
		        <a href="#"><i class="menu-icon fa fa-barcode"></i><span class="mm-text">整合技术</span></a>
		        <ul>
		            <li opCode="0201">
		                <a tabindex="-1" href="javascript:goPage('admin/tech/filePage')"><span class="mm-text">文件管理</span></a>
		            </li>
		            <li opCode="0202">
		                <a tabindex="-1" href="javascript:goPage('admin/tech/articlePage')"><span class="mm-text">文章管理</span></a>
		            </li>
		        </ul>
		    </li>
		    <li class="mm-dropdown" opCode="03">
		        <a href="#"><i class="menu-icon fa fa-credit-card"></i><span class="mm-text">系统管理</span></a>
		        <ul>
		            <li opCode="0301">
		                <a tabindex="-1" href="javascript:goPage('admin/log/mainPage')"><span class="mm-text">用户日志</span></a>
		            </li>
		        </ul>
		    </li>
		</ul>
	</div>
</div>
