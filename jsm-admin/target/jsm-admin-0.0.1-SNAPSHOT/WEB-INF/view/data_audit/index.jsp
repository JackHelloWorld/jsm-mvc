<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="login_name" class="sr-only">审批编号</label> <input
				type="text" placeholder="审批编号" id="serial_number"
				class="form-control">
		</div>
		<div class="form-group">
			<label for="q_type" class="sr-only">类型</label> 
			<select  id="q_type"
				class="form-control">
					<option value="">全部数据</option>
					<option value="1">用户资料审核</option>
					<option value="2">企业审核</option>
					<option value="3">实名认证审核</option>
				</select>
		</div>
		<div class="form-group">
			<label for="q_type" class="sr-only">状态</label> 
			<select  id="q_type"
				class="form-control">
					<option value="">全部状态</option>
					<option value="0">待审核</option>
					<option value="1">已通过</option>
					<option value="2">驳回</option>
				</select>
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
        	<input class="form-control" name="nickName" type="text">
        	<input id="id" name="id" type="hidden"/>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">登录名</label>
		<div class="col-sm-10">
        	<input class="form-control" name="loginName" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">角色</label>
		<div class="col-sm-10">
        	<select class="form-control" name="roleId">
        		<option value="0">请选择</option>
        		<c:forEach items="${roles }" var="role">
        			<option value="${role.id }">${role.name }</option>
        		</c:forEach>
        	</select>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">描述信息</label>
		<div class="col-sm-10">
        	<input class="form-control" name="adminDesc" type="text">
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
			url : "${path}/data_audit/data",
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
			        	   radio: true,
			        	   formatter:function(value,row){
			        		   if(row.d_status != 0)
									return {
										disabled:"disabled"
									}
			        		   return {};
							},
			           },
					{
						field : 'd_audit_number',
						title: '编号',
						formatter:function(value,row){
							var onclick = "void()";
							switch(row.d_type){
							case 1:
								onclick = 'show_user_info('+row.id+')';
								break;
							case 2:
								onclick = 'show_company_info('+row.id+')';
								break;
							case 3:
								onclick = 'show_autonym_info('+row.id+')';
								break;
							}
			        		  return '<button type="button" onclick="'+onclick+'" class="btn btn-primary btn-xs">'+value+'</button>'
						},	
					},
					{
						field : 'u_phone',
						title: '客户电话',
					},
					{
						field : 'd_status',
						title: '审核状态',
						formatter:function(value,row){
							switch(value){
								case 0:
									return '待审核';
								case 1:
									return '通过';
								case 2:
									return '驳回';
								default:
									return '未知';
							}
						},
					},
					{
						field : 'd_type',
						title: '审核类型',
						formatter:function(value,row){
							switch(value){
								case 1:
									return '用户资料审核';
								case 2:
									return '企业审核';
								case 3:
									return '实名认证审核';
								default:
									return '未知';
							}
						},
					},
					{
						field : 'd_create_time',
						title: '申请时间',
						formatter:function(value,row){
							var newDate = new Date();
							newDate.setTime(value);
							return newDate.format("yyyy-MM-dd hh:mm:ss");
						},
					},
					{
						field : 'd_audit_time',
						title: '审核时间',
						formatter:function(value,row){
							if(!value) return '-';
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
					"serial_number":$("#serial_number").val(),
					"status":$("#q_status").val(),
					"type":$("#q_type").val(),
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

var delete_action = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要删除的信息",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否删除当前信息？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/data_audit/delete",{id:vas[0].id,type:vas[0].d_type},function(data){
			layer.msg('删除成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"删除中...");
	}, function(){
	 	
	});
};

var pass = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要通过的审核",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否通过当前审核？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/data_audit/pass",{id:vas[0].id,type:vas[0].d_type},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"审核中...");
	}, function(){
	 	
	});
};

var reject = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要驳回的审核",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否驳回当前审核？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/data_audit/reject",{id:vas[0].id,type:vas[0].d_type},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"驳回中...");
	}, function(){
	 	
	});
};

var show_company_info = function(id){
	layer.open({
		type : 2,
		title : '企业资料查看',
		closeBtn : 1, 
		anim : 2,
		area : [ '80%', '80%' ],
		shadeClose : true, 
		content : ['${path}/data_audit/find_company_info?id='+id],
	});
};

var show_user_info = function(id){
	layer.open({
		type : 2,
		title : '用户资料查看',
		closeBtn : 1, 
		anim : 2,
		area : [ '80%', '80%' ],
		shadeClose : true, 
		content : ['${path}/data_audit/find_user_info?id='+id],
	});
};

var show_autonym_info = function(id){
	layer.open({
		type : 2,
		title : '实名认证信息',
		closeBtn : 1, 
		anim : 2,
		area : [ '80%', '80%' ],
		shadeClose : true, 
		content : ['${path}/data_audit/find_autonym_info?id='+id],
	});
};

</script>