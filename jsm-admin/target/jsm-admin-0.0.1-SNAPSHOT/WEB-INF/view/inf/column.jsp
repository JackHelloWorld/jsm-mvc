<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="nick_name" class="sr-only">状态</label> 
			<select id="status" class="form-control">
				<option value="">选择状态</option>
				<option value="0">正常</option>
				<option value="1">隐藏</option>
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
       <label class="col-sm-2 control-label">父级</label>
		<div class="col-sm-10">
        	<select class="form-control" name="parentId" id="parentId">
        		
        	</select>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">排序</label>
		<div class="col-sm-10">
        	<input class="form-control" name="sort" type="number">
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
			url : "${path}/column/data",
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
						field : 't_name',
						title: '名称',
								
					},
					{
						field : 't_status',
						title: '状态',
						formatter:function(value,row){
							switch(value){
								case 0:
									return '正常';
								case 1:
									return '隐藏';
								default:
									return '未知';
							}
						},
					},
					{
						field : 't_sort',
						title: '排序',
								
					},
					{
						field : 't_create_time',
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
					"status":$("#status").val(),
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
	
	$("#parentId").initSelect("${path}/column/find_all",{},"id","name","选择父栏目","0",function(d){
		$("#editModel input").val("");
		$("#editModel select").val("0");
		var id = vas[0].id;
		post("${path}/column/find_id",{id:id},function(data){
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
					$("#editForm").sub("${path}/column/update",function(data){
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
	$("#parentId").initSelect("${path}/column/find_all",{},"id","name","选择父类型","0",function(d){
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
			$("#editForm").sub("${path}/column/save",function(data){
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
		post("${path}/column/delete",{id:vas[0].id},function(data){
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
		layer.alert("请选择需要隐藏的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否隐藏当前数据？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/column/hide",{id:vas[0].id},function(data){
			layer.msg('隐藏成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};

var show = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要显示的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否显示当前数据？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/column/show",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};

</script>