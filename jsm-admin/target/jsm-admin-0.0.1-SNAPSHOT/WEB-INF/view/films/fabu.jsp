<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/static/plugins/ztree/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link href="${path }/static/css/plugins/summernote/summernote.css"
	rel="stylesheet">
<link href="${path }/static/css/plugins/summernote/summernote-bs3.css"
	rel="stylesheet">
<form class="form-horizontal row" id="editForm">
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					作品资料 <small class="m-l-sm">基本资料</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">影视名字</label>
						<div class="col-sm-8">
							<input class="form-control" name="name" placeholder="输入影视名字"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">导演</label>
						<div class="col-sm-8">
							<input class="form-control" name="direct" placeholder="输入导演"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">作品类型</label>
						<div class="col-sm-8">
							<select class="form-control" name="dataType">
								<option value="1">电视剧</option>
								<option value="2">电影</option>
								<option value="3">综艺</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">集数</label>
						<div class="col-sm-8">
							<input class="form-control" name="episodeNumber"
								placeholder="输入集数" type="number" step="1" min="1" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">题材类型</label>
						<div class="col-sm-8">
							<input class="form-control" id="types" readonly="readonly"
								placeholder="选择题材类型" onclick="select_types()" /> <input
								type="hidden" name="types" />
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">编剧名称</label>
						<div class="col-sm-8">
							<input class="form-control" name="scriptwriter"
								placeholder="输入编剧名称" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">选择语言</label>
						<div class="col-sm-8">
							<select class="form-control" name="language" id="language"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">上映时间</label>
						<div class="col-sm-8">
							<input class="form-control" name="releaseTimeStr" id="releaseTime"
								placeholder="选择上映时间">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">制作国家/地区</label>
						<div class="col-sm-8">
							<select class="form-control" name="makingMountries"
								id="makingMountries"></select>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group" style="text-align: center;"
						onclick="$('#website_banner').click()">
						<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp"
							style="height: 100px"> <input type="hidden" name="coverImg"
							id="coverImg" />
					</div>
					<input type="file" accept="image/*" onchange="changeImg(this,2)"
						style="display: none" id="still_photo_inp" />
					<input type="file" accept="image/*" onchange="changeImg(this,1)"
						style="display: none" id="website_banner" />
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					作品资料 <small class="m-l-sm">剧情简介</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<textarea class="form-control" name="intro" placeholder="输入剧情简介"></textarea>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					作品资料 <small class="m-l-sm">幕后花絮</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<textarea class="form-control" name="highlights"
					placeholder="输入幕后花絮"></textarea>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					制作机构 <small class="m-l-sm">填写制作结构信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a href="javascript:;" onclick="addZhi()"> <i
						class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content" id="zhiIdContent">
				<div class="form-group" id="tempAddDiv">
					<label class="col-sm-2 control-label">机构名称</label>
					<div class="col-sm-10">
						<input class="form-control" placeholder="输入制作机构名称" type="text">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					发行机构 <small class="m-l-sm">填写发行机构信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a href="javascript:;" onclick="addFa()"> <i
						class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content" id="faIdContent">
				<div class="form-group" id="tempAddDiv1">
					<label class="col-sm-2 control-label">机构名称</label>
					<div class="col-sm-10">
						<input class="form-control" placeholder="输入发行机构名称" type="text">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					设置剧照 <small class="m-l-sm">剧照选择</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content" id="still_photo">
				<div onclick="$('#still_photo_inp').click()"
					style="font-size: 180px; color: #1ab394"
					class="glyphicon glyphicon-plus"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					参演人员 <small class="m-l-sm">填写演员信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a href="javascript:;" onclick="addActor()"> <i
						class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content" id="actorList">
				<div class="well" id="acrotDiv">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">演员名称</label>
							<div class="col-sm-8">
								<input class="form-control" title-name="name" placeholder="输入演员名称" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">在详情显示</label>
							<div class="col-sm-8">
								<select class="form-control" title-name="infoShow">
									<option value="0">不显示</option>
									<option value="1">显示</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">饰演角色</label>
							<div class="col-sm-8">
								<input class="form-control" title-name="filmsName" placeholder="输入饰演角色" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">是否是主演</label>
							<div class="col-sm-8">
								<select class="form-control" title-name="protagonist">
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">头图</label>
							<div class="col-sm-8">
							<input type="hidden" id="ddv_img_value_0" title-name="titleImg">
								<img alt="" onclick="click_actor_img(this)" id="ddv_imge_0" src="${path }/static/img/u436.png"
									style="height: 100px">
							</div>
						</div>
					</div>
					<div class="form-group">
						<textarea class="form-control" title-name="roleSummary" placeholder="输入角色简介"></textarea>
					</div>
					<div class="col-sm-4">
						<label class="col-sm-4 control-label">角色图片</label>
					</div>
					<div class="col-sm-12" id="ddv_0">
						<div onclick="click_actor(this)" temp_d="ddv_0" style="font-size: 180px; color: #1ab394"
							class="glyphicon glyphicon-plus"></div>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12" style="padding-top: 50px">
		<div class="form-group" style="text-align: center;">
			<a id="btnSave" style="list-style: none"
				class="btn btn-primary btn-sm" href="javascript:;"><i
				class="fa fa-check"></i>&nbsp;提交</a>
		</div>
	</div>
</form>
<input type="file" id="actor_photo_inp" style="display: none" accept="image/*" onchange="changeImg(this,-1)"/>
<input type="file" id="actor_title_img_inp" style="display: none" accept="image/*" onchange="changeImg(this,-2)"/>
<%@include file="../common/footer.jsp"%>
<div id="selectTypesModel" class="col-sm-12" style="display: none">
	<ul id="typesUl" class="ztree"
		style="width: 100%; background: white; height: auto; border: none"></ul>
</div>
<script type="text/javascript"
	src="${path}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${path}/static/plugins/laydate/laydate.js"></script>
<script type="text/javascript"
	src="${path}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">

var addActor = function(){
	var actorDiv = $("#acrotDiv").clone();
	actorDiv.attr("id","");
	actorDiv.find("select").val("0");
	actorDiv.find("input,textarea").val("");
	actorDiv.find("div[data-src]").remove();
	var len = actorDiv.find("div[id^='ddv_']").length;
	actorDiv.find("div[id^='ddv_']").attr("id",'ddv_'+len);
	actorDiv.find("[id^='ddv_imge_']").attr("id",'ddv_imge_'+len).attr("src",'${path }/static/img/u436.png');
	actorDiv.find("[id^='ddv_img_value_']").attr("id",'ddv_img_value_'+len);
	actorDiv.find("div[temp_d^='ddv_']").attr("temp_d",'ddv_'+len);
	$("#actorList").append(actorDiv);
}

	var click_actor = function(t) {
		$('#actor_photo_inp').attr("click_cc",$(t).attr("temp_d"))
		$('#actor_photo_inp').click();
	}

	var click_actor_img = function(t) {
		$('#actor_title_img_inp').attr("img-id",$(t).attr("id"));
		$('#actor_title_img_inp').attr("value-id",$(t).prev().attr("id"));
		$('#actor_title_img_inp').click();
	}

	var addZhi = function() {
		var dd = $("#tempAddDiv").clone();
		dd.find("input").val("");
		dd.attr("id", "");
		$("#zhiIdContent").append(dd);
	}
	var addFa = function() {
		var dd = $("#tempAddDiv1").clone();
		dd.find("input").val("");
		dd.attr("id", "");
		$("#faIdContent").append(dd);
	}
	var setting_types = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeCheck : true,
		}
	};

	var changeImg = function(t, type) {
		var filename = $(t).val();
		if (!/.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(filename)) {
			$(t).val("");
			layer.alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			return;
		}
		var This = $(t);
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
					case -1:
						var hh = initDiv(data.data.url);
						$("#"+This.attr("click_cc")).prepend(hh);
						break;
					case -2:
						$('#'+This.attr("value-id")).val(data.data.url)
						$('#'+This.attr("img-id")).attr("src", data.data.url);
						break;
					case 1:
						$("#titleImgTemp").attr("src", data.data.url);
						$("#coverImg").val(data.data.url);
						break;
					case 2:
						var html = initDiv(data.data.url);
						$("#still_photo").prepend(html);
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

	var zNodes2 = null;
	$(function() {
		laydate.render({
			elem : '#releaseTime' //指定元素
			,
			type : 'datetime',
			format : 'yyyy-MM-dd HH:mm:ss'
		});

		post("${path}/common/find_dict", {
			code : "DX013"
		}, function(data) {
			zNodes2 = data.data;
			$.fn.zTree.init($("#typesUl"), setting_types, zNodes2);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});

		$("#language").initSelect("${path}/common/find_dict", {
			code : "DX012"
		}, "value", "name", "选择语言");
		$("#makingMountries").initSelect("${path}/common/find_dict", {
			code : "DX011"
		}, "value", "name", "选择国家/地区");

		$("#btnSave").click(function(){
			$("[temp-input]").remove();
			
			//处理类型
			if(selectValue){
				console.log(selectValue);
				for(var i = 0;i<selectValue.length;i++){
					var $input = $('<input temp-input="true" type="hidden" name="filmsProductionTypes['+i+'].name"/>');
					$input.val(selectValue[i].value);
					$("#editForm").append($input)
				}
			}
			//制作机构
			for(var i = 0;i<$("#zhiIdContent input").length;i++){
				var ins = $($("#zhiIdContent input").get(i));
				if($.trim(ins.val()).length>0){
					var $input = $('<input temp-input="true" type="hidden" name="filmsProductionCompanys['+i+'].name"/>');
					$input.val(ins.val());
					$("#editForm").append($input)
				}
			}
			
			//发行机构
			for(var i = 0;i<$("#faIdContent input").length;i++){
				var ins = $($("#faIdContent input").get(i));
				if($.trim(ins.val()).length>0){
					var $input = $('<input temp-input="true" type="hidden" name="filmsProductionPublishs['+i+'].name"/>');
					$input.val(ins.val());
					$("#editForm").append($input)
				}
			}
			
			//演员信息
			var list = $("#actorList [class='well']");
			for(var i = 0;i<list.length;i++){
				var well = list.get(i);
				var titleNames = $(well).find("[title-name]");
				for(var j = 0;j<titleNames.length;j++){
					var $tn = $(titleNames.get(j));
					var $input = $('<input temp-input="true" type="hidden" name="filmsProductionActors['+i+'].'+$tn.attr("title-name")+'"/>');
					$input.val($tn.val());
					$("#editForm").append($input)
				}
				var dataSrc = $(well).find('[data-src]');
				for(var j = 0;j<dataSrc.length;j++){
					var $dc = $(dataSrc.get(j));
					var $input = $('<input temp-input="true" type="hidden" name="filmsProductionActors['+i+'].filmsProductionActorImgs['+j+'].imgUrl"/>');
					$input.val($dc.attr("data-src"));
					$("#editForm").append($input)
				}
			}
			
			//剧照信息
			var still_photo = $("#still_photo").find('[data-src]');
			for(var i = 0;i<still_photo.length;i++){
				var $dc = $(still_photo.get(i));
				var $input = $('<input temp-input="true" type="hidden" name="filmsProductionStills['+i+'].imgUrl"/>');
				$input.val($dc.attr("data-src"));
				$("#editForm").append($input)
			}
			
			$("#editForm").sub("${path}/films/save",function(data){
				layer.alert("保存成功",{icon:1,end:function(){
					location.replace(location.href);
				}});
			},function(data){
				layer.alert(data.msg,{icon:2});
			});
		});
	});

	var selectValue = null;

	var select_types = function() {
		selectValue = null;
		layer.open({
			type : 1,
			title : '选择类型',
			closeBtn : 1,
			anim : 2,
			area : [ '40%', '60%' ],
			shadeClose : false,
			content : $("#selectTypesModel"),
			btn : [ '选择', '取消' ],
			yes : function(index, layero) {
				var treeObj = $.fn.zTree.getZTreeObj("typesUl");
				var nodes = treeObj.getCheckedNodes(true);
				if (nodes.length == 0) {
					layer.msg("未选择类型", {
						icon : 7
					});
					return;
				}
				var values = "";
				var names = "";
				selectValue = nodes;
				for (var i = 0; i < nodes.length; i++) {
					console.log(nodes);
					names = names + nodes[i].name;
					if (i < nodes.length - 1) {
						names = names + ",";
					}
				}
				$("#types").val(names);
				layer.close(index);
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	}
	
	var removeParent = function(t) {
		$(t).parent().remove();
	}

	var initDiv = function(src) {
		return '<div data-src="'+src+'" style="height: 180px;float: left;margin-right: 10px;"><img alt="" src="'
				+ src
				+ '" style="height: 100%" >'
				+ '<a onclick="removeParent(this)" href="javascript:;" style="display: block;top: 0px;right: 52px;position: relative;float: right;" class="btn btn-warning btn-circle btn-lg" type="button"><i class="fa fa-times"></i></a>'
				+ '</div>';
	}
</script>