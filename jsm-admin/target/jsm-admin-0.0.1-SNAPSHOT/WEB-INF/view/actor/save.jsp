<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link href="${path }/static/css/plugins/summernote/summernote.css"  rel="stylesheet">
<link href="${path }/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
<form class="form-horizontal row" id="editForm">
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					基础资料 <small class="m-l-sm">基础资料信息</small>
				</h5>
			</div>
			<div class="ibox-content">
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-8">
							<input class="form-control" name="name" placeholder="输入姓名"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">别名</label>
						<div class="col-sm-8">
							<input class="form-control" name="alias" placeholder="输入别名"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">民族</label>
						<div class="col-sm-8">
							<select class="form-control"  name="nation" id="nation">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">籍贯</label>
						<div class="col-sm-8">
							<input type="hidden" name="native_place" id="native_placeValue"/>
							<input class="form-control" hideDom="#birthplaceContent,#studyContent" readonly="readonly"  id="native_place" placeholder="选择籍贯" type="text">
							<div id="native_placeContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
							    <ul id="native_placeUl"  class="ztree" style="margin-top:0;"></ul>
							</div>  
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">出身地</label>
						<div class="col-sm-8">
							<input type="hidden" name="birthplace" id="birthplaceValue"/>
							<input class="form-control" hideDom="#native_placeContent,#studyContent" id="birthplace" readonly="readonly" placeholder="选择出身地" type="text">
							<div id="birthplaceContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
							    <ul id="birthplaceUl"  class="ztree" style="margin-top:0;"></ul>
							</div>  
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<select class="form-control" name="sex">
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-4 control-label">体重</label>
							<div class="col-sm-8">
								<input class="form-control" name="weight" placeholder="输入体重(kg)"
									type="number" step="0.01" min="0">
							</div>
						</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
							<label class="col-sm-4 control-label">身高</label>
							<div class="col-sm-8">
								<input class="form-control" name="stature" placeholder="输入身高(cm)"
									type="number" step="1">
							</div>
						</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">出生日期</label>
						<div class="col-sm-8">
							<input class="form-control" placeholder="出生日期" name="birthday"
								id="birthday" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">毕业院校</label>
						<div class="col-sm-8">
							<input class="form-control" name="graduate_institution" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">所学专业</label>
						<div class="col-sm-8">
							<input type="hidden" name="study" id="studyValue"/>
							<input class="form-control" readonly="readonly" hidDom="#native_placeContent,#birthplaceContent" placeholder="所学专业"  id="study" type="text">
							<div id="studyContent"  style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;z-index: 99999">
							    <ul id="studyUl"  class="ztree" style="margin-top:0;"></ul>
							</div>  
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">职业</label>
						<div class="col-sm-8">
							<input class="form-control" id="professional" readonly="readonly" placeholder="选择职业" onclick="select_professional()"/>
							<input type="hidden" name="professional"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">星座</label>
						<div class="col-sm-8">
							<select class="form-control" name="constellation" id="constellation">
								
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group" style="text-align: center;" onclick="$('#website_banner').click()">
						<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp"
							style="height: 100px">
					</div>
					<input  type="file" accept="image/*" onchange="changeImg(this,1)" style="display: none" id="website_banner"/>
					<input  type="file" accept="image/*" onchange="changeImg(this,2)" style="display: none" id="personal_photo_inp"/>
					<input  type="file" accept="image/*" onchange="changeImg(this,3)" style="display: none" id="still_con_inp"/>
					<input  type="hidden" name="website_banner" id="website_banner_value"/>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					个人简介 <small class="m-l-sm">简单描述个人经历</small>
				</h5>
			</div>
			<div class="ibox-content">
				<textarea class="form-control" name="individual_resume"
					placeholder="输入个人简介"></textarea>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					其他信息<small class="m-l-sm">其他信息选择</small>
				</h5>
			</div>
			<div class="ibox-content">
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">签约</label>
						<div class="col-sm-8">
							<select class="form-control" name="is_sign">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">推荐</label>
						<div class="col-sm-8">
							<select class="form-control" name="is_recommend">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">知名演员</label>
						<div class="col-sm-8">
							<select class="form-control" name="is_famous">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">类型</label>
						<div class="col-sm-8">
							<select class="form-control" name="type">
								<option value="0">演员</option>
								<option value="1">导演</option>
								<option value="2">经纪人</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	  <div class="form-group">
    <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>内容</h5>
                    </div>
                    <div class="ibox-content no-padding">
                        <div class="summernote" id="content_message">
                          
                        </div>
                    </div>
                </div>
        	<textarea id="content" style="display: none;" name="info"></textarea>
    </div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					个人照片 <small class="m-l-sm">个人相册</small>
				</h5>
			</div>
			<div class="ibox-content" id="personal_photo">
				<div onclick="$('#personal_photo_inp').click()" style="font-size: 180px;color: #1ab394" class="glyphicon glyphicon-plus"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					参演剧照 <small class="m-l-sm">剧照图片</small>
				</h5>
			</div>
			<div class="ibox-content" id="still_con">
				<div onclick="$('#still_con_inp').click()" style="font-size: 180px;float: left;color: #1ab394" class="glyphicon glyphicon-plus"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-12" style="padding-top: 50px">
		<div class="form-group" style="text-align: center;">
       <a id="btnSave" style="list-style: none" class="btn btn-primary btn-sm" href="javascript:;" ><i class="fa fa-check"></i>&nbsp;提交</a>
    </div>
	</div>
</form>
<%@include file="../common/footer.jsp"%>
<div id="selectProfessionModel" class="col-sm-12" style="display: none">
	 <ul id="professionUl"  class="ztree" style="width: 100%;background: white;height: auto;border: none"></ul>
</div>
<script type="text/javascript"
	src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${path}/static/plugins/laydate/laydate.js"></script>
 <script type="text/javascript" src="${path}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
	var setting_study = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClick
		}
	};
	function onClick(event, treeId, treeNode, clickFlag) {
		$("#study").val(treeNode.name);
		$("#studyValue").val(treeNode.value);
	}
	var setting_professional = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback : {
			beforeCheck:true,
            onCheck:onCheckprofessional
		}
	};
	function onCheckprofessional(event, treeId, treeNode, clickFlag) {

	}

	var changeImg = function(t,type) {
		var filename = $(t).val();
		if (!/.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(filename)) {
			$(t).val("");
			layer.alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			return;
		}
		var formData = new FormData();
		formData.append('file', t.files[0]);
		var layerIndex = layer.msg("请稍后..", {
			icon : 16,
			time : 0,
			shade : 0.5
		});
		$.ajax({
			type : "POST",
			processData : false,
			contentType : false,
			url : file_upload_url,
			data : formData,
			error : function(erro) {
				layer.alert("操作异常");
				layer.close(layerIndex);
			},
			success : function(data) {
				layer.close(layerIndex);
				if (data.status) {
					
					switch (type) {
					case 1:
						$("#titleImgTemp").attr("src", data.data.url);
						$("#website_banner_value").val(data.data.url);
						break;
					case 2:
						var html = initDiv(data.data.url);
						$("#personal_photo").prepend(html);
						break;
					case 3:
						var html = initDiv(data.data.url);
						$("#still_con").prepend(html);
						break;
					default:
						break;
					}
				} else {
					layer.alert(data.message);
				}
			}
		});
	}

	var setting_addr = {
		data : {
			simpleData : {
				enable : true
			},
			key : {
				children:"sub"
			}
		},
		callback : {
			onClick : onClick1
		}
	};

	var setting_addr1 = {
		data : {
			simpleData : {
				enable : true
			},
			key : {
				children:"sub"
			}
		},
		callback : {
			onClick : onClick2
		}
	};
	function onClick1(event, treeId, treeNode, clickFlag) {
		$("#birthplaceValue").val(treeNode.id);
		$("#birthplace").val(treeNode.name+treeNode.suffix);
	}
	function onClick2(event, treeId, treeNode, clickFlag) {
		$("#native_placeValue").val(treeNode.id);
		$("#native_place").val(treeNode.name+treeNode.suffix);
	}

	var zNodes = null;
	var zNodes1 = null;
	var zNodes2 = null;
	$(function() {
		laydate.render({
			elem : '#birthday' //指定元素
			,type : 'datetime',
			format : 'yyyy-MM-dd HH:mm:ss'
		});
		$("#native_place,#birthplace,#study").click(function(e) {
			$($(this).attr("hideDom")).hide();
			$(this).next().show();
			e.stopPropagation();
		});
		$("#native_placeContent,#birthplaceContent,#studyContent").click(function(e) {
			e.stopPropagation();
		});
		post("${path}/common/find_dict", {code:"DX005"}, function(data) {
			zNodes = data.data;
			$.fn.zTree.init($("#studyUl"), setting_study, zNodes);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});
		post("${path}/common/find_dict", {code:"DX003"}, function(data) {
			zNodes2 = data.data;
			$.fn.zTree.init($("#professionUl"), setting_professional, zNodes2);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});
		post("${path}/common/find_area", {}, function(data) {
			zNodes1 = data.data;
			$.fn.zTree.init($("#birthplaceUl"), setting_addr, zNodes1);
			$.fn.zTree.init($("#native_placeUl"), setting_addr1, zNodes1);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});
		
		$("#nation").initSelect("${path}/common/find_dict",{code:"DX001"},"value","name","选择民族");
		$("#constellation").initSelect("${path}/common/find_dict",{code:"DX006"},"value","name","选择星座");
		
		$("body").click(function() {
			$("#native_placeContent,#birthplaceContent,#studyContent").hide();
		});
		$("#btnSave").click(function() {
			$("#editForm input[temp-input]").remove();
			
			var personal_photo1s = $("#personal_photo [data-src]");
			var personal_photo1 = "";
			if(personal_photo1s.length>0){
				for(var i = 0;i<personal_photo1s.length;i++){
					personal_photo1 = personal_photo1+$(personal_photo1s[i]).attr("data-src");
					if(i<personal_photo1s.length-1){
						personal_photo1 = personal_photo1+',';
					}
				}
			}
			
			var personal_photo2s = $("#still_con [data-src]");
			var personal_photo2 = "";
			if(personal_photo2s.length>0){
				for(var i = 0;i<personal_photo2s.length;i++){
					personal_photo2 = personal_photo2+$(personal_photo2s[i]).attr("data-src");
					if(i<personal_photo2s.length-1){
						personal_photo2 = personal_photo2+',';
					}
				}
			}
			
			var $personal_photo1 = $('<input type="hidden" name="actor_photo1" temp-input="temp"/>');
			$personal_photo1.val(personal_photo1);
			
			var $personal_photo2 = $('<input type="hidden" name="actor_photo2" temp-input="temp"/>');
			$personal_photo2.val(personal_photo2);
			$("#editForm").append($personal_photo2);
			$("#editForm").append($personal_photo1);
			$("#content").val($("#content_message").code());
			$("#editForm").sub("${path}/actor/save", function(data) {
				layer.alert("操作成功", {
					icon : 1,
					end : function() {
						location.replace(location.href);
					}
				});
			}, function(data) {
				layer.alert(data.msg, {
					icon : 2
				});
			});
		});
	});

	var selectValue = null;

	var select_professional = function(){
		selectValue = null;
		layer.open({
			type : 1,
			title : '选择职业',
			closeBtn : 1, 
			anim : 2,
			area : [ '40%', '60%' ],
			shadeClose : false, 
			content : $("#selectProfessionModel"),
			btn : [ '选择', '取消' ],
			yes : function(index, layero) {
	           var treeObj=$.fn.zTree.getZTreeObj("professionUl");
	           var nodes=treeObj.getCheckedNodes(true);
	           if(nodes.length == 0){
	        	   layer.msg("未选择职业",{icon:7});
	        	   return;
	           }
	           var values = "";
	           var names = "";
	           for(var i = 0;i<nodes.length;i++){
	        	   console.log(nodes);
	        	   values = values+nodes[i].value;
	        	   names = names+nodes[i].name;
	        	   if(i<nodes.length-1){
	        		   values = values+",";
	        		   names = names+",";
	        	   }
	           }
	           $("#professional").val(names);
	           $("#professional").next().val(values);
	           layer.close(index);
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	}
	
	var removeParent = function(t){
		$(t).parent().remove();
	}
	
	var initDiv = function(src){
		return '<div data-src="'+src+'" style="height: 180px;float: left;margin-right: 10px;"><img alt="" src="'+src+'" style="height: 100%" >'+
		'<a onclick="removeParent(this)" href="javascript:;" style="display: block;top: 0px;right: 52px;position: relative;float: right;" class="btn btn-warning btn-circle btn-lg" type="button"><i class="fa fa-times"></i></a>'+
		'</div>';
	}
</script>

<script src="${path }/static/js/plugins/summernote/summernote.min.js"></script>
<script src="${path }/static/js/plugins/summernote/summernote-zh-CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#content_message").summernote({lang:"zh-CN"})
});
</script>
