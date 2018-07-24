<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<div class="form-inline">
		<div class="form-group">
			<label for="nick_name" class="sr-only">用户名称</label> <input
				type="text" placeholder="用户名称" id="user_name"
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
			url : "${path}/action_url_log/data",
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
						field : 'userName',
						title: '操作人',
								
					},
					{
						field : 'ip',
						title: '操作ip',
								
					},
					{
						field : 'url',
						title: '请求信息',
								
					},
					{
						field : 'whenDate',
						title: '耗时(秒)',
						formatter:function(value,row){
							return value/1000;
						},	
					},
					{
						field : 'createTime',
						title: '操作时间',
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
					"user_name":$("#user_name").val(),
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

</script>