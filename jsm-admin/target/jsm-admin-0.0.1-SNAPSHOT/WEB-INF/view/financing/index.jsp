<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
		
			<label for="f_status" class="sr-only">状态</label> 
			<select id="status" class="form-control">
				<option value="">全部状态</option>
				<option value="0">待审核</option>
				<option value="1">通过</option>
				<option value="2">驳回</option>
				<option value="3">已到期</option>
				<option value="3">已删除</option>
				
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
			url : "${path}/financing/data",
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
							field : 'f_number',
							title: '项目编号',
									
						},
						{
							field : 'f_type',
							title: '项目类型',
									
						},
						{
							field : 'f_name',
							title: '项目名称',
									
						},
						
						{
							field : 'f_financing_amount',
							title: '融资金额(万元)',
									
						},
						
						{
							field : 'f_project_status',
							title: '项目状态',
							formatter:function(value,row){
								switch(value){
									case 0:
										return '待制作';
									case 1:
										return '制作中';
									
									default:
										return '未知';
								}
							}
									
						},
					
						{
							field : 'create_user_name',
							title: '发起人',
									
						},
						{
							field : 'f_create_time',
							title: '发起时间',
							formatter:function(value,row){
								var newDate = new Date();
								newDate.setTime(value);
								return newDate.format("yyyy-MM-dd hh:mm:ss");
							},
									
						},
						{
							field : 'f_min_amount',
							title: '起投金额(万元)',
									
						},
						
						{
							field : 'f_max_amount',
							title: '最大金额(万元)',
									
						},
						
						{
							field : 'f_max_amount',
							title: '最大金额(万元)',
									
						},
						{
							field : 'f_anticipated_income_begin',
							title: '预计收益(%)',
							formatter:function(value,row){
								
								return row.f_anticipated_income_begin+"-"+row.f_anticipated_income_end+"%";
								
								
							},
						},{
							field : 'create_user_name',
							title: '审核人',
									
						},{
							field : 'f_audit_time',
							title: '审核时间',
							formatter:function(value,row){
								var newDate = new Date();
								newDate.setTime(value);
								return newDate.format("yyyy-MM-dd hh:mm:ss");
							},
									
						},{

							field : 'f_way',
							title: '融资方式',
							formatter:function(value,row){
								switch(value){
									case 0:
										return '金额';
									case 1:
										return '债权';
								
									default:
										return '未知';
								}
							}
									
						},{
						field : 'f_status',
						title: '审核状态',
						formatter:function(value,row){
							switch(value){
								case 0:
									return '待审核';
								case 1:
									return '通过';
								case 2:
									return '驳回';
								case 3:
									return '已到期';
								case 4:
									return '已删除';
								default:
									return '未知';
							}
						}
									
						}
					
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


	




var fail = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要驳回的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否驳回？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/financing/fail",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};


var pass = function(){
	var vas = $("#dataTable").bootstrapTable('getSelections');
	if(vas.length<1){
		layer.alert("请选择需要通过的数据",{icon:7});
		return;
	}
	//询问框
	layer.confirm('是否通过？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/financing/pass",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};



</script>