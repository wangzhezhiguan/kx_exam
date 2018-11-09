layui.define(['form', 'upload', 'tree', 'laydate', 'layedit'], function(exports) {
	var $ = layui.jquery;
	var form = layui.form;
	var upload = layui.upload;
	var tree = layui.tree;
	var laydate = layui.laydate;
	var layedit = layui.layedit;

	// 定义参数
	var Xform = function() {
		/*
			元素说明 
			必须的字段：elem、buttons、columns
		*/
		this.config = {
			elem: '',
			/*
				元素说明 
				必须的字段：id、name
			*/
			buttons: [{
				id: '', //必须
				label: '',
				color: '',
				icon: ''
			}],
			/*
				元素说明 
				【返回结果：	string】hidden类型必须的字段：type、name
				【返回结果：	string】text类型必须的字段：type、name、label
				【返回结果：	string】password类型必须的字段：type、name、label
				【返回结果：	string】select类型必须的字段：type、name、label、selectMaps，其中selectMaps为数组且必须的字段：label、value
				【返回结果：	array 】checkbox类型必须的字段：type、name、label、checkboxMaps，其中checkboxMaps为数组且必须的字段：label、value
				【返回结果：	string】radio类型必须的字段：type、name、label、radioMaps，其中radioMaps为数组且必须的字段：label、value
				【返回结果：	array 】file类型必须的字段：type、name、label、size、exts
				【返回结果：	string】tree类型必须的字段：type、name、label、status、nodes, 其中nodes为数组且必须的字段：id、value、status、children
			*/
			columns: [{
				type: '',
				name: '',
				label: '',
				selectMaps: [{
					label: '',
					value: '',
					selected: false
				}],
				checkboxMaps: [{
					label: '',
					value: '',
					checked: false
				}],
				radioMaps: [{
					label: '',
					value: '',
					checked: false
				}],
				size: 1024, //1M
				exts: 'jpg|png|gif|bmp|jpeg',
				status: '',
				required: false,
				disabled: false
			}],
			formData: null,
			readOnly: false
		};
	};

	Xform.prototype.init = function(options, callback) {
		var that = this;
		$.extend(true, that.config, options);
		var _config = that.config;

		// 添加html内容
		var appentHtml = '<form class="layui-form" style="padding-top: 10px; padding-right: 10px;">';
		$.each(_config.columns, function(i, item) {
			if(item != undefined) {
				if(item.type === 'hidden') {
					appentHtml += '<input type="' + item.type + '" id="' + item.name + '" name="' + item.name + '">';
				} else if(item.type === 'text' || item.type === 'password') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="' + item.type + '" id="' + item.name + '" name="' + item.name + '" autocomplete="off" '+ (item.disabled ? 'disabled' : '') +' placeholder="请输入' + item.label + '" class="layui-input">';
					if(item.openText == true) {
						appentHtml += '<span id="' + item.name + '_Text">'+ (item.text != undefined ? item.text : '') +'</span>';
					}
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'select') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<select id="' + item.name + '" name="' + item.name + '" lay-filter="' + item.name + '">';
					appentHtml += '<option value="">请选择' + item.label + '</option>';
					appentHtml += getSelectHtml(item.selectMaps);
					appentHtml += '</select>';
					if(item.openText == true) {
						appentHtml += '<span id="' + item.name + '_Text">'+ (item.text != undefined ? item.text : '') +'</span>';
					}
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'checkbox') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += getCheckBoxHtml(item.name, item.checkboxMaps);
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'radio') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += getRadioHtml(item.name, item.radioMaps);
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'file') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<div class="layui-upload-drag" style="float:left" id="upload_' + item.name + '">';
					appentHtml += '<i class="layui-icon"></i>';
					appentHtml += '<p>点击上传，或将文件拖拽到此处<video id="videoInfo" style="display:none;" controls="controls"></video></p>';
					appentHtml += '</div>';
					appentHtml += '<div id="showUpload_' + item.name + '" style="width:350px;height:133px;margin-left:20px;border: 1px dashed #e2e2e2;overflow-y:scroll;float:left;">';
					appentHtml += '</div>';
					if(item.openText == true) {
						appentHtml += '<span id="' + item.name + '_Text">'+ (item.text != undefined ? item.text : '') +'</span>';
					}
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'tree') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<div class="layui-unselect layui-form-select downpanel" id="selectTree_' + item.name + '">';
					appentHtml += '<div class="layui-select-title">';
					appentHtml += '<span class="layui-input layui-unselect" style="line-height: 38px;" id="tree_' + item.name + '">请选择' + item.label + '</span>';
					appentHtml += '<input type="hidden" name="' + item.name + '" id="' + item.name + '">';
					appentHtml += '<i class="layui-edge"></i>';
					appentHtml += '</div>';
					appentHtml += '<dl class="layui-anim layui-anim-upbit">';
					appentHtml += '<dd style="background-color: inherit;">';
					appentHtml += '<ul id="classtree_' + item.name + '"></ul>';
					appentHtml += '</dd>';
					appentHtml += '</dl>';
					appentHtml += '</div>';
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'date') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="text" readonly="" id="' + item.name + '" name="' + item.name + '" placeholder="请选择' + item.label + '" class="layui-input">';
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'datetime') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="text" readonly="" id="' + item.name + '" name="' + item.name + '" placeholder="请选择' + item.label + '" class="layui-input">';
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'editor') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="text" readonly="" id="' + item.name + '" name="' + item.name + '" placeholder="请选择' + item.label + '" class="layui-input">';
					appentHtml += '<textarea id="' + item.name + '" data-index="" style="display: none;"></textarea>';
					appentHtml += '</div>';
					appentHtml += '</div>';
				}  else if(item.type === 'datelimit') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="text" readonly="" id="' + item.name + '" name="' + item.name + '" placeholder="请选择' + item.label + '" class="layui-input">';
					appentHtml += '</div>';
					appentHtml += '</div>';
				} else if(item.type === 'datetimelimit') {
					appentHtml += '<div class="layui-form-item">';
					appentHtml += '<label class="layui-form-label">' + item.label + '</label>';
					appentHtml += '<div class="layui-input-block">';
					appentHtml += '<input type="text" readonly="" id="' + item.name + '" name="' + item.name + '" placeholder="请选择' + item.label + '" class="layui-input">';
					appentHtml += '</div>';
					appentHtml += '</div>';
				}
			}
		});
		// 非只读时追加点击按钮
		if(!_config.readOnly) {
			appentHtml += '<div class="layui-form-item">';
			appentHtml += '<div class="layui-input-block">';
			$.each(_config.buttons, function(i, item) {
				appentHtml += '<button id="' + item.id + '" lay-submit lay-filter="' + item.id + '" class="layui-btn ' + item.color + '">';
				if(item.icon != undefined) {
					appentHtml += '<i class="layui-icon">' + item.icon + '</i>';
				}
				appentHtml += item.label;
				appentHtml += '</button>';
			});
			appentHtml += '</div>';
			appentHtml += '</div>';
		}
		appentHtml += '</form>';

		// 添加html到页面
		$(_config.elem).html(appentHtml);

		// 渲染上传
		flushUploadAndTree();

		// 渲染form
		form.render();

		function flushUploadAndTree() {
			var $this = $(this);
			$.each(_config.columns, function(i, item) {
				if(item != undefined) {
					if(item.type === 'file') {
						var uploadOption = {
							elem: '#upload_' + item.name,
							url: '/mkw-colligate/file/upload.do',
							accept: 'file',
							exts: item.exts,
							size: item.size,
							auto: false,
							done: function(res) {
								layer.closeAll('loading');
								if (res.success == true && res.code == '555555') {
									layer.alert("登录已超时, 请重新登录！");
									top.location.href = top.location.href;
								} else if (res.success == true && res.code == '555000') {
									layer.alert("权限不足, 操作失败！");
								} else {
									var str = '<div style="width:100%;float:left;">';
									str += res.fileName;
									str += '<a style="cursor: pointer;float:right; color:#FF5722;" herf="javascript:void(0);" fileUrl="'+ res.fileUrl +'" fileName="'+ res.fileName +'">删除</a>';
									str += '</div>';
									$("#showUpload_" + item.name).append(str);
	
									$("#showUpload_" + item.name).find("a").each(function() {
										$(this).click(function() {
											$(this).closest("div").remove();
										});
									});
								}
							},
							before: function(obj){
								layer.load(2);
							},
							choose: function (obj) {
								obj.preview(function (index, file, result) {
									// 限制视屏不能大于150秒
									if (file.type.indexOf("video") != -1) {
										var url = URL.createObjectURL(file);
										$('#videoInfo').attr("src", url);
										var videoInfo = document.getElementById("videoInfo");
										setTimeout(function(){  
											var times = parseInt(videoInfo.duration);
											if(times > 150) {
												layer.alert('视频不得超过150秒', {icon : 2, title : '温馨提示'});
											} else {
												obj.upload(index, file);
											}
							            }, 1000); 
									} else if (file.type.indexOf("image") != -1) { 
										if(file.size > 4*1024*1024) {
											layer.alert('图片不得超过4M', {icon : 2, title : '温馨提示'});
										} else {
											obj.upload(index, file);
										}
									} else {
										obj.upload(index, file);
									}
								});
				            }
						};
						upload.render(uploadOption);
					} else if(item.type === 'tree') {
						if(item.nodes != undefined && item.nodes.length > 0) {
							item.nodes.unshift({ name: '请选择' + item.label, id: '', status: item.status, children: [] });
						} else {
							item.nodes = [{ name: '请选择' + item.label, id: '', status: item.status, children: [] }];
						}
						tree({
							elem: '#classtree_' + item.name,
							nodes: item.nodes,
							click: function(node) {
								if(item.status == undefined || (item.status != undefined && item.status == node.status)) {
									$("#tree_" + item.name).html(node.name);
									$("#" + item.name).val(node.id);
									$("#selectTree_" + item.name).removeClass("layui-form-selected");
									callback(item.name);
								} 
							}
						});

						$("#selectTree_" + item.name).on("click", ".layui-select-title", function(e) {
							$(".layui-form-select").not($(this).parents(".layui-form-select")).removeClass("layui-form-selected");
							$(this).parents(".downpanel").toggleClass("layui-form-selected");
							layui.stope(e);
						}).on("click", "dl i", function(e) {
							layui.stope(e);
						});
					} else if(item.type === 'date') {
						laydate.render({
						    elem: '#' + item.name,
						    type: 'date',
						    trigger: 'click'
						});
					} else if(item.type === 'datetime') {
						laydate.render({
						    elem: '#' + item.name,
						    type: 'datetime',
						    trigger: 'click'
						});
					} else if(item.type === 'editor') {
						layedit.set({
							uploadImage: {url: '/mkw-colligate/file/image.do'}
						});
						var index = layedit.build(item.name);
						$("#" + item.name).attr("data-index", index);
					} else if(item.type === 'datelimit') {
						laydate.render({
						    elem: '#' + item.name,
						    type: 'date',
						    trigger: 'click',
						    range: '至'
						});
					} else if(item.type === 'datetimelimit') {
						laydate.render({
						    elem: '#' + item.name,
						    type: 'datetime',
						    trigger: 'click',
						    range: '至'
						});
					}
				}
			});
		}

		function getRadioHtml(bigName, maps) {
			var radioHtml = '';
			$.each(maps, function(i, params) {
				radioHtml += '<input type="radio" lay-filter="' + bigName + '" value="' + params.value + '" name="' + bigName + '" title="' + params.label + '" ' + (params.checked ? 'checked' : '') + '>';
			});
			return radioHtml;
		}

		function getCheckBoxHtml(bigName, maps) {
			var checkBoxHtml = '';
			$.each(maps, function(i, params) {
				checkBoxHtml += '<input type="checkbox" lay-filter="' + bigName + '" value="' + params.value + '" name="' + bigName + '" title="' + params.label + '" ' + (params.checked ? 'checked' : '') + '>';
			});
			return checkBoxHtml;
		}

		function getSelectHtml(maps) {
			var optionHtml = '';
			$.each(maps, function(i, params) {
				optionHtml += '<option value="' + params.value + '" ' + (params.selected ? 'selected' : '') + '>' + params.label + '</option>';
			});
			return optionHtml;
		}

		// 设置初始化表单数据
		if(_config.formData != null) {
			that.setFormData(_config.formData);
		}

		// 定义监听button事件
		$.each(_config.buttons, function(i, item) {
			var $this = $(this);
			form.on('submit(' + item.id + ')', function(data) {
				callback(item.id);
				return false;
			});
		});
		// 定义监听input事件
		$(_config.elem).find("input").each(function() {
			var $this = $(this);
			$(this).on('change', function() {
				callback($(this)[0].name);
			});
		});
		// 定义监听select事件
		$.each(_config.columns, function(i, item) {
			var $this = $(this);
			if(item.type == 'select') {
				form.on('select(' + item.name + ')', function(data) {
					callback(item.name);
				});
			}
		});
		// 定义监听checkbox、radio事件
		$.each(_config.columns, function(i, item) {
			var $this = $(this);
			if(item.type == 'checkbox') {
				form.on('checkbox(' + item.name + ')', function(data) {
					callback(item.name);
				});
			} else if(item.type == 'radio') {
				form.on('radio(' + item.name + ')', function(data) {
					callback(item.name);
				});
			}
		});
	}
	
	Xform.prototype.changeTreeData = function(name, nodes, callback) {
		var that = this;
		var _config = that.config;
		$.each(_config.columns, function(i, item) {
			if(item.name === name && item.type === 'tree') {
				item.nodes = nodes;
				
				// 清除树历史数据
				$("#classtree_" + item.name).html('');
				
				tree({
					elem: '#classtree_' + item.name,
					nodes: item.nodes,
					click: function(node) {
						if(item.status == undefined || (item.status != undefined && item.status == node.status)) {
							$("#tree_" + item.name).html(node.name);
							$("#" + item.name).val(node.id);
							$("#selectTree_" + item.name).removeClass("layui-form-selected");
							if(undefined != callback) {
								callback(item.name);
							}
						} 
					}
				});

				/*$("#selectTree_" + item.name).on("click", ".layui-select-title", function(e) {
					$(".layui-form-select").not($(this).parents(".layui-form-select")).removeClass("layui-form-selected");
					$(this).parents(".downpanel").toggleClass("layui-form-selected");
					layui.stope(e);
				}).on("click", "dl i", function(e) {
					layui.stope(e);
				});*/
			}
		});
		form.render();
	}

	/**
	 * 更新下拉列表数据
	 */
	Xform.prototype.changeSelectData = function(name, selectMaps) {
		var that = this;
		var _config = that.config;
		$.each(_config.columns, function(i, item) {
			if(item.name === name && item.type === 'select') {
				// 重新定位复制
				_config.columns[i].selectMaps = selectMaps;

				// 重新添加内容
				var optionHtml = '<option value="">请选择' + item.label + '</option>';
				$.each(selectMaps, function(i, params) {
					optionHtml += '<option value="' + params.value + '" ' + (params.selected ? 'selected' : '') + '>' + params.label + '</option>';
				});
				$("#" + name).html(optionHtml);
			}
		});
		form.render();
	}

	/**
	 * 获取form表单数据
	 */
	Xform.prototype.getFormData = function() {
		var that = this;
		var _config = that.config;

		var data = {};
		$.each(_config.columns, function(i, item) {
			if(item.type === 'checkbox') {
				var chk_value = [];
				$('input[name="' + item.name + '"]:checked').each(function() {
					chk_value.push($(this).val());
				});
				data[item.name] = chk_value.length == 0 ? null : chk_value;
			} else if(item.type === 'radio') {
				$('input[name="' + item.name + '"]:checked').each(function() {
					var temp = $(this).val();
					data[item.name] = temp.length == 0 ? null : temp;
				});
			} else if(item.type === 'file') {
				var files = [];
				$("#showUpload_" + item.name).find("a").each(function() {
					files.push({
						fileName: $(this).attr("fileName"),
						fileUrl: $(this).attr("fileUrl")
					});
				});
				data[item.name] = files.length == 0 ? null : files;
			} else if(item.type === 'editor') {
				var index = $("#" + item.name).attr("data-index");
				var content = layedit.getContent(index);
				data[item.name] = content.length == 0 ? null : content;
			} else {
				var temp = $("#" + item.name).val();
				data[item.name] = temp.length == 0 ? null : temp;
			}
		});
		return data;
	}

	/**
	 * 设置form表单数据
	 */
	Xform.prototype.setFormData = function(formData) {
		var that = this;
		var _config = that.config;

		for(var key in formData) {
			var obj = that.getcolumnOjb(key);
			if (null != obj) {
				var type = obj.type;
				if(type === 'text' || type === 'hidden' || type === 'select' || type === 'password') {
					$("#" + key).val(formData[key]);
				} else if(type === 'checkbox') {
					$('input[name="' + key + '"]').each(function() {
						var index = $.inArray($(this).val(), formData[key]);
						if(index > -1) {
							$(this).attr('checked', true);
						}
					});
				} else if(type === 'radio') {
					$('input[name="' + key + '"]').each(function() {
						if($(this).val() == formData[key]) {
							$(this).attr('checked', true);
						}
					});
				} else if(type === 'file') {debugger;
					var array = formData[key];
					for(var i = 0; i < array.length; i++) {
						var res = array[i];
						var str = '<div style="width:100%;float:left;">';
						str += res.fileName;
						str += '<a style="cursor: pointer;float:right; color:#FF5722;" herf="javascript:void(0);" fileUrl="'+ res.fileUrl +'" fileName="'+ res.fileName +'">删除</a>';
						str += '</div>';
						$("#showUpload_" + key).append(str);
					}

					$("#showUpload_" + key).find("a").each(function() {
						$(this).click(function() {
							$(this).closest("div").remove();
						});
					});
				} else if(type === 'tree') {
					if(undefined == obj.nodes || null == obj.nodes) {
						console.log("字段名为" + obj.name + "的nodes数据未找到1");
					} else {
						var label = findNodesName(obj.nodes, formData[key], obj.status);
						if (undefined == label || label.length == 0) {
							console.log("字段名为" + obj.name + "的nodes数据未找到2");
						} else {
							$("#tree_" + key).html(label);
							$("#" + key).val(formData[key]);
						}
					}
				} else if(type === 'editor') {
					$("#" + key).val(formData[key]);
					layedit.set({
						uploadImage: {url: '/mkw-colligate/file/image.do'}
					});
					var index = layedit.build(key);
					$("#" + key).attr("data-index", index);
				} else if(type === 'date' ) {
					laydate.render({
					    elem: '#' + key,
					    value: formData[key],
					    isInitValue: true,
					    type: 'date',
					    trigger: 'click'
					});
				} else if(type === 'datetime' ) {
					laydate.render({
					    elem: '#' + key,
					    value: formData[key],
					    isInitValue: true,
					    type: 'datetime',
					    trigger: 'click'
					});
				} else if(type === 'datelimit' ) {
					laydate.render({
					    elem: '#' + key,
					    value: formData[key],
					    isInitValue: true,
					    type: 'date',
					    trigger: 'click',
					    range: '至'
					});
				} else if(type === 'datetimelimit' ) {
					laydate.render({
					    elem: '#' + key,
					    value: formData[key],
					    isInitValue: true,
					    type: 'datetime',
					    trigger: 'click',
					    range: '至'
					});
				} 
			}
		}
		form.render();

		// 递归获取节点名称
		function findNodesName(arr, id, status) {
			for(var i = 0; i < arr.length; i++) {
				if (undefined == status || (undefined != status && arr[i].status == status)) {
					if(arr[i].id == id) {
						return arr[i].name;
					} else if(undefined != arr[i].children && arr[i].children.length > 0) {
						return findNodesName(arr[i].children, id, status);
					}
				} 
			}
		}
	}

	/**
	 * 获取input类型
	 * @param {Object} key
	 */
	Xform.prototype.getcolumnOjb = function(key) {
		var that = this;
		var _config = that.config;

		var ojb = null;
		$.each(_config.columns, function(i, item) {
			if(item.name == key) {
				ojb = item;
			}
		});
		return ojb;
	}

	/**
	 * 清理form表单数据
	 */
	Xform.prototype.clearFormData = function() {
		var that = this;
		var _config = that.config;

		$.each(_config.columns, function(i, item) {
			if(item.type === 'text' || item.type === 'select' || item.type === 'password') {
				$("#" + item.name).val('');
			} else if(item.type === 'file') {
				$("#showUpload_" + item.name).find("a").each(function() {
					$(this).closest("div").remove();//删除ui
				});
				$("#" + item.name).val('');
			} else if(item.type === 'tree') {
				$("#tree_" + item.name).html(item.nodes[0].name);
				$("#" + item.name).val(item.nodes[0].id);
			}  else if(item.type === 'radio' || item.type === 'checkbox') {
				$('input[name="' + item.name + '"]').each(function() {
					$(this).attr('checked', false);
				});
			} 

		});
		form.render();
	}
	
	/**
	 * 验证数据
	 * @param data
	 * @param arr
	 * @returns {Boolean}
	 */
	Xform.prototype.verify = function () {
		var that = this;
        var _config = that.config;
        
		var data = that.getFormData();
		var errorNum = 0;
		$.each(_config.columns, function(i, item) {
			if(item.required) {
				if(data[item.name] == undefined || data[item.name] == null) {
					layer.alert(item.label + '不得为空', {icon : 2, title : '温馨提示'});
					errorNum += 1;
					return false;
				} 
			}
			
		});
		return errorNum == 0 ? true : false;
	}

	/**
	 * 设置
	 * @param {Object} options
	 */
	Xform.prototype.set = function(options) {
		var that = this;
		$.extend(true, that.config, options);
		return that;
	};

	// 声明时实例化对象
	var xform = new Xform();
	exports('xform', function(options) {
		return xform.set(options);
	});
});