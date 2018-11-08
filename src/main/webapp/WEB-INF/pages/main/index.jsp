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
		<ul class="breadcrumb breadcrumb-page">
			<div class="breadcrumb-label text-light-gray">位置: </div>
			<li><a href="#">这里借</a></li>
			<li class="active"><a href="main">首页</a></li>
		</ul>
		<div class="page-header">
			
			<div class="row">
				<!-- Page header, center on small screens -->
				<h1 class="col-xs-12 col-sm-4 text-center text-left-sm"><i class="fa fa-dashboard page-header-icon"></i>&nbsp;&nbsp;统计情况</h1>
			</div>
		</div> <!-- / .page-header -->


		<div class="row">
			<div class="col-md-8">

<!-- 5. $UPLOADS_CHART =============================================================================

				Uploads chart
-->
				<!-- Javascript -->
				<script>
					init.push(function () {
						var uploads_data = [
						<c:forEach var="datedata" items="${datelist}" varStatus="loop">
							{ day: '${datedata.key}', v: ${datedata.value} } <c:if test="${!loop.last}">,</c:if>
					</c:forEach>
						];
						Morris.Line({
							element: 'hero-graph',
							data: uploads_data,
							xkey: 'day',
							ykeys: ['v'],
							labels: ['贷款金额'],
							lineColors: ['#fff'],
							lineWidth: 2,
							pointSize: 4,
							gridLineColor: 'rgba(255,255,255,.5)',
							resize: true,
							gridTextColor: '#fff',
							xLabels: "day",
							xLabelFormat: function(d) {
								return ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov', 'Dec'][d.getMonth()] + ' ' + d.getDate(); 
							},
						});
					});
				</script>
				<!-- / Javascript -->

				<div class="stat-panel">
					<div class="stat-row">
						<!-- Small horizontal padding, bordered, without right border, top aligned text -->
						<div class="stat-cell col-sm-4 padding-sm-hr bordered no-border-r valign-top">
							<!-- Small padding, without top padding, extra small horizontal padding -->
							<h4 class="padding-sm no-padding-t padding-xs-hr"><i class="fa fa-cloud-upload text-primary"></i>&nbsp;&nbsp;资金情况（元）</h4>
							<!-- Without margin -->
							<ul class="list-group no-margin">
								<!-- Without left and right borders, extra small horizontal padding, without background, no border radius -->
								<li class="list-group-item no-border-hr padding-xs-hr no-bg no-border-radius">
									总共贷款金额 <span class="label label-pa-purple pull-right">${total}</span>
								</li> <!-- / .list-group-item -->
								<!-- Without left and right borders, extra small horizontal padding, without background -->
								<li class="list-group-item no-border-hr padding-xs-hr no-bg">
									已还金额 <span class="label label-danger pull-right">${altotal}</span>
								</li> <!-- / .list-group-item -->
								<!-- Without left and right borders, without bottom border, extra small horizontal padding, without background -->
								<li class="list-group-item no-border-hr no-border-b padding-xs-hr no-bg">
									逾期金额 <span class="label label-success pull-right">${yuqitotal}</span>
								</li> <!-- / .list-group-item -->
								<li class="list-group-item no-border-hr no-border-b padding-xs-hr no-bg">
									盈利金额 <span class="label label-success pull-right">${yintotal}</span>
								</li> 
							</ul>
						</div> <!-- /.stat-cell -->
						<!-- Primary background, small padding, vertically centered text -->
						<div class="stat-cell col-sm-8 bg-primary padding-sm valign-middle">
							<div id="hero-graph" class="graph" style="height: 230px;"></div>
						</div>
					</div>
				</div> <!-- /.stat-panel -->
<!-- /5. $UPLOADS_CHART -->

<!-- 6. $EASY_PIE_CHARTS ===========================================================================

				Easy Pie charts
-->
				
				<!-- / Javascript -->

				
			</div>
<!-- /6. $EASY_PIE_CHARTS -->

			<div class="col-md-4">
				<div class="row">

<!-- 7. $EARNED_TODAY_STAT_PANEL ===================================================================

					Earned today stat panel
