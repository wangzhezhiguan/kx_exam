// 获取内置对象
var $, layer;
layui.use([ 'jquery', 'layer' ], function() {
	$ = layui.jquery;
	layer = layui.layer;
});

var width = window.screen.width;
var height = window.screen.height;
var colsWidth = width - 250;

function toStr(obj) {
	var str = "";
	for ( var key in obj) {
		str += key;
		str += "=";
		str += obj[key];
		str += "&";
	}
	return str;
}

/**
 * 下载文件
 * @param url
 * @param filename
 */
function downloadFile(url, filename) {
    
    var $a = document.createElement('a');
    $a.setAttribute("href", url);
    $a.setAttribute("download", filename);


    var evObj = document.createEvent('MouseEvents');
    evObj.initMouseEvent('click', true, true, window, 0, 0, 0, 0, 0, false, false, true, false, 0, null);
    $a.dispatchEvent(evObj);
}

/**
 * websocket 消息回调
 * 
 * @param callback
 */
function onmessage(callback) {
	var websocket;
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://" + window.location.host + "/mkw-merchant/webSocketHandler.do");
	} else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://" + window.location.host + "/mkw-merchant/webSocketHandler.do");
	} else {
		websocket = new SockJS("http://" + window.location.host + "/mkw-merchant/sockjs/webSocketHandler.do");
	}
	websocket.onopen = function(evnt) {
	};
	websocket.onerror = function(evnt) {
	};
	websocket.onclose = function(evnt) {
	};
	websocket.onmessage = function(evnt) {
		var obj = JSON.parse(evnt.data);
		callback(obj);
	};
}

/**
 * 弹出框
 * 
 * @param type
 *            1成功、2失败、3询问
 * @param msg
 *            提示内容
 * @param callback
 *            回调
 */
function alertify(type, msg, callback) {
	if (type == 1) {
		layer.alert(msg, {
			icon : 1,
			title : '温馨提示'
		}, callback);
	} else if (type == 2) {
		layer.alert(msg, {
			icon : 2,
			title : '温馨提示',
			maxHeight : 300
		}, callback);
	} else if (type == 3) {
		layer.confirm(msg, {
			icon: 3, 
			title:'温馨提示'
		}, callback);
	}
}

/**
 * type: open、close
 * 
 * @param type
 */
function loading(type) {
	if ('open' === type) {
		layer.load(2);
	}
	if ('close' === type) {
		layer.closeAll('loading');
	}
}

// 打开满屏弹框
function openPager(url, title, callback) {
	var index = layer.open({
		type : 2,
		title : title,
		content : url,
		end : callback
	});
	layer.full(index);
}

// 关闭父窗口下所有弹框
function closer() {
	layer.closeAll(); // 挂不比当前页面的所有弹框
	var index = parent.layer.getFrameIndex(window.name); // 获取父窗口索引
	parent.layer.close(index); // 关闭父窗口弹框
}

//刷新table
function flushTable(params, current) {
	if(undefined == params || null == params) {
		params = {};
	}
	if(undefined == current || null == current) {
		var obj = $(".layui-laypage-skip").find("input")[0];
		current = $(obj).val();
	}
	
	layui.table.reload('myTable', {
		where: params,
		page: {
			curr: current
		}
	});
}

/**
 * 查询参数缓存
 */
var searchCache = {};
function flushParentTable() {
	var params = window.parent.searchCache;
	var obj = $(".layui-laypage-skip", parent.document).find("input")[0];
	var current = undefined == $(obj).val() ? 1 : $(obj).val();
	console.log(parent.layui.table);
	parent.layui.table.reload('myTable', {
		where: params,
		page: {
			curr: current
		}
	});
}

//刷新父页面
function reloadParent() {
	console.log(window.parent.currentCache);
	console.log(window.parent.searchCache);
	console.log(parent.layui.table);
	window.parent.location.reload();
}

/**
 * post请求(默认异步)
 * 
 * @param url
 * @param data
 * @param callback
 * @returns {Promise}
 */
function execute(url, params, callback, async) {
	var paramJSON = JSON.stringify({
		"requestData" : params
	})
	$.ajax({
		url : url,
		data : paramJSON,
		type : "POST",
		async : async == null ? true : async,
		dataType : "JSON",
		contentType : "application/json;charset=utf-8",
		success : function(responseData) {
			if (responseData.success == true && responseData.code == '555555') {
				layer.alert("登录已超时, 请重新登录！");
				top.location.href = top.location.href;
			} else if (responseData.success == true
					&& responseData.code == '555000') {
				layer.alert("权限不足, 操作失败！");
			} else if (responseData.success == true) {
				callback(responseData);
			} else {
				layer.alert("服务异常", {
					icon : 2,
					title : '温馨提示'
				});
			}
		}
	});
}

/**
 * 设置cookies(默认7天)
 * 
 * @param key
 * @param value
 */
function setCookie(key, value) {
	var Days = 7;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = key + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

/**
 * 读取cookies
 * 
 * @param key
 * @returns
 */
function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

/**
 * 删除cookies
 * 
 * @param name
 */
function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

String.prototype.endWith = function(s) {
	if (s == null || s == "" || this.length == 0 || s.length > this.length)
		return false;
	if (this.substring(this.length - s.length) == s)
		return true;
	else
		return false;
	return true;
}

String.prototype.startWith = function(s) {
	if (s == null || s == "" || this.length == 0 || s.length > this.length)
		return false;
	if (this.substr(0, s.length) == s)
		return true;
	else
		return false;
	return true;
}

/**
 * 广东21个地市
 */
var citys = [ {
	label : '广州市',
	value : '广州市'
}, {
	label : '韶关市',
	value : '韶关市'
}, {
	label : '深圳市',
	value : '深圳市'
}, {
	label : '珠海市',
	value : '珠海市'
}, {
	label : '汕头市',
	value : '汕头市'
}, {
	label : '佛山市',
	value : '佛山市'
}, {
	label : '江门市',
	value : '江门市'
}, {
	label : '湛江市',
	value : '湛江市'
}, {
	label : '茂名市',
	value : '茂名市'
}, {
	label : '肇庆市',
	value : '肇庆市'
}, {
	label : '惠州市',
	value : '惠州市'
}, {
	label : '梅州市',
	value : '梅州市'
}, {
	label : '汕尾市',
	value : '汕尾市'
}, {
	label : '河源市',
	value : '河源市'
}, {
	label : '阳江市',
	value : '阳江市'
}, {
	label : '清远市',
	value : '清远市'
}, {
	label : '东莞市',
	value : '东莞市'
}, {
	label : '中山市',
	value : '中山市'
}, {
	label : '潮州市',
	value : '潮州市'
}, {
	label : '揭阳市',
	value : '揭阳市'
}, {
	label : '云浮市',
	value : '云浮市'
} ];