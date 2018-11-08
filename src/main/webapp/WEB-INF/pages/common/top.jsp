<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <!-- Pixel Admin's stylesheets -->
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/bootstrap-duallistbox.css" rel="stylesheet" />
    <link href="${ctx}/assets/css/pixel-admin.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/assets/css/widgets.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/assets/css/rtl.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/assets/css/themes.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/assets/stylesheets/pages.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/assets/css/grid/openplat.css" rel="stylesheet">
    <link href="${ctx}/assets/css/jquery/jquery.webui-popover.min.css" rel="stylesheet">
    <link href="${ctx}/assets/css/morris/morris.css" rel="stylesheet">
	<link href="${ctx}/assets/js/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet" />
	<style>
	.sgrid table tr {
		height: 36px
	}
	
	.z-loading-wrap {
		overflow: hidden;
		position: absolute;
		top: 45%;
		left: 50%;
		z-index: 1000;
		width: 100px;
		height: 100px;
		display: none;
		margin-left: -50px;
	}
	
	.z-loading-wrap img {
		width: 60px;
		height: 60px;
	}
	</style>
	<script>var _urlPath = "${ctx}/";</script>
    <script type="text/javascript"> window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-1.12.4.min.js'>"+"<"+"/script>"); </script>
    <link href="${ctx}/assets/js/colorpicker/jquery.bigcolorpicker.css" rel="stylesheet">
    <script src="${ctx}/assets/js/colorpicker/jquery.bigcolorpicker.js"></script>
    <script>
        // 影藏popover
        function hideJwpopover(){
            $('.jwpopover').each(function(index, obj){
                $(obj).webuiPopover('hide');
            });
        }
        $.ajaxSetup({
            beforeSend:function(XMLHttpRequest){
                hideJwpopover();
            }
        });
        $(function(){ 
        	 $(document).ajaxStart(function () {
        	$(".z-loading-wrap").show()
        })
        	 
       $(document).ajaxComplete(function () {
        	$(".z-loading-wrap").hide()
        })
        });
    </script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
	<script src="${ctx}/assets/js/jquery.bootstrap-duallistbox.js"></script>
    <script src="${ctx}/assets/js/jquery/jquery.webui-popover.js"></script>
    <script src="${ctx}/assets/js/grid/spagination.js"></script>
    <script src="${ctx}/assets/js/grid/sgrid.js"></script>
    <script src="${ctx}/assets/js/grid/model.js"></script>
    <script src="${ctx}/assets/js/grid/utils.js"></script>
    <script src="${ctx}/assets/js/util/JsUtil.js"></script>
    <script src="${ctx}/assets/js/util/form.js"></script>
    <!-- Pixel Admin's javascripts -->
    <script src="${ctx}/assets/js/pixel-admin.min.js"></script>
    <script src="${ctx}/assets/js/quote.js"></script>
    <script src="${ctx}/assets/js/morris/raphael-min.js"></script>
    <script src="${ctx}/assets/js/morris/morris.min.js"></script>
    <script src="${ctx}/assets/js/util/ajaxupload.3.6.js"></script>
    <script src="${ctx}/assets/js/util/imgbox.js"></script>
    <script src="${ctx}/assets/js/util/md5.js"></script>
	<script src="${ctx}/assets/js/bootstrap-fileinput/js/fileinput.min.js"></script>
	<script src="${ctx}/assets/js/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
	<script src="${ctx}/assets/js/ueditor/ueditor.config.js" type="text/javascript"></script>
	<script src="${ctx}/assets/js/ueditor/ueditor.all.min.js" type="text/javascript"> </script>
	<script src="${ctx}/assets/js/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		<script src="${ctx}/assets/javascripts/ie.min.js"></script>
	<![endif]-->

	<style>
		.page-header .pull-right {
			padding-top: 5px;
		}
		.page-header .pull-right > * {
			display: inline-block;
			vertical-align:middle;
		#iconview{display:none;}
		#imgview{display:none;}
		.form-group{margin-bottom: unset;}
	</style>
 <script>
	var init = [];
	init.push(function () {
		$('#timeline-centered').switcher();
		$('#timeline-centered').on($('html').hasClass('ie8') ? "propertychange" : "change", function () {
			var turn_on = $(this).is(':checked');
			if (turn_on) {
				$('.timeline').addClass('centered');
			} else {
				$('.timeline').removeClass('centered');
			}
		});
	});
</script>
