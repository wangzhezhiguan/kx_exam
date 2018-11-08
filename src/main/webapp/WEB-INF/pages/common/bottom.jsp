<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
    init.push(function () {

    });
    window.PixelAdmin.start(init);

    $(function(){
        $('.mm-dropdown li').bind('click',function(){
            $('.mm-dropdown li').removeClass('active');
            $('.mmc-dropdown-delay li').removeClass('active');
            $(this).addClass('active');
        });
        $('.add-tooltip').tooltip();
    })

	function logout() {
		$.Cfm("确定注销登录?", function() {
			$.ajax({
				url : '${ctx}/admin/logout',
				type : "post",
				dataType : "json",
				success : function(req) {
					if (req.retcode == 1) {
						window.location.href = "${ctx}/";
					} else {
						$.Err("退出失败！");
					}
				},
				error : function() {
					$.Err("系统异常！");
				}
			});
		});
	}
</script>
