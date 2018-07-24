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
					融资信息<small class="m-l-sm">基本基础信息</small>
				</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">

				<div class="form-group">
					<label class="col-sm-2 control-label">项目编号</label>
					<div class="col-sm-10">
						<input class="form-control" name="number" value="${number }"
							readonly="readonly" type="text">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-2 control-label">项目名称</label>
					<div class="col-sm-10">
						<input class="form-control" name="name" type="text">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">项目类型</label>
					<div class="col-sm-10">
						<input type="hidden" name="type" id="typeValue" /> <input
							class="form-control" readonly="readonly"
							hideDom="#topicMaterialContent,#addrIdContent" placeholder="选择类型"
							id="type" type="text">
						<div id="typeContent"
							style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4; z-index: 99999">
							<ul id="typeUl" class="ztree" style="margin-top: 0;"></ul>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">题材</label>
					<div class="col-sm-10">
						<input class="form-control" readonly="readonly" id="topicMaterial"
							hideDom="#typeContent,#addrIdContent" type="text">
						<div id="topicMaterialContent"
							style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4; z-index: 99999">
							<ul id="topicMaterialUl" class="ztree" style="margin-top: 0;"></ul>
						</div>
						<input type="hidden" name="topicMaterial" id="topicMaterialValue">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-2 control-label">项目简介</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="intro"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">封面图片</label>
					<div class="col-sm-10">
						<input class="form-control" name="coverPicture" id="cover_img"
							type="hidden"> <input type="file" class="form-control"
							accept="image/*" onchange="changeImg(this)" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">封面图片</label>
					<div class="col-sm-10">
						<img alt="" src="${path }/static/img/u436.png" id="titleImgTemp"
							style="height: 100px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">项目状态</label>
					<div class="col-sm-10">
						<select class="form-control" name="projectStatus"
							class="form-control">
							<option value="0">待制作</option>
							<option value="1">制作中</option>
						</select>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-2 control-label">融资金额</label>
					<div class="col-sm-8">
						<input class="form-control" name="financingAmount"
							placeholder="输入融资金额(万元)" type="number" step="0.01">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">发布地区</label>
					<div class="col-sm-8">
						<input type="hidden" name="addrId" id="addrIdValue" /> <input
							class="form-control" hidDom="#topicMaterialContent,#typeContent"
							id="addrId" readonly="readonly" placeholder="选择发布地址" type="text">
						<div id="addrIdContent"
							style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4; z-index: 99999">
							<ul id="addrIdUl" class="ztree" style="margin-top: 0;"></ul>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">融资方式</label>
					<div class="col-sm-8">
						<select class="form-control" name="way" onchange="changeWay(this)">
							<option value="0">金额</option>
							<option value="1">债权</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">份数</label>
					<div class="col-sm-8">
						<input class="form-control" readonly="readonly" id="countNumber" type="number" min="0" step="1"
							name="countNumber" placeholder="融资方式为债权时使用" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">起投金额</label>
					<div class="col-sm-8">
						<input class="form-control" id="minAmount" name="minAmount"
							placeholder="万元" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">最大金额</label>
					<div class="col-sm-8">
						<input class="form-control" name="maxAmount" placeholder="万元" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">预计收益</label>
					<div class="col-sm-8">
						<div class="col-sm-3">
							<input name="anticipatedIncomeBegin" class="form-control"
								type="number" step="0.01" />
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input class="form-control" name="anticipatedIncomeEnd"
								type="number" step="0.01" />
						</div>
						<div class="col-sm-3">%/年</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">融资结束时间</label>
					<div class="col-sm-8">
						<input class="form-control" id="endTimeStr" name="endTimeStr" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">上映时间</label>
					<div class="col-sm-8">
						<input class="form-control" id="releaseTimeStr" name="releaseTimeStr" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否热门</label>
					<div class="col-sm-8">
						<select class="form-control" name="isHot">
							<option value="0">否</option>
							<option value="1">是</option>
						</select>
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
<script type="text/javascript">
	var changeWay = function(t) {
		var v = $(t).val();
		if (v == 0) {
			$("#countNumber").attr("readonly", "readonly");
			$("#minAmount").removeAttr("readonly");
		} else {
			$("#minAmount").attr("readonly", "readonly");
			$("#countNumber").removeAttr("readonly");
		}
	}

	var changeImg = function(t) {
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
					$("#cover_img").val(data.data.url);
					$("#titleImgTemp").attr("src", data.data.url);
				} else {
					layer.alert(data.message);
				}
			}
		});
	}

	var setting_type = {
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
		$("#type").val(treeNode.name);
		$("#typeValue").val(treeNode.value);
	}

	var setting_topicMaterial = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClicktopicMaterial
		}
	};
	function onClicktopicMaterial(event, treeId, treeNode, clickFlag) {
		$("#topicMaterial").val(treeNode.name);
		$("#topicMaterialValue").val(treeNode.value);
	}
	var setting_addr = {
		data : {
			simpleData : {
				enable : true
			},
			key : {
				children : "sub"
			}
		},
		callback : {
			onClick : onClick2
		}
	};
	$("#topicMaterial,#addrId,#type").click(function(e) {
		$($(this).attr("hideDom")).hide();
		$(this).next().show();
		e.stopPropagation();
	});

	function onClick2(event, treeId, treeNode, clickFlag) {
		$("#addrIdValue").val(treeNode.id);
		$("#addrId").val(treeNode.name + treeNode.suffix);
	}
	var zNodes = null;
	var zNodes1 = null;
	$(function() {
		laydate.render({
			elem : '#endTimeStr' //指定元素
			,
			type : 'datetime',
			format : 'yyyy-MM-dd HH:mm:ss'
		});
		laydate.render({
			elem : '#releaseTimeStr' //指定元素
			,
			type : 'datetime',
			format : 'yyyy-MM-dd HH:mm:ss'
		});

		$("#topicMaterial,#addrId,#type").click(function(e) {
			$($(this).attr("hideDom")).hide();
			$(this).next().show();
			e.stopPropagation();
		});

		$("#topicMaterialContent,#typeContent,#addrIdContent").click(
				function(e) {
					e.stopPropagation();
				});
		post("${path}/common/find_dict", {
			code : "DX010"
		}, function(data) {
			$.fn.zTree.init($("#typeUl"), setting_type, data.data);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});
		post("${path}/common/find_dict", {
			code : "DX009"
		}, function(data) {
			$.fn.zTree.init($("#topicMaterialUl"), setting_topicMaterial,
					data.data);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});
		post("${path}/common/find_area", {}, function(data) {
			$.fn.zTree.init($("#addrIdUl"), setting_addr, data.data);
		}, function(data) {
			layer.msg(data.msg, {
				icon : 2
			});
		});

		$("body").click(function() {
			$("#typeContent,#addrIdContent,#topicMaterialContent").hide();
			$("#typeTreeContent").hide();
			$("#themeTreeContent").hide();
		});

		$("#btnSave").click(function() {
			$("#editForm").sub("${path}/financing/fabu/save", function(data) {
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
</script>
