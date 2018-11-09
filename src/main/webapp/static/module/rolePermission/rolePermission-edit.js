layui.config({
	base : '/mkw-colligate/static/extends/',
	version : new Date().getTime()
});
layui.use([ 'authtree', 'form' ], function() {
	var $ = layui.jquery;
	var authtree = layui.authtree;
	var form = layui.form;

	var rolePermissionList = $("#rolePermissionList").html();
	if (rolePermissionList.length > 0) {
		rolePermissionList = JSON.parse(rolePermissionList);
	}

	authtree.render('#LAY-auth-tree-index', rolePermissionList, {
		inputname : 'permisssionId[]',
		layfilter : 'lay-check-auth',
		openall : true
	});
	
	form.on('submit(submitBtn)', function(data) {
		var json = new Object();;
		json.id = data.field.id;
		json.name = data.field.name;
		json.status = 1;
		json.permissionIds = authtree.getChecked('#LAY-auth-tree-index');
		var url = json.id.length == 0 ? '/mkw-colligate/rolePermission/add.do' : '/mkw-colligate/rolePermission/edit.do';debugger;
		execute(url, json, function(result) {
			if('403' == result.code) {
				alertify(2, '角色名称已存在');
			} else {
				alertify(1, '保存成功', function () {
					// 关闭所有弹框
					closer();
					flushParentTable();
				});
			}
		});
		
		return false;
	});
});