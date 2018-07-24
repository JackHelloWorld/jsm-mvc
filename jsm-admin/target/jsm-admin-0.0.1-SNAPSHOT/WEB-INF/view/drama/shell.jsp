<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

<form class="form-horizontal" id="editForm">
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					剧本信息<small class="m-l-sm">基本基础信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                    </a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="form-group">
					<label class="col-sm-2 control-label">剧本类型</label>
					<div class="col-sm-10">
						<input class="form-control" id="type" hideDom="#themeTreeContent"
							type="text">
						<div id="typeTreeContent"
							style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4; z-index: 99999">
							<ul id="typeTreeContentUl" class="ztree" style="margin-top: 0;"></ul>
						</div>
						<input type="hidden" name="type" id="typeVaule">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">题材</label>
					<div class="col-sm-10">
						<input class="form-control" id="theme" hideDom="#typeTreeContent"
							type="text">
						<div id="themeTreeContent"
							style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4; z-index: 99999">
							<ul id="themeTreeContentUl" class="ztree" style="margin-top: 0;"></ul>
						</div>
						<input type="hidden" name="theme" id="themeVaule">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">剧本名称</label>
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
						<input class="form-control" name="cover_img" id="cover_img"
							type="hidden"> <input type="file" class="form-control"
							accept="image/*" onchange="changeImg(this)" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">头图</label>
					<div class="col-sm-10">
						<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp"
							style="height: 100px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">开始时间</label>
					<div class="col-sm-10">
						<input class="form-control" name="begin_time" id="begin_time"
							type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">结束时间</label>
					<div class="col-sm-10">
						<input class="form-control" name="end_time" id="end_time"
							type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">年代</label>
					<div class="col-sm-10">
						<select class="form-control" name="plays">
							<option value="1">古代</option>
							<option value="2">近代</option>
							<option value="3">现代</option>
							<option value="4">当代</option>
							<option value="5">未来</option>
							<option value="6">其他</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">出售方式</label>
					<div class="col-sm-10">
						<select class="form-control" name="pay">
							<option value="0">出售</option>
							<option value="1">拍卖</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">作品状态</label>
					<div class="col-sm-10">
						<select class="form-control" name="work_status">
							<option value="0">待创作</option>
							<option value="1">创作中</option>
							<option value="2">已完成</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">授权</label>
					<div class="col-sm-10">
						<select class="form-control" name="accredit">
							<option value="0">普通</option>
							<option value="1">委托授权</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">简介</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="intro"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">章集</label>
					<div class="col-sm-10">
						<input class="form-control" name="chapter" type="number" step="1"
							min="0" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">标签</label>
					<div class="col-sm-10">
						<input class="form-control" name="tags" placeholder="多个标签以空格隔开"
							type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">出售价格</label>
					<div class="col-sm-10">
						<input class="form-control" name="money" type="number"
							placeholder="单位(元)" step="0.01">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">剧本内容</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="content"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">上传剧本</label>
					<div class="col-sm-10">
						<input class="form-control" name="upload_url" id="upload_url"
							type="hidden"> <input type="file" class="form-control"
							onchange="changeFile(this)" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					提纲<small class="m-l-sm">章集提纲详细信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="" href="javascript:void();"
						onclick="set_content_chapter()"> <i
						class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content" id="chapter_content">
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" placeholder="输入章集号" type="number"
							step="1" min="1" name="chapter_intros[0].number" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<textarea class="form-control" placeholder="请输入章集内容"
							name="chapter_intros[0].info"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group" style="text-align: center;">
		<a id="btnSave" style="list-style: none"
			class="btn btn-primary btn-sm" href="javascript:;"><i
			class="fa fa-check"></i>&nbsp;提交</a>
	</div>
</form>



<%@include file="../common/footer.jsp"%>
<script type="text/javascript"
	src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${path}/static/plugins/laydate/laydate.js"></script>
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

var content_chapter_number = 0;

var set_content_chapter = function(){
	var html = '<div class="form-group">\
						<div class="col-sm-12">\
					<input class="form-control" placeholder="输入章集号" type="number"\
						step="1" min="1" name="chapter_intros['+content_chapter_number+'].number" />\
				</div>\
				</div>\
				<div class="form-group">\
				<div class="col-sm-12">\
					<textarea class="form-control" placeholder="请输入章集内容"\
						name="chapter_intros['+content_chapter_number+'].info"></textarea>\
				</div>\
				</div>';
	content_chapter_number++;
	$("#chapter_content").append(html);
}

$(function(){
	$("#chapter_content").html("");
	content_chapter_number = 0;
	set_content_chapter();
});

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
var changeFile = function(t){
	var filename = $(t).val();
	if($.trim(filename).length == 0){
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
				$("#upload_url").val(data.data.url);
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
	    elem: '#begin_time' //指定元素
	    ,type: 'datetime'
	    ,format:'yyyy-MM-dd HH:mm:ss'
	  });
  	laydate.render({
	    elem: '#end_time' //指定元素
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
		$("#editForm").sub("${path}/drama/fabu/save",function(data){
			layer.alert("操作成功",{icon:1,end:function(){
				location.replace(location.href);
			}});
		},function(data){
			layer.alert(data.msg,{icon:2});
		});
	});
});

</script>