-->
					<div class="col-sm-4 col-md-12">
						<div class="stat-panel">
							<!-- Danger background, vertically centered text -->
							<div class="stat-cell bg-danger valign-middle">
								<!-- Stat panel bg icon -->
								<i class="fa fa-trophy bg-icon"></i>
								<!-- Extra large text -->
								<span class="text-xlg"><span class="text-lg text-slim">$</span><strong>${lrtoday.amount}</strong></span><br>
								<!-- Big text -->
								<span class="text-bg">今天放贷金额</span><br>
								<!-- Small text -->
								<span class="text-sm"><a href="#">查看详情</a></span>
							</div> <!-- /.stat-cell -->
						</div> <!-- /.stat-panel -->
					</div>
<!-- /7. $EARNED_TODAY_STAT_PANEL -->


<!-- 8. $RETWEETS_GRAPH_STAT_PANEL =================================================================

					Retweets graph stat panel
-->
					<div class="col-sm-4 col-md-12">
						<!-- Javascript -->
						<script>
							init.push(function () {
								$("#stats-sparklines-3").pixelSparkline([275,490,397,487,339,403,402,312,300], {
									type: 'line',
									width: '100%',
									height: '45px',
									fillColor: '',
									lineColor: '#fff',
									lineWidth: 2,
									spotColor: '#ffffff',
									minSpotColor: '#ffffff',
									maxSpotColor: '#ffffff',
									highlightSpotColor: '#ffffff',
									highlightLineColor: '#ffffff',
									spotRadius: 4,
									highlightLineColor: '#ffffff'
								});
							});
						</script>
						<!-- / Javascript -->

						<div class="stat-panel">
							<div class="stat-row">
								<!-- Purple background, small padding -->
								<div class="stat-cell bg-pa-purple padding-sm">
									<!-- Extra small text -->
									<div class="text-xs" style="margin-bottom: 5px;">申请贷款用户统计</div>
									<div class="stats-sparklines" id="stats-sparklines-3" style="width: 100%"></div>
								</div>
							</div> <!-- /.stat-row -->
							<div class="stat-row">
								<!-- Bordered, without top border, horizontally centered text -->
								<div class="stat-counters bordered no-border-t text-center">
									<!-- Small padding, without horizontal padding -->
									<div class="stat-cell col-xs-4 padding-sm no-padding-hr">
										<!-- Big text -->
										<span class="text-bg"><strong>${lruser.amountmust}</strong></span><br>
										<!-- Extra small text -->
										<span class="text-xs text-muted">注册用户数</span>
									</div>
									<!-- Small padding, without horizontal padding -->
									<div class="stat-cell col-xs-4 padding-sm no-padding-hr">
										<!-- Big text -->
										<span class="text-bg"><strong>${lruser.amount}</strong></span><br>
										<!-- Extra small text -->
										<span class="text-xs text-muted">申请贷款人数</span>
									</div>
									<!-- Small padding, without horizontal padding -->
									<div class="stat-cell col-xs-4 padding-sm no-padding-hr">
										<!-- Big text -->
										<span class="text-bg"><strong>${lruser.amountmonth}</strong></span><br>
										<!-- Extra small text -->
										<span class="text-xs text-muted">已放款用户数</span>
									</div>
								</div> <!-- /.stat-counters -->
							</div> <!-- /.stat-row -->
						</div> <!-- /.stat-panel -->
					</div>
<!-- /8. $RETWEETS_GRAPH_STAT_PANEL -->

<!-- 9. $UNIQUE_VISITORS_STAT_PANEL ================================================================

					Unique visitors stat panel
-->
					<div class="col-sm-4 col-md-12">
					

					
					</div>
				</div>
			</div>
		</div>
<!-- /9. $UNIQUE_VISITORS_STAT_PANEL -->

		<!-- Page wide horizontal line -->
		<hr class="no-grid-gutter-h grid-gutter-margin-b no-margin-t">



		</div> <!-- / #content-wrapper 结束内容 -->
	<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->
<%@include file="../common/bottom.jsp" %>
</body>
</html>