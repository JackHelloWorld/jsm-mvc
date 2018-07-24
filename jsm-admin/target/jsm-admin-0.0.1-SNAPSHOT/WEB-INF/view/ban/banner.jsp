<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="${path }/static/css/plugins/summernote/summernote.css"  rel="stylesheet">
<link href="${path }/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
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
			<label for="login_name" class="sr-only">文字信息</label> <input
				type="text" placeholder="文字信息" id="text"
				class="form-control">
		</div>
		<div class="form-group">
			${tools_action }
		</div>
</div>
<table id="dataTable" class="col-sm-12"></table>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/static/plugins/laydate/laydate.js"></script>
<!--  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
	  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.exedit.js"></script>-->
<div id="editModel" style="display: none;" class="col-sm-12">

<form class="form-horizontal" id="editForm">
	<div class="form-group">
       <label class="col-sm-2 control-label">导航</label>
		<div class="col-sm-10">
        	<input class="form-control" id="nav" placeholder="选择导航" type="text">
			<div id="navContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
			    <ul id="navContentUl"  class="ztree" style="margin-top:0;"></ul>
			</div>  
        	<input type="hidden" name="navId" id="navVaule">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">文字信息</label>
		<div class="col-sm-10">
        	<input class="form-control" name="text" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">类型</label>
		<div class="col-sm-10">
        	<select class="form-control" name="type">
        		<option value="1">普通</option>
        	</select>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">选择图片</label>
		<div class="col-sm-10">
        	<input class="form-control" name="imageUrl" id="cover_img" type="hidden">
        	<input type="file"  class="form-control" accept="image/*" onchange="changeImg(this)"/>
       </div>
    </div>
    <div class="form-group">
       <label class="col-sm-2 control-label">图片</label>
		<div class="col-sm-10">
        	<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp" style="height: 100px">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">跳转链接</label>
		<div class="col-sm-10">
        	<input class="form-control" name="linkUrl" placeholder="跳转链接" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">排序</label>
		<div class="col-sm-10">
        	<input class="form-control" name="bSort" type="number" step="1">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">首页显示</label>
		<div class="col-sm-10">
        	<select class="form-control" name="isIndex">
        		<option value="false">否</option>
        		<option value="true">是</option>
        	</select>
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
			url : "${path}/banner/data",
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
						field : 'b_text',
						title: '文字信息',
								
					},
					{
						field : 'b_status',
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
						field : 'create_user_name',
						title: '创建人',
								
					},
					{
						field : 'b_link_url',
						title: '跳转地址',
					},
					{
						field : 'b_sort',
						title: '排序',
								
					},
					{
						field : 'n_title',
						title: '所属模块',
								
					},
					{
						field : 'b_image_url',
						title: '图片信息',
						formatter:function(value,row){
							if(value == null || $.trim(value).length==0) 
								return '未知';
							return '<a href="'+value+'" target="_blank">查看图片</a>';
						},
					},
					{
						field : 'b_is_index',
						title: '是否在首页显示',
						formatter:function(value,row){
							if(value) return '是';
							return '否'
						},
					},
					{
						field : 'b_create_time',
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
					"text":$("#text").val(),
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
var setting = {	
		data: {
			simpleData: {
				enable: true
			},
			key : {
				children:"nodes",
				name:"title"
			}
		},
		callback:{
			onClick:onClick
		}
};
function onClick(event, treeId, treeNode, clickFlag) {
	$("#navVaule").val(treeNode.id);
	$("#nav").val(treeNode.title);
}	

var changeImg = function(t){
	var filename = $(t).val();
	if(!/.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(filename)){
		$(t).val("");
        layer.alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
        return;
	}
	var formData=new FormData();
    formData.append('file', t.files[0]);
	var layerIndex = layer.msg("请稍后..", {icon: 16,time:0,shade: 0.5});
	$.ajax({
		type: "POST",
		processData: false,
		contentType: false,
		url:file_upload_url,
		data:formData,
		error: function(erro){
			layer.alert("操作异常");
			layer.close(layerIndex);
		},
		success: function(data) {
			layer.close(layerIndex);
			if(data.status){
				$("#cover_img").val(data.data.url);
				$("#titleImgTemp").attr("src",data.data.url);
			}else{
				layer.alert(data.message);
			}
		}
   });
}
var zNodes = null;
$(function(){
	query();
	$("#nav").click(function(e){
		$(this).next().show();
		e.stopPropagation();
	});
	$("#navContent").click(function(e){
		e.stopPropagation();
	});
	post("${path}/common/find_inf_nav",{},function(data){
		zNodes = data.data;
		$.fn.zTree.init($("#navContentUl"), setting, zNodes);
	},function(data){
		layer.msg(data.msg,{icon:2});
	});
	$("body").click(function(){
		$("#navContent").hide();
	});
	
	
});


var add = function(){
	$("#titleImgTemp").attr("src","${path }/static/img/u436.png");
	$("#editModel input").val("");
	$("#editModel select").val("0");
	layer.open({
		type : 1,
		title : '新增banner',
		closeBtn : 1, 
		anim : 2,
		area : [ '90%', '90%' ],
		shadeClose : false, 
		content : $("#editModel"),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			$("#editForm").sub("${path}/banner/save",function(data){
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
		post("${path}/banner/delete",{id:vas[0].id},function(data){
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
		post("${path}/banner/hide",{id:vas[0].id},function(data){
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
		post("${path}/banner/show",{id:vas[0].id},function(data){
			layer.msg('操作成功',{icon:1});
			query();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"操作中...");
	}, function(){
	 	
	});
};

</script>
