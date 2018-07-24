<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>控制台</title>

<link href="${path }/static/css/bootstrap.min.css-v=3.3.5.css"
	rel="stylesheet">
<link href="${path }/static/css/font-awesome.min.css-v=4.4.0.css"
	rel="stylesheet">
<link href="${path }/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${path }/static/css/animate.min.css" rel="stylesheet">
<link href="${path }/static/css/style.min1.css" rel="stylesheet">
<link rel="stylesheet"
	href="${path}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" />
<link href="${path }/static/css/plugins/treeview/bootstrap-treeview.css"
	rel="stylesheet">
</head>

<body class="gray-bg">
	
	<script src="${path }/static/js/jquery.min.js-v=2.1.4"></script>
	<script src="${path }/static/js/bootstrap.min.js-v=3.3.5"></script>
	<script src="${path }/static/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="${path }/static/js/content.min.js-v=1.0.0"></script>
	<script src="${path }/static/js/demo/peity-demo.min.js"></script>
	<script
		src="${path }/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${path }/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script src="${path }/static/js/plugins/layer/layer.js"></script>
	<script src="${path }/static/js/tools.js"></script>
	<script src="${path }/static/js/plugins/treeview/bootstrap-treeview.js"></script>
	<script src="${path }/static/js/demo/treeview-demo.min.js"></script>
	<script src="${path }/static/plugins/laydate/laydate.js"></script>
	<script src="${path }/static/js/jquery.jqprint-0.3.js"></script>
	<script type="text/javascript">
		var selectDiv = function(t){
			var This = $(t);
			var isT = This.attr("is-t");
			if(isT=="0"){
				This.removeClass("btn-primary").addClass("btn-default").attr("is-t","1");
				$("#selectContent").append('<div class="col-md-2 btn btn-primary btn-rounded " select-data-id="'+This.attr("data-id")+'">'+This.attr("data-name")+'<span class="fa fa-times" onclick="deleteParent(this)"></span></div><div class="col-md-1 btn btn-white btn-bitbucket"><i class="fa fa-arrow-right"></i></div>');
			}else{
				return false;
			}
		};
		var initSelectDiv = function(This){
			var isT = This.attr("is-t");
			if(isT=="1")
				This.removeClass("btn-default").addClass("btn-primary").attr("is-t","0");
		}
		Date.prototype.format = function(format) {
			var date = {
				"M+" : this.getMonth() + 1,
				"d+" : this.getDate(),
				"h+" : this.getHours(),
				"m+" : this.getMinutes(),
				"s+" : this.getSeconds(),
				"q+" : Math.floor((this.getMonth() + 3) / 3),
				"S+" : this.getMilliseconds()
			};
			if (/(y+)/i.test(format)) {
				format = format.replace(RegExp.$1, (this.getFullYear() + '')
						.substr(4 - RegExp.$1.length));
			}
			for ( var k in date) {
				if (new RegExp("(" + k + ")").test(format)) {
					format = format.replace(RegExp.$1,
							RegExp.$1.length == 1 ? date[k] : ("00" + date[k])
									.substr(("" + date[k]).length));
				}
			}
			return format;
		}
		var notNull = function(val) {
			if (val == null || $.trim(val) == '')
				return false;
			return true;
		}
	</script>
</body>
<script type="text/javascript">
	var deleteParent = function(t) {
		initSelectDiv($("[data-id="+$(t).parent().attr("select-data-id")+"]"));
		$(t).parent().next().remove();
		$(t).parent().remove();
	};
	var query_waiting_process_table = function() {
		//先销毁表格  
		$('#waiting_process_table').bootstrapTable('destroy');
		//初始化表格,动态从服务器加载数据  
		$("#waiting_process_table")
				.bootstrapTable(
						{
							method : "post",
							url : "${path}/flow/waiting_process_data",
							striped : true, //表格显示条纹  
							pagination : true, //启动分页  
							pageSize : 10, //每页显示的记录数  
							pageNumber : 1, //当前第几页  
							pageList : [ 10, 20, 50, 100 ], //记录数可选列表  
							height : $(window).height() * 0.4,
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
										radio : true
									},
									{
										field : 'no',
										title : '业务编号',
										formatter : function(value, row) {
											return '<a class="badge badge-primary" style="color: white;" href="javascript:;" onclick="showFlowInfo('+row.id+')">'+value+' </a>';
										},
									},
									{
										field : 'typeDesc',
										title : '业务类型',

									},
									{
										field : 'createUserName',
										title : '业务发起人',

									},
									{
										field : 'createTime',
										title : '发起时间',
										formatter : function(value, row) {
											var newDate = new Date();
											newDate.setTime(value);
											return newDate
													.format("yyyy-MM-dd hh:mm:ss");
										},
									},
									{
										field : 'id',
										title : '业务处理',
										formatter : function(value, row) {
											return '<span class="badge badge-warning" onclick="actionFlow('
													+ value + ')">处理</span>';
										},
									}, ],
							sidePagination : "server", //表示服务端请求  
							queryParamsType : "undefined",

							queryParams : function queryParams(params) { //设置查询参数  
								var param = {
									pageNumber : params.pageNumber,
									pageSize : params.pageSize,
								};
								return param;
							},
							onLoadSuccess : function(data) { //加载成功时执行  
								if (data.code && data.code == -1) {
									layer.msg(data.msg, {
										icon : 2
									});
								}
							},
							onLoadError : function() { //加载失败时执行  
								layer.msg("加载数据失败", {
									time : 1500,
									icon : 2
								});
							}
						});
	}
	var query_processed_table = function() {
		//先销毁表格  
		$('#processed_table').bootstrapTable('destroy');
		//初始化表格,动态从服务器加载数据  
		$("#processed_table").bootstrapTable({
			method : "post",
			url : "${path}/flow/processed_data",
			striped : true, //表格显示条纹  
			pagination : true, //启动分页  
			pageSize : 10, //每页显示的记录数  
			pageNumber : 1, //当前第几页  
			pageList : [ 10, 20, 50, 100 ], //记录数可选列表  
			height : $(window).height() * 0.4,
			search : false, //是否启用查询  
			cache : false,
			selectItemName : "id",
			paginationPreText : '上一页',
			paginationNextText : '下一页',
			showColumns : false, //显示下拉框勾选要显示的列  
			showRefresh : false, //显示刷新按钮 ,
			clickToSelect : true,
			contentType : "application/x-www-form-urlencoded",
			columns : [ {
				radio : true
			}, 
			{
				field : 'no',
				title : '业务编号',
				formatter : function(value, row) {
					return '<a class="badge badge-primary" style="color: white;" href="javascript:;" onclick="showFlowInfo('+row.id+')">'+value+' </a>';
				},
			},
			{
				field : 'typeDesc',
				title : '业务类型',

			}, {
				field : 'createUserName',
				title : '业务发起人',

			}, {
				field : 'createTime',
				title : '发起时间',
				formatter : function(value, row) {
					var newDate = new Date();
					newDate.setTime(value);
					return newDate.format("yyyy-MM-dd hh:mm:ss");
				},
			}, {
				field : 'status',
				title : '业务状态',
				formatter : function(value, row) {
					switch (value) {
					case 0:
						return '处理中';
					case 1:
						return '完成';
					case 2:
						return '驳回';
					case 3:
						return '已取消';

					default:
						return '未知';
					}
				},
			}, ],
			sidePagination : "server", //表示服务端请求  
			queryParamsType : "undefined",

			queryParams : function queryParams(params) { //设置查询参数  
				var param = {
					pageNumber : params.pageNumber,
					pageSize : params.pageSize,
				};
				return param;
			},
			onLoadSuccess : function(data) { //加载成功时执行  
				if (data.code && data.code == -1) {
					layer.msg(data.msg, {
						icon : 2
					});
				}
			},
			onLoadError : function() { //加载失败时执行  
				layer.msg("加载数据失败", {
					time : 1500,
					icon : 2
				});
			}
		});
	}
	var query_my_process_table = function() {
		//先销毁表格  
		$('#my_process_table').bootstrapTable('destroy');
		//初始化表格,动态从服务器加载数据  
		$("#my_process_table")
				.bootstrapTable(
						{
							method : "post",
							url : "${path}/flow/my_process_data",
							striped : true, //表格显示条纹  
							pagination : true, //启动分页  
							pageSize : 10, //每页显示的记录数  
							pageNumber : 1, //当前第几页  
							pageList : [ 10, 20, 50, 100 ], //记录数可选列表  
							height : $(window).height() * 0.4,
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
										radio : true
									},
									{
										field : 'no',
										title : '业务编号',
										formatter : function(value, row) {
											return '<a class="badge badge-primary" style="color: white;" href="javascript:;" onclick="showFlowInfo('+row.id+')">'+value+' </a>';
										},
									},
									{
										field : 'typeDesc',
										title : '业务类型',

									},
									{
										field : 'infoDesc',
										title : '业务详情',
									},
									{
										field : 'createTime',
										title : '发起时间',
										formatter : function(value, row) {
											var newDate = new Date();
											newDate.setTime(value);
											return newDate
													.format("yyyy-MM-dd hh:mm:ss");
										},
									},
									{
										field : 'status',
										title : '业务状态',
										formatter : function(value, row) {
											switch (value) {
											case 0:
												return '处理中';
											case 1:
												return '完成';
											case 2:
												return '驳回';
											case 3:
												return '已取消';

											default:
												return '未知';
											}
										},
									},
									{
										field : 'id',
										title : '业务操作',
										formatter : function(value, row) {
											switch (row.status) {
											case 0:
												return '<span class="badge badge-danger" onclick = "cancelFlow('
														+ value
														+ ')">取消</span>';
											case 1:
												return '-';
											case 2:
												return '-';
											case 3:
												return '-';

											default:
												return '-';
											}
										},
									}, ],
							sidePagination : "server", //表示服务端请求  
							queryParamsType : "undefined",

							queryParams : function queryParams(params) { //设置查询参数  
								var param = {
									pageNumber : params.pageNumber,
									pageSize : params.pageSize,
								};
								return param;
							},
							onLoadSuccess : function(data) { //加载成功时执行  
								if (data.code && data.code == -1) {
									layer.msg(data.msg, {
										icon : 2
									});
								}
							},
							onLoadError : function() { //加载失败时执行  
								layer.msg("加载数据失败", {
									time : 1500,
									icon : 2
								});
							}
						});
	}
	$(function() {
		query_waiting_process_table();
		query_processed_table();
		query_my_process_table();
	});
	var showMenu = function(url) {
		url = url.substring(1, url.length);
		var side_menu = $(window.parent.document.getElementById("side-menu"));
		var aa = side_menu.find("[href$='" + url + "']")[0];
		aa.click();
	};
	var cancelFlow = function(id) {
		layer.confirm('是否取消当前审批？', {
			btn : [ '是', '否' ]
		//按钮
		}, function() {
			post("${path}/flow/cancel", {
				id : id
			}, function(data) {
				layer.msg("处理成功", {
					icon : 1
				});
				query_my_process_table();
			}, function(data) {
				layer.alert(data.msg, {
					icon : 2
				});
			});
		}, function() {

		});
	};

	var addCommonFlow = function() {
		$("#selectContent").html("");
		$("#editModel textarea").html("");
		$("#editModel input").val("");
		$("[data-id]").each(function(){
			initSelectDiv($(this));
		});
		layer.open({
			type : 1,
			title : '发起通用审批',
			closeBtn : 1,
			anim : 2,
			area : [ '60%', '80%' ],
			shadeClose : false,
			content : $("#editModel"),
			btn : [ '提交', '取消' ],
			yes : function(index, layero) {
				var values = $("#selectContent [select-data-id]");
				var userIds = "";
				for(var i = 0;i<values.length;i++){
					var dataId = $(values[i]).attr("select-data-id");
					userIds = userIds + dataId +",";
				}
				$("#user_ids").val(userIds);
				$("#addCommonForm").sub("${path}/flow/add_common",
						function(data) {
							layer.msg("操作成功", {
								icon : 1
							});
							query_my_process_table();
							layer.close(index);
						}, function(data) {
							layer.alert(data.msg, {
								icon : 2
							});
						})
			},
			no : function(index, layero) {
				layer.close(index);
			}
		});
	};
	
	var showFlowInfo = function(id){
		insShowFlowInfoModel(id,function(data){
			layer.open({
				type : 1,
				title : '查看审批详情',
				closeBtn : 1,
				anim : 2,
				area : [ '60%', '80%' ],
				shadeClose : false,
				content : $("#showFlowInfoModel"),
				btn : [ '关闭'],
				yes : function(index, layero) {
					layer.close(index);
				},
				no : function(index, layero) {
					layer.close(index);
				}
			});
		})
	};
	
	var insShowFlowInfoModel = function(id,success){
		post("${path}/flow/query_by_id",{id:id},function(data){
			$("#flow_no").html("审批号:"+data.data.no);
			$("#flow_create_user_name").html(data.data.createUserName);
			$("#flow_create_time").html(new Date(data.data.createTime).format("yyyy-MM-dd hh:mm:ss"));
			$("#flow_type_desc").html(data.data.typeDesc);
			$("#flow_info_desc").html(data.data.infoDesc);
			switch (data.data.status) {
			case 0:
				$("#flow_status").attr("class","label label-warning").html("进行中");
				break;
			case 1:
				$("#flow_status").attr("class","label label-success").html("已完成");
				break;
			case 2:
				$("#flow_status").attr("class","label label-danger").html("已驳回");
				break;
			case 3:
				$("#flow_status").attr("class","label label-danger").html("已取消");
				break;

			default:
				$("#flow_status").attr("class","label label-danger").html("未知");
				break;
			}
			if(data.data.status!=0){
				$("#flow_schedule_class").attr("style","width:100%");
				$("#flow_schedule_value").html("100%");
			}else{
				var bb = parseInt((data.data.spotNum-1)/data.data.num*100);
				$("#flow_schedule_class").attr("style","width:"+bb+"%");
				$("#flow_schedule_value").html(bb+"%");
				
			}
			var flowInfoRecords = data.data.flowInfoRecords;
			$("#flow_info_record_content").html("");
			for(var i = 0;i<flowInfoRecords.length;i++){
				var tr = $("<tr></tr>");
				var flowInfoRecord = flowInfoRecords[i];
				var span = null;
				switch (flowInfoRecord.status) {
				case 0:
					span = $('<span class="label label-warning"><i class="fa fa-hourglass-half"></i>待处理</span>')
					break;
				case 1:
					span = $('<span class="label label-success"><i class="fa fa-check"></i>通过</span>')
					break;
				case 2:
					span = $('<span class="label label-danger"><i class="glyphicon glyphicon-remove"></i>驳回</span>')
					break;

				default:
					span = $('<span class="label label-danger"><i class="fa fa-warning"></i>未知</span>')
					break;
				}
				var td1 = $("<td></td>");
				td1.append(span);
				tr.append(td1);
				tr.append("<td>"+flowInfoRecord.userName+"</td>");
				var actionTime = notNull(flowInfoRecord.actionTime) ? new Date(flowInfoRecord.actionTime).format("yyyy-MM-dd hh:mm:ss") : "";
				tr.append("<td>"+actionTime+"</td>");
				var infoDesc = notNull(flowInfoRecord.infoDesc) ? flowInfoRecord.infoDesc : "";
				tr.append("<td>"+infoDesc+"</td>");
				$("#flow_info_record_content").append(tr);
			}
			success(data.data);
		},function(data){
			layer.alert(data.msg,{icon:2});
		});
	}
	
	var actionFlow = function(id){
		insShowFlowInfoModel(id,function(baseData){
			layer.open({
				type : 1,
				title : '处理通用审批',
				closeBtn : 1,
				anim : 2,
				area : [ '60%', '80%' ],
				shadeClose : false,
				content : $("#showFlowInfoModel"),
				btn : [ '处理', '取消' ],
				yes : function(indexBase, layero) {
					layer.open({
						type : 1,
						title : '处理审批',
						closeBtn : 1,
						anim : 2,
						area : [ '60%', '80%' ],
						shadeClose : false,
						content : $("#actionFlowModel"),
						btn : [ '完成', '取消' ],
						yes : function(index, layero) {
							var status = $("#actionCommonForm [name=status]").val();
							if(!notNull(status) || status == 0){
								layer.msg("请选择处理结果",{icon:7});
								return;
							}
							$("#actionCommonForm [name=id]").val(baseData.id);
							$("#actionCommonForm").sub("${path}/flow/action_common",
									function(data) {
										layer.msg("操作成功", {
											icon : 1
										});
										query_waiting_process_table();
										query_processed_table();
										layer.close(index);
										layer.close(indexBase);
									}, function(data) {
										layer.alert(data.msg, {
											icon : 2
										});
									})
						},
						no : function(index, layero) {
							layer.close(index);
						}
					});
				},
				no : function(index, layero) {
					layer.close(index);
				}
			});
		})
	};
</script>
</html>