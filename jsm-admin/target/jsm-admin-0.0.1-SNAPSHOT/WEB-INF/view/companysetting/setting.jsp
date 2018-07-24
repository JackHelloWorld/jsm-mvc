<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<form class="form-horizontal" id="editForm">

	
	<div class="form-group">
       <label class="col-sm-2 control-label">标题</label>
		<div class="col-sm-10">
        	<input class="form-control" name="title"  value="${site.title }" type="text">
       </div>
    </div>
    
    <div class="form-group">
       <label class="col-sm-2 control-label">副标题</label>
		<div class="col-sm-10">
        	<input class="form-control" name="subTitle"  value="${site.subTitle}"   type="text">
       </div>
    </div>
	
	
	<div class="form-group">
       <label class="col-sm-2 control-label">域名</label>
		<div class="col-sm-10">
        	<input class="form-control" name="domain" value="${site.domain}" type="text">
       </div>
    </div>
    
    
    <div class="form-group">
       <label class="col-sm-2 control-label">ipc</label>
		<div class="col-sm-10">
        	<input class="form-control" name="ipc" value="${site.ipc}" type="text">
       </div>
    </div>
    
    <div class="form-group">
       <label class="col-sm-2 control-label">公司简介</label>
		<div class="col-sm-10">
        	<textarea class="form-control" name="info" >${site.info}</textarea>
       </div>
    </div>
	
	
	 <div class="form-group">
       <label class="col-sm-2 control-label">版本</label>
		<div class="col-sm-10">
        	<input class="form-control" name="copyright"  value="${site.ipc}"   type="text">
       </div>
    </div>
	<div class="form-group">
       <label class="col-sm-2 control-label">选择logo</label>
		<div class="col-sm-10">
        	<input class="form-control" name="logo" value="${site.logo }" id="logo" type="hidden">
        	<input type="file"  class="form-control" accept="image/*" onchange="changeImg(this)"/>
       </div>
    </div>
    <div class="form-group">
       <label class="col-sm-2 control-label">logo</label>
		<div class="col-sm-10">
        	<img alt="" onerror="${path }/static/img/u436.png"  src="${site.logo }" id="titleImgTemp" style="height: 100px">
       </div>
    </div>

	<div class="form-group" style="text-align: center;">
       <a id="btnSave" style="list-style: none" class="btn btn-primary btn-sm" href="javascript:;" ><i class="fa fa-check"></i>&nbsp;提交</a>
    </div>
</form>



<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/static/plugins/laydate/laydate.js"></script>
<!--  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
	  <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.exedit.js"></script>-->
<script type="text/javascript">

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
				$("#logo").val(data.data.url);
				$("#titleImgTemp").attr("src",data.data.url);
			}else{
				layer.alert(data.message);
			}
		}
   });
}


$(function(){

	$("#btnSave").click(function(){
		$("#editForm").sub("${path}/setting/companysetting/save",function(data){
			layer.alert("操作成功",{icon:1,end:function(){
				location.replace(location.href);
			}});
		},function(data){
			layer.alert(data.msg,{icon:2});
		});
	});
});

</script>
