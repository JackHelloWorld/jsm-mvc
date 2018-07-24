<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="nick_name" class="sr-only">剧本名称</label> <input
				type="text" placeholder="人员名称" id="nick_name"
				class="form-control">
		</div>
		<div class="form-group">
			<label for="login_name" class="sr-only">人员登录名</label> <input
				type="text" placeholder="人员登录名" id="login_name"
				class="form-control">
		</div>
		<div class="form-group">
			<label for="q_status" class="sr-only">状态</label> 
			<select  id="q_status"
				class="form-control">
					<option value="0">正常</option>
					<option value="4">已删除</option>
				</select>
		</div>
		<div class="form-group">
			<label for="admin_desc" class="sr-only">描述信息</label> <input
				type="text" placeholder="描述信息" id="admin_desc"
				class="form-control">
		</div>
		<div class="form-group">
			${tools_action }
		</div>
</div>
<table id="dataTable" class="col-sm-12"></table>
<%@include file="../common/footer.jsp"%>
<div id="showUserModel" style="display: none;" class="col-sm-12">
	<form id="showUserForm" action="#">
	<input type="hidden" id="old_user" name="old_user"/>
		<c:forEach items="${roles }" var="role">
			<h3 class="font-bold">${role.name}</h3>
			<c:forEach items="${role.users }" var="user">
				<input name="user_id" type="radio" value="${user.id }"/>${user.nickName }&nbsp;&nbsp;
			</c:forEach>
		</c:forEach>
	</form>
</div>
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
			url : "${path}/user/data",
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
						field : 'nickName',
						title: '名称',
								
					},
					{
						field : 'loginName',
						title: '登录名',
								
					},
					{
						field : 'roleName',
						title: '角色名称',
								
					},
					{
						field : 'adminDesc',
						title: '描述信息',
								
					},
					{
						field : 'status',
						title: '人员状态',
						formatter:function(value,row){
							switch(value){
								case 0:
									return '正常';
								case 1:
									return '申请中';
								case 2:
									return '驳回账号';
								case 3:
									return '注销';
								case 4:
									return '已经删除';
								default:
									return '未知';
							}
						},
					},
					{
						field : 'createtime',
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
					"nick_name":$("#nick_name").val(),
					"login_name":$("#login_name").val(),
					"admin_desc":$("#admin_desc").val(),
					"status":$("#q_status").val(),
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
		layer.alert("请选择需要修改的人员",{icon:7});
		return;
	}
	$("#editModel input").val("");
	$("#editModel select").val("0");
	var id = vas[0].id
	post("${path}/user/update_info",{id:id},function(data){
		$("#editModel [name='nickName']").val(data.data.nickName);
		$("#editModel [name='adminDesc']").val(data.data.adminDesc);
		$("#editModel [name='id']").val(data.data.id);
		$("#editModel [name='roleId']").val(data.data.roleId);
		$("#editModel [name='loginName']").val(data.data.loginName);
		$("#editModel [name='loginName']").attr("disabled","disabled");
		layer.open({
			type : 1,
			title : '修改人员信息',
			closeBtn : 1, 
			anim : 2,
			area : [ '70%', '80%' ],
			shadeClose : false, 
			content : $("#editModel"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				$("#editForm").sub("${path}/user/update",function(data){
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
	$("#editModel select").val("0");
	$("#editModel [name='loginName']").removeAttr("disabled");
	layer.open({
		type : 1,
		title : '新增人员',
		closeBtn : 1, 
		anim : 2,
		area : [ '50%', '60%' ],
		shadeClose : false, 
		content : $("#editModel"),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			$("#editForm").sub("${path}/user/save",function(data){
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
};



var delete_user = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要删除的人员",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否删除当前人员？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/user/delete",{id:vas[0].id},function(data){
			layer.msg('删除成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"删除中...");
	}, function(){
	 	
	});
};

</script>