<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<form class="form-horizontal" id="editForm">
	<div class="form-group">
       <label class="col-sm-2 control-label">征集类型</label>
		<div class="col-sm-10">
        	<input class="form-control" id="type" hideDom ="#themeTreeContent"  type="text">
			<div id="typeTreeContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
			    <ul id="typeTreeContentUl"  class="ztree" style="margin-top:0;"></ul>
			</div>  
        	<input type="hidden" name="type" id="typeVaule">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">题材</label>
		<div class="col-sm-10">
        	<input class="form-control" id="theme" hideDom ="#typeTreeContent" type="text">
			<div id="themeTreeContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
			    <ul id="themeTreeContentUl"  class="ztree" style="margin-top:0;"></ul>
			</div>  
        	<input type="hidden" name="theme" id="themeVaule">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">征集名称</label>
		<div class="col-sm-10">
        	<input class="form-control" name="name" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">作者</label>
		<div class="col-sm-10">
        	<input class="form-control" name="author" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">选择头图</label>
		<div class="col-sm-10">
        	<input class="form-control" name="cover_img" id="cover_img" type="hidden">
        	<input type="file"  class="form-control" accept="image/*" onchange="changeImg(this)"/>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">头图</label>
		<div class="col-sm-10">
        	<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp" style="height: 100px">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">征集时间</label>
		<div class="col-sm-10">
        	<input class="form-control" name="for_time" id="for_time" type="text" >
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">截止时间</label>
		<div class="col-sm-10">
        	<input class="form-control" name="cut_time" id="cut_time" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">征集内容</label>
		<div class="col-sm-10">
        	<textarea class="form-control" name="content"></textarea>
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">标签</label>
		<div class="col-sm-10">
        	<input class="form-control" name="tags" placeholder="多个标签以空格隔开" type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">征集金额</label>
		<div class="col-sm-10">
        	<input class="form-control" name="money" type="number" placeholder="单位(元)" step="0.01">
       </div>
    </div>
	<div class="form-group" style="text-align: center;">
       <a id="btnSave" style="list-style: none" class="btn btn-primary btn-sm" href="javascript:;" ><i class="fa fa-check"></i>&nbsp;提交</a>
       <input class="btn btn-info btn-sm" type="reset" value="重置"/>
    </div>
</form>



<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/static/plugins/laydate/laydate.js"></script>
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
	$("#typeVaule").val(treeNode.id);
	$("#type").val(treeNode.name);
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

var setting1 = {	
		data: {
			simpleData: {
				enable: true
			}
		},
		callback:{
			onClick:onClick1
		}
};
function onClick1(event, treeId, treeNode, clickFlag) {
	$("#themeVaule").val(treeNode.id);
	$("#theme").val(treeNode.name);
}	 

var zNodes = null;
var zNodes1 = null;
$(function(){
  	laydate.render({
	    elem: '#for_time' //指定元素
	    ,type: 'datetime'
	    ,format:'yyyy-MM-dd HH:mm:ss'
	  });
  	laydate.render({
	    elem: '#cut_time' //指定元素
	    ,type: 'datetime'
	    ,format:'yyyy-MM-dd HH:mm:ss'
	  });
	$("#type,#theme").click(function(e){
		$($(this).attr("hideDom")).hide();
		$(this).next().show();
		e.stopPropagation();
	});
	$("#typeTreeContent,#themeTreeContent").click(function(e){
		e.stopPropagation();
	});
	post("${path}/common/find_drama_type",{type:0},function(data){
		zNodes = data.data;
		$.fn.zTree.init($("#typeTreeContentUl"), setting, zNodes);
	},function(data){
		layer.msg(data.msg,{icon:2});
	});
	post("${path}/common/find_drama_type",{type:1},function(data){
		zNodes1 = data.data;
		$.fn.zTree.init($("#themeTreeContentUl"), setting1, zNodes1);
	},function(data){
		layer.msg(data.msg,{icon:2});
	});
	$("body").click(function(){
		$("#typeTreeContent").hide();
		$("#themeTreeContent").hide();
	});
	$("#btnSave").click(function(){
		$("#editForm").sub("${path}/drama/zhengji/save",function(data){
			layer.alert("操作成功",{icon:1,end:function(){
				location.replace(location.href);
			}});
		},function(data){
			layer.alert(data.msg,{icon:2});
		});
	});
});

</script>
