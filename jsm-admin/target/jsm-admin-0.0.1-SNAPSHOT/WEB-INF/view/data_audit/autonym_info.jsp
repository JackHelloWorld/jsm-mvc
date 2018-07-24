<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>${menu_title }</title>
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
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>身份证</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-12">
								<label class="col-sm-2 control-label">正面:</label>
								<div class="col-sm-10">
									<div><img alt="" src="${autonymInfo.identityCardFront }"/></div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<label class="col-sm-2 control-label">背面:</label>
								<div class="col-sm-10">
									<div><img alt="" src="${autonymInfo.identityCardFront }"/></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>数据审核信息</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">申请时间:</label>
								<div class="col-sm-8">
									<div class="form-control">
										<fmt:formatDate value="${autonymInfo.createTime}"
											pattern="yyyy-MM-dd hh:mm:ss" />
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核编号:</label>
								<div class="col-sm-8">
									<div class="form-control">${autonymInfo.auditNumber }</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核人:</label>
								<div class="col-sm-8">
									<div class="form-control">${autonymInfo.auditUser.nickName}</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核时间:</label>
								<div class="col-sm-8">
									<div class="form-control">
									<fmt:formatDate value="${autonymInfo.auditTime}"
											pattern="yyyy-MM-dd hh:mm:ss" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
</body>
</html>