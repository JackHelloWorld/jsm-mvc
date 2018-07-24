<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<style>
	.selectMenu{color:#FFFFFF;background-color:#428bca;}
</style>
<div class="form-inline">
		<div class="form-group">
			<label for="name" class="sr-only">名称</label> <input
				type="text" placeholder="名称" id="name"
				class="form-control">
		</div>
		<div class="form-group">
			${tools_action }
		</div>
</div>
<table id="dataTable" class="col-sm-12"></table>
<%@include file="../common/footer.jsp"%>
<div class="col-sm-12" style="display: none;" id="roleMenuModel">
<form id="roleMenuForm">
		<div class="test treeview">
			<ul class="list-group" id="menuContent">
			</ul>
		</div>
</form>
</div>

<div class="col-sm-12" style="display: none;" id="roleActionModel">
<form id="roleActionForm">
<div class="col-sm-5">
		<div class="test treeview">
			<ul class="list-group" id="menuContent1">
			</ul>
		</div>
</div>
<div class="col-sm-7">
	<table id="actionTable"></table>
</div>
</form>
</div>

<div id="editModel" style="display: none;" class="col-sm-12">
<form class="form-horizontal" id="editForm">
	<div class="form-group">
       <label class="col-sm-2 control-label">名称</label>
		<div class="col-sm-10">
        	<input class="form-control" name="name" type="text">
        	<input id="id" name="id" type="hidden"/>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">描述</label>
		<div class="col-sm-10">
        	<input class="form-control" name="desc" type="text">
       </div>
    </div>
</form>
</div>
<script type="text/javascript">
var query = function() {
	//先销毁表格  
	$('#dataTable').bootstrapTable('destroy');
	//初始化表格,动态从服务器加载数据  
	$("#dataTable").bootstrapTable({
			method : "post",
			url : "${path}/role/data",
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
			columns : [
			           { 
			        	   radio: true
			           },
					{
						field : 'name',
						title: '角色名称',
								
					},
					{
						field : 'desc',
						title: '角色描述',
								
					},
					{
						field : 'createTime',
						title: '创建时间',
						formatter:function(value,row){
							var newDate = new Date();
							newDate.setTime(value);
							return newDate.format("yyyy-MM-dd hh:mm:ss");
						},
					},
					 ],
			sidePagination : "server", //表示服务端请求  
			queryParamsType : "undefined",
			
			queryParams : function queryParams(params) { //设置查询参数  
				var param = {
					pageNumber : params.pageNumber,
					pageSize : params.pageSize,
					"name":$("#name").val(),
				};
				return param;
			},
			onLoadSuccess : function(data) { //加载成功时执行  
				if(data.code && data.code == -1){
					layer.alert(data.msg,{icon:2});
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
$(function(){
	query();
});

var edit = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要修改的角色",{icon:7});
		return;
	}
	$("#editModel input").val("");
	var id = vas[0].id
	post("${path}/role/find_id",{id:id},function(data){
		$("#editModel [name='name']").val(data.data.name);
		$("#editModel [name='desc']").val(data.data.desc);
		$("#editModel [name='id']").val(data.data.id);
		layer.open({
			type : 1,
			title : '修改角色',
			closeBtn : 1, 
			anim : 2,
			area : [ '70%', '80%' ],
			shadeClose : false, 
			content : $("#editModel"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				$("#editForm").sub("${path}/role/update",function(data){
					layer.msg("操作成功",{icon:1});
					query();
					layer.close(index);
				},function(data){
					layer.alert(data.msg,{icon:2});
				})
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	},function(data){
		layer.alert(data.msg,{icon:2});
	},"请稍后...");
}

var add = function(){
	$("#editModel input").val("");
	layer.open({
		type : 1,
		title : '新增角色',
		closeBtn : 1, 
		anim : 2,
		area : [ '70%', '80%' ],
		shadeClose : false, 
		content : $("#editModel"),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			$("#editForm").sub("${path}/role/save",function(data){
				layer.msg("操作成功",{icon:1});
				query();
				layer.close(index);
			},function(data){
				layer.alert(data.msg,{icon:2});
			});
		},
		no : function(index, layero) {
			layer.close(index);
		}
	});
};

var menus = function(data,headerhtm,parent_id){
	if(!headerhtm) headerhtm='';
	for(var i = 0;i<data.length;i++){
		var $li = $('<li data_id="'+data[i].id+'" parent_id="'+parent_id+'" item_show="1" class="list-group-item node-treeview4" ></li>');
		$li.click(function(){
			var This = $(this);
			var id = This.attr("data_id");
			$("#menuContent li").removeClass("selectMenu");
			This.addClass("selectMenu");
		});
		$li.append(headerhtm);
		var nos = $('<span class="icon"><i class="click-collapse glyphicon glyphicon-minus"></i></span>');
		var content = $('<span class="icon"><i class="'+data[i].icon+'"></i></span><span>'+data[i].text+'</span>');
		$("#menuContent").append($li);
		if(data[i].nodes.length>0){
			$li.append(nos);
			menus(data[i].nodes,headerhtm+'<span class="indent"></span>',data[i].id);
		}
		$li.append(content);
		var input = $('<input type="checkbox" name="select_menu" value="'+data[i].id+'"/>');
		var div = $('<div style="float:right"></div>');
		if(data[i].isCheck){
			input.attr('checked','checked');
		}
		div.append(input);
		$li.append(div);
	}
}
var select_role_id = 0;
var select_menu_id = 0;
var menusAction = function(data,headerhtm,parent_id){
	if(!headerhtm) headerhtm='';
	for(var i = 0;i<data.length;i++){
		var $li = $('<li data_id="'+data[i].id+'" parent_id="'+parent_id+'" item_show="1" class="list-group-item node-treeview4" ></li>');
		$li.click(function(){
			var This = $(this);
			var id = This.attr("data_id");
			$("#menuContent1 li").removeClass("selectMenu");
			This.addClass("selectMenu");
			select_menu_id = id;
			queryAction(id,select_role_id);
		});
		$li.append(headerhtm);
		var nos = $('<span class="icon"><i class="click-collapse glyphicon glyphicon-minus"></i></span>');
		var content = $('<span class="icon"><i class="'+data[i].icon+'"></i></span><span>'+data[i].text+'</span>');
		$("#menuContent1").append($li);
		if(data[i].nodes.length>0){
			$li.append(nos);
			menusAction(data[i].nodes,headerhtm+'<span class="indent"></span>',data[i].id);
		}
		$li.append(content);
	}
}

var menurole = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要授权的角色",{icon:7});
		return;
	}
	$("#menuContent").html("");
	post("${path}/role/get_role_menu",{role_id:vas[0].id},function(data){
		menus(data.data);
		layer.open({
			type : 1,
			title : '菜单授权',
			closeBtn : 1, 
			anim : 2,
			area : [ '40%', '80%' ],
			shadeClose : false, 
			content : $("#roleMenuModel"),
			btn : [ '授权', '取消' ],
			yes : function(index, layero) {
				$("#roleMenuForm").sub('${path}/role/role_menu_go?role_id='+vas[0].id,function(data){
					layer.msg('授权成功',{icon:1});
					layer.close(index);
				},function(data){
					layer.msg(data.msg,{icon:2});
				},'授权中...');
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	},function(data){
		layer.alert(data.msg,{icon:2});
	},"请稍后...");
	
};


var actionrole = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要授权的角色",{icon:7});
		return;
	}
	select_role_id = vas[0].id;
	$("#menuContent1").html("");
	queryAction(-1,-1);
	post("${path}/role/get_role_action",{role_id:vas[0].id},function(data){
		menusAction(data.data);
		layer.open({
			type : 1,
			title : '功能授权',
			closeBtn : 1, 
			anim : 2,
			area : [ '70%', '80%' ],
			shadeClose : false, 
			content : $("#roleActionModel"),
			btn : [ '授权', '关闭' ],
			yes : function(index, layero) {
				$("#roleActionForm").sub('${path}/role/role_action_go?role_id='+vas[0].id+'&menu_id='+select_menu_id,function(data){
					layer.msg('授权成功',{icon:1});
				},function(data){
					layer.msg(data.msg,{icon:2});
				},'授权中...');
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	},function(data){
		layer.alert(data.msg,{icon:2});
	},"请稍后...");
	
};


var queryAction = function(menuid,roleid) {
	//先销毁表格  
	$('#actionTable').bootstrapTable('destroy');
	//初始化表格,动态从服务器加载数据  
	$("#actionTable").bootstrapTable({
		method : "post",
		url : "${path}/role/find_actions_role",
		striped : true, //表格显示条纹  
		pagination : false, //启动分页  
		pageSize : 10, //每页显示的记录数  
		pageNumber : 1, //当前第几页  
		pageList : [ 10, 20, 50, 100 ], //记录数可选列表  
		height : $(window).height() * 0.6,
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
			field : 'name',
			title : '功能名称',
		}, {
			field : 'id',
			title : '预览效果',
			formatter:function(value,row){
				return '<button class="'+row.style+'""><i class="'+row.icon+'"></i>'+row.name+'</button>';
			},
		}, {
			field : 'isCheck',
			title : '选择',
			formatter:function(value,row){
				var input = '<input name="select_action" value="'+row.id+'" ';
				if(value){
					input+='checked="checked"';
				}
				input += ' type="checkbox"/>';
				return input;
			},
		}, ],
		sidePagination : "server", //表示服务端请求  
		queryParamsType : "undefined",

		queryParams : function queryParams(params) { //设置查询参数  
			var param = {
				"menu_id" : menuid,
				"role_id" : roleid,
			};
			return param;
		},
		onLoadSuccess : function(data) { //加载成功时执行  
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

var del = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要删除的信息",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否删除当前信息？', {
	  btn: ['删除','取消'] //按钮
	}, function(){
		post("${path}/role/delete",{id:vas[0].id},function(data){
			query();
			layer.msg('删除成功',{icon:1});
		},function(data){
			layer.alert(data.msg);
		},"删除中...");
	}, function(){
	  
	});
};

</script>