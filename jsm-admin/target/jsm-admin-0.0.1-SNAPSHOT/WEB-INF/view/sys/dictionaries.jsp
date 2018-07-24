<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="col-sm-5">
<h2>字典数据</h2>
	<ul id="treeDemo" class="ztree"></ul>
</div>
<div class="col-sm-7">
${tools_action }
	<form class="form-horizontal" id="editForm">
		<div class="form-group">
             <label class="col-sm-4 control-label">名称</label>
             <input type="hidden" name = "parentId" id="parentId" value="0"/>
             <input type="hidden" name = "id" id="id"/>
             <div class="col-sm-8">
                 <input class="form-control" type="text" id="name" name="name" placeholder="中文名称">
             </div>
         </div>
		<div class="form-group">
             <label class="col-sm-4 control-label">英文名称</label>
             <div class="col-sm-8">
                 <input class="form-control" type="text" id="eName" name="eName" placeholder="英文名称">
             </div>
         </div>
		<div class="form-group">
             <label class="col-sm-4 control-label">code值</label>
             <div class="col-sm-8">
                 <input class="form-control" type="text" id="code" name="code" placeholder="code">
             </div>
         </div>
		<div class="form-group">
             <label class="col-sm-4 control-label">value值</label>
             <div class="col-sm-8">
                 <input class="form-control" type="text" id="value" name="value" placeholder="value值">
             </div>
         </div>
	</form>
		<div class="form-group">
            <button id="btnSave" class="btn btn-primary" href="javascript:;" type="button"><i class="fa fa-check"></i>&nbsp;提交</button>
         </div>
</div>
<div style="clear: both"></div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<!--  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
	  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.exedit.js"></script>-->
<script type="text/javascript">

var setting = {	
	data: {
		simpleData: {
			enable: true
		}
	},
	callback:{
		onClick:onClick
	}
};

function onClick(event, treeId, treeNode, clickFlag) {
	objclick = treeNode;
	$("#editForm input[type='text']").attr("readonly","readonly");
	$("#editForm input").val("");
	$("#parentId").val("0");
	$("#btnSave").attr("disabled","disabled");
	$("#parentId").val(objclick.id);
	$("#id").val(objclick.id);
	$("#value").val(objclick.value);
	$("#code").val(objclick.code);
	$("#eName").val(objclick.eName);
	$("#name").val(objclick.name);
}	 

var zNodes = null;

$(document).ready(function(){
	initQuery();
	$("#btnSave").click(function(){
		var tempUrl = "";
		if(actionTemp == 1){
			tempUrl = addUrl;
		}else if(actionTemp == 2){
			tempUrl = editUrl;
		}else{
			layer.alert("无操作类型",{icon:7});
			return;
		}
		post(tempUrl,$("#editForm").serialize(),function(data){
			layer.msg("操作成功",{icon:1});
			initQuery();
		},function(data){
			layer.alert(data.msg,{icon:2});
		});
	});
});


var add = function(){
	actionTemp = 1;
	var parentId = $("#parentId").val();
	$("#editForm input[type='text']").removeAttr("readonly");
	$("#editForm input").val("");
	$("#parentId").val(parentId);
	$("#btnSave").removeAttr("disabled");
}

var objclick = null;

var actionTemp = 0;

var addUrl = "${path}/dictionaries/add";
var editUrl = "${path}/dictionaries/update";

var update = function(){
	if(objclick == null){
		layer.msg("请选择修改的项",{icon:7});
		return;
	}
	actionTemp = 2;
	$("#editForm input[type='text']").removeAttr("readonly");
	$("#btnSave").removeAttr("disabled");
}

var initQuery = function(){
	objclick = null;
	$("#editForm input[type='text']").attr("readonly","readonly");
	$("#editForm input").val("");
	$("#parentId").val("0");
	$("#btnSave").attr("disabled","disabled");
	post("${path}/common/find_dictionaries",{},function(data){
		zNodes = data.data;
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	},function(data){
		layer.alert(data.msg,{icon:2});
	});
}

var dis = function(){
	if(objclick == null){
		layer.msg("未选择需要禁用的字典",{icon:7});
		return;
	}
	//询问框
	layer.confirm('禁用将同时禁用子节点？', {
	  btn: ['确定','取消'] ,//按钮
	  title:'系统提示'
	}, function(){
		post("${path}/dictionaries/dis",{id:objclick.id},function(data){
			layer.msg('禁用成功',{icon:1});
			initQuery();
		},function(data){
			layer.alert(data.msg,{icon:2});
		},"禁用中...");
	}, function(){
	 	
	});
}
</script>