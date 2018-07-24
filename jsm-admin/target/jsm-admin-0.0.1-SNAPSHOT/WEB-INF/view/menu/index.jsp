<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="text" class="sr-only">菜单名称</label> <input
				type="text" placeholder="菜单名称" id="text"
				class="form-control">
		</div>
		<div class="form-group">
			${tools_action }
		</div>
</div>
<table id="dataTable" class="col-sm-12"></table>

<%@include file="../common/footer.jsp"%>
<div id="editModel" style="display: none;" class="col-sm-12">
<form class="form-horizontal" id="editForm">
	<div class="form-group">
       <label class="col-sm-2 control-label">名称</label>
		<div class="col-sm-10">
        	<input class="form-control" name="text" type="text">
        	<input id="id" name="id" type="hidden"/>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">描述</label>
		<div class="col-sm-10">
        	<input class="form-control" name="desc" type="text">
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
	<div class="form-group">
       <label class="col-sm-2 control-label">父级菜单</label>
		<div class="col-sm-10">
        	<select class="form-control" id="parentMenu" name="parentid"></select>
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
			url : "${path}/menu/data",
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
						field : 'text',
						title: '菜单名称',
								
					},
					{
						field : 'desc',
						title: '菜单描述',
								
					},
					{
						field : 'icon',
						title: '图标',
								
					},
					{
						field : 'url',
						title: '地址',
								
					},
					{
						field : 'goorder',
						title: '排序',
								
					},
					 ],
			sidePagination : "server", //表示服务端请求  
			queryParamsType : "undefined",
			
			queryParams : function queryParams(params) { //设置查询参数  
				var param = {
					pageNumber : params.pageNumber,
					pageSize : params.pageSize,
					"text":$("#text").val(),
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
		layer.alert("请选择需要修改的菜单",{icon:7});
		return;
	}
	$("#editModel input").val("");
	initParentMenus();
	var id = vas[0].id
	post("${path}/menu/find_id",{id:id},function(data){
		$("#editModel [name='text']").val(data.data.text);
		$("#editModel [name='desc']").val(data.data.desc);
		$("#editModel [name='id']").val(data.data.id);
		$("#editModel [name='url']").val(data.data.url);
		$("#editModel [name='icon']").val(data.data.icon);
		$("#editModel [name='goorder']").val(data.data.goorder);
		$("#editModel select").val(data.data.parentid);
		layer.open({
			type : 1,
			title : '修改菜单',
			closeBtn : 1, 
			anim : 2,
			area : [ '70%', '80%' ],
			shadeClose : false, 
			content : $("#editModel"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				$("#editForm").sub("${path}/menu/update",function(data){
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
	initParentMenus();
	layer.open({
		type : 1,
		title : '新增菜单',
		closeBtn : 1, 
		anim : 2,
		area : [ '70%', '80%' ],
		shadeClose : false, 
		content : $("#editModel"),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			$("#editForm").sub("${path}/menu/save",function(data){
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
}

var initParentMenus = function(){
	$("#parentMenu").html("");
	post("${path}/menu/find_parent",{},function(data){
		$("#parentMenu").append('<option value="0">无</option>');
		for(var i = 0;i<data.data.length;i++){
			if(data.data[i]);
			var $option = $('<option value="'+data.data[i].id+'">'+data.data[i].text+'</option>')
			$("#parentMenu").append($option);
		}
	},function(data){
		layer.alert(data.msg,{icon:2});
	});
}

</script>