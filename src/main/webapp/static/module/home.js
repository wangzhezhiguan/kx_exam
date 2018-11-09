/** index.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */

var tab;

layui.config({
	base: '/mkw-colligate/static/extends/',
    version: new Date().getTime()
}).use(['element', 'layer', 'navbar', 'tab'], function () {
    var element = layui.element,
        $ = layui.jquery,
        layer = layui.layer,
        navbar = layui.navbar();
    tab = layui.tab({
        elem: '.admin-nav-card',
        contextMenu: true,
        autoRefresh: true,
        closeBefore: function (obj) {
            return true;
        }
    });
    
	var flag = 0, t1, notReadCount;
    function showMsg() {
    	if (0 == flag) {
	    	$("#messageCount").css("background-color","#FFFFFF");
	    	flag = 1;
    	}else{
	    	$("#messageCount").css("background-color","#FF5722");
	    	flag = 0;
    	}
    }
    function checkShow(open) {
    	if (open) {
    		t1 = window.setInterval(function () {
        		notReadCount = $("#messageCount").html();
        		if (parseInt(notReadCount) != 0) {
        			showMsg();
        		} else {
        			$("#messageCount").css("background-color","#FF5722");
        			window.clearInterval(t1);
        		}
        	}, 500);
    	} else {
    		$("#messageCount").css("background-color","#FF5722");
			window.clearInterval(t1);
    	}
    }
    // 闪烁未读消息
    //checkShow(true);
    // 定时获取未读消息数量
    /*window.setInterval(function () {
    	checkShow(false);
    	execute('/mkw-colligate/message/findCount.do', {}, function(data) {
			$("#messageCount").html(data.responseData);
			checkShow(true);
		});
	}, 60000);*/
    
    //iframe自适应
    $(window).on('resize', function () {
        var $content = $('.admin-nav-card .layui-tab-content');
        $content.height($(this).height() - 121);
        $content.find('iframe').each(function () {
            $(this).height($content.height());
        });
    }).resize();

    //设置navbar
    navbar.set({
        spreadOne: true,
        elem: '#admin-navbar-side',
        cached: true,
        data: navs
		/*cached:true,
		url: 'datas/nav.json'*/
    });
    //渲染navbar
    navbar.render();
    //监听点击事件
    navbar.on('click(side)', function (data) {
    	// 删除所有老的Tab
    	tab.removeAllTab();
    	// 打开的新的Tab
    	$.each(navs, function(i, item){
    		if(data.field.title === item.title) {
    			$.each(item.children, function(a, b){
        			tab.tabAdd(b);
    	    	});
    		}
    	});
    });
    //清除缓存
    $('#clearCached').on('click', function () {
        navbar.cleanCached();
        layer.alert('清除完成!', { icon: 1, title: '系统提示' }, function () {
            location.reload();//刷新
        });
    });

    $('.admin-side-toggle').on('click', function () {
        var sideWidth = $('#admin-side').width();
        if (sideWidth === 200) {
            $('#admin-body').animate({
                left: '0'
            }); //admin-footer
            $('#admin-footer').animate({
                left: '0'
            });
            $('#admin-side').animate({
                width: '0'
            });
        } else {
            $('#admin-body').animate({
                left: '200px'
            });
            $('#admin-footer').animate({
                left: '200px'
            });
            $('#admin-side').animate({
                width: '200px'
            });
        }
    });
    $('.admin-side-full').click(function() {
        var docElm = document.documentElement;
        //W3C  
        if (docElm.requestFullscreen) {
            docElm.requestFullscreen();
        }
        //FireFox  
        else if (docElm.mozRequestFullScreen) {
            docElm.mozRequestFullScreen();
        }
        //Chrome等  
        else if (docElm.webkitRequestFullScreen) {
            docElm.webkitRequestFullScreen();
        }
        //IE11
        else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
        layer.msg('按Esc即可退出全屏');
    });
    
    $('#myMessage').click(function() {
        tab.tabAdd({
            href: '/mkw-colligate/message/list-message.do',
            icon: 'fa-bell-o',
            title: '消息通知'
        });
    });

    $('#userinfo').click(function() {
        tab.tabAdd({
            href: '/mkw-colligate/account/edit-userinfo.do',
            icon: 'fa-user-circle',
            title: '个人信息'
        });
    });
    
    $('#repass').click(function() {
        tab.tabAdd({
            href: '/mkw-colligate/account/edit-password.do',
            icon: 'fa-key',
            title: '修改密码'
        });
    });
    
    $('#logout').click(function() {
    	top.location.href = "/mkw-colligate/logout.do";
    });
});