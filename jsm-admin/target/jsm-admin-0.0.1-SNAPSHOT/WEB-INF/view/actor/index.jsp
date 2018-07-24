<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="nick_name" class="sr-only">状态</label> 
			<select id="status" class="form-control">
				<option value="">全部状态</option>
				<option value="0">正常</option>
				<option value="1">已禁用</option>
			</select>
		</div>
		<div class="form-group">
			<label for="nick_name" class="sr-only">类型</label> 
			<select id="type" class="form-control">
				<option value="">全部类型</option>
				<option value="0">演员</option>
				<option value="1">导演</option>
				<option value="2">经纪人</option>
			</select>
		</div>
		<div class="form-group">
			<label for="login_name" class="sr-only">名称</label> <input
				type="text" placeholder="名称" id="name"
				class="form-control">
		</div>
		<div class="form-group">
			${tools_action }
		</div>
</div>
<table id="dataTable" class="col-sm-12"></table>
<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
var query = function() {
	//先销毁表格  
	$('#dataTable').bootstrapTable('destroy');
	//初始化表格,动态从服务器加载数据  
	$("#dataTable").bootstrapTable({
			method : "post",
			url : "${path}/actor/data",
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
							field : 'a_name',
							title: '名称',
									
						},
						{
							field : 'addr_name',
							title: '地址',
									
						},
						{
							field : 'a_type_str',
							title: '类型',
									
						},
						{
							field : 'sex',
							title: '性别',
									
						},{
						field : 'a_status',
						title: '状态',
						formatter:function(value,row){
							switch(value){
								case 0:
									return '正常';
								case 1:
									return '禁用';
								default:
									return '未知';
							}
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
					"status":$("#status").val(),
					"type":$("#type").val(),
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
		layer.alert("请选择需要修改的信息",{icon:7});
		return;
	}
	
	$("#parentId").initSelect("${path}/actor/find_all",{},"id","name","选择父栏目","0",function(d){
		$("#editModel input").val("");
		$("#editModel select").val("0");
		var id = vas[0].id;
		post("${path}/actor/find_id",{id:id},function(data){
			$("#editModel").initValue(data.data);
			layer.open({
				type : 1,
				title : '修改',
				closeBtn : 1, 
				anim : 2,
				area : [ '70%', '80%' ],
				shadeClose : false, 
				content : $("#editModel"),
				btn : [ '保存', '取消' ],
				yes : function(index, layero) {
					$("#editForm").sub("${path}/actor/update",function(data){
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
	});
}

var add = function(){
	$("#parentId").initSelect("${path}/actor/find_all",{},"id","name","选择父类型","0",function(d){
	$("#editModel input").val("");
	$("#editModel select").val("0");
	layer.open({
		type : 1,
		title : '新增',
		closeBtn : 1, 
		anim : 2,
		area : [ '50%', '60%' ],
		shadeClose : false, 
		content : $("#editModel"),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			$("#editForm").sub("${path}/actor/save",function(data){
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
	});
};

var delete_action = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要删除的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否删除当前数据？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/actor/delete",{id:vas[0].id},function(data){
			layer.msg('删除成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"删除中...");
	}, function(){
	 	
	});
};

var hide = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要禁用的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否禁用？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/actor/hide",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};


var success = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要恢复的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否恢复？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/actor/success",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};


</script>