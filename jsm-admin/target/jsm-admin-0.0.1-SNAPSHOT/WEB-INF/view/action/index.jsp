<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<style>
	.selectMenu{color:#FFFFFF;background-color:#428bca;}
</style>
<div class="row">
	<div class="form-inline"><div class="form-group"> ${tools_action } </div></div>
	<div class="col-sm-5">
		<div class="test treeview">
			<ul class="list-group" id="menuContent">
			</ul>
		</div>
	</div>
	<div class="col-sm-7">
		<table id="dataTable"></table>
	</div>
</div>

<%@include file="../common/footer.jsp"%>
<div id="editModel" style="display: none;" class="col-sm-12">
	<form class="form-horizontal" id="editForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">名称</label>
			<div class="col-sm-10">
				<input class="form-control" name="name" type="text"> 
				<input id="id" name="id" type="hidden" />
				<input id="menuid" name="menuid" type="hidden" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">功能函数</label>
			<div class="col-sm-10">
				<input class="form-control" name="action" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">按钮样式</label>
			<div class="col-sm-10">
				<input class="form-control" name="style" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">url</label>
			<div class="col-sm-10">
				<input class="form-control" name="url" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">图标样式</label>
			<div class="col-sm-10">
				<input class="form-control" name="icon" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">排序字</label>
			<div class="col-sm-10">
				<input class="form-control" name="goorder" type="number">
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
var selectMenu = null;

	var query = function(id) {
		//先销毁表格  
		$('#dataTable').bootstrapTable('destroy');
		//初始化表格,动态从服务器加载数据  
		$("#dataTable").bootstrapTable({
			method : "post",
			url : "${path}/menu_action/find_actions",
			striped : true, //表格显示条纹  
			pagination : true, //启动分页  
			pageSize : 10, //每页显示的记录数  
			pageNumber : 1, //当前第几页  
			pageList : [ 10, 20, 50, 100 ], //记录数可选列表  
			height : $(window).height() * 0.7,
			search : false, //是否启用查询  
			cache : false,
			selectItemName : "id",
			paginationPreText : '上一页',
			paginationNextText : '下一页',
			showColumns : false, //显示下拉框勾选要显示的列  
			showRefresh : false, //显示刷新按钮 ,
			clickToSelect : true,
			contentType : "application/x-www-form-urlencoded",
			columns : [ {
				radio : true,
			}, {
				field : 'name',
				title : '功能名称',

			}, {
				field : 'action',
				title : '功能函数',

			}, {
				field : 'icon',
				title : '图标',

			}, {
				field : 'style',
				title : '按钮样式',
			}, {
				field : 'url',
				title : '请求地址',
			}, {
				field : 'goorder',
				title : '排序',
			}, {
				field : 'id',
				title : '预览效果',
				formatter:function(value,row){
					return '<button class="'+row.style+'""><i class="'+row.icon+'"></i>'+row.name+'</button>';
				},
			}, ],
			sidePagination : "server", //表示服务端请求  
			queryParamsType : "undefined",

			queryParams : function queryParams(params) { //设置查询参数  
				var param = {
					pageNumber : params.pageNumber,
					pageSize : params.pageSize,
					"menu_id" : id,
				};
				return param;
			},
			onLoadSuccess : function(data) { //加载成功时执行  
				console.log(data);
				if (data.code && data.code != 0) {
					layer.alert(data.msg, {
						icon : 2
					});
				}
			},
			onLoadError : function() { //加载失败时执行  
				layer.msg("加载数据失败", {
					time : 1500,
					icon : 2
				});
			}
		});
	};
	$(function() {
		initMenus();
		query(-1);
	});

	var edit = function() {
		var vas = $("#dataTable").bootstrapTable('getSelections');
		if (vas.length < 1) {
			layer.alert("请选择需要修改的功能", {
				icon : 7
			});
			return;
		}
		$("#editModel input").val("");
		var id = vas[0].id
		post("${path}/menu_action/find_id", {
			id : id
		}, function(data) {
			$("#editModel [name='name']").val(data.data.name);
			$("#editModel [name='style']").val(data.data.style);
			$("#editModel [name='id']").val(data.data.id);
			$("#editModel [name='menuid']").val(data.data.menuid);
			$("#editModel [name='icon']").val(data.data.icon);
			$("#editModel [name='action']").val(data.data.action);
			$("#editModel [name='goorder']").val(data.data.goorder);
			$("#editModel [name='url']").val(data.data.url);
			var menuid = data.data.menuid;
			layer.open({
				type : 1,
				title : '修改功能',
				closeBtn : 1,
				anim : 2,
				area : [ '70%', '80%' ],
				shadeClose : false,
				content : $("#editModel"),
				btn : [ '保存', '取消' ],
				yes : function(index, layero) {
					$("#editForm").sub("${path}/menu_action/update", function(data) {
						layer.msg("操作成功", {
							icon : 1
						});
						query(menuid);
						layer.close(index);
					}, function(data) {
						layer.alert(data.msg, {
							icon : 2
						});
					})
				},
				no : function(index, layero) {
					layer.close(index);
				}
			});
		}, function(data) {
			layer.alert(data.msg, {
				icon : 2
			});
		}, "请稍后...");
	}

	var delete_action = function() {
		var vas = $("#dataTable").bootstrapTable('getSelections');
		if (vas.length < 1) {
			layer.alert("请选择需要删除的功能", {
				icon : 7
			});
			return;
		}
		var id = vas[0].id
		post("${path}/menu_action/del_action", {
			id : id
		}, function(data) {
			layer.alert('删除成功', {
				icon : 1
			});
			query(selectMenu);
		}, function(data) {
			layer.alert(data.msg, {
				icon : 2
			});
		}, "请稍后...");
	}

	var add = function() {
		if(selectMenu==null || selectMenu==''){
			layer.alert("请选择添加功能对应的菜单",{icon:7});
			return;
		}
		$("#editModel input").val("");
		$("#menuid").val(selectMenu);
		layer.open({
			type : 1,
			title : '新增菜单功能',
			closeBtn : 1,
			anim : 2,
			area : [ '70%', '80%' ],
			shadeClose : false,
			content : $("#editModel"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				$("#editForm").sub("${path}/menu_action/save", function(data) {
					layer.msg("操作成功", {
						icon : 1
					});
					query(selectMenu);
					layer.close(index);
				}, function(data) {
					layer.alert(data.msg, {
						icon : 2
					});
				})
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	}

	var initMenus = function() {
		post("${path}/menu_action/find_all_menu", {}, function(data) {
			menus(data.data);
		}, function(data) {
			layer.alert(data.msg, {
				icon : 2
			});
		});
	}
	
	var menus = function(data,headerhtm,parent_id,n){
		if(!headerhtm) headerhtm='';
		for(var i = 0;i<data.length;i++){
			var h = '';
			if(n && n==1){
				h = 'style="display:none;"';
			}
			var $li = $('<li data_id="'+data[i].id+'" parent_id="'+parent_id+'" item_show="1" class="list-group-item node-treeview4" '+h+'></li>');
			$li.click(function(){
				var This = $(this);
				var id = This.attr("data_id");
				if(This.attr("item_show")==1){
					$('[parent_id="'+id+'"]').show(100);
					This.attr("item_show",0);
				}else{
					This.attr("item_show",1);
					closeMenu(id);
				}
				$("#menuContent li").removeClass("selectMenu");
				This.addClass("selectMenu");
				query(id);
				selectMenu = id;
			});
			$li.append(headerhtm);
			var nos = $('<span class="icon"><i class="click-collapse glyphicon glyphicon-minus"></i></span>');
			var content = $('<span class="icon"><i class="'+data[i].icon+'"></i></span><span>'+data[i].text+'</span>');
			$("#menuContent").append($li);
			if(data[i].nodes.length>0){
				$li.append(nos);
				menus(data[i].nodes,headerhtm+'<span class="indent"></span>',data[i].id,1);
			}
			$li.append(content);
		}
	}
	
	var closeMenu = function(id){
		var par = $('[parent_id="'+id+'"]');
		for(var i = 0;i<par.length;i++){
			$(par[i]).hide();
			$(par[i]).attr("item_show",1);
			closeMenu($(par[i]).attr("data_id"));
		}
	}
</script>