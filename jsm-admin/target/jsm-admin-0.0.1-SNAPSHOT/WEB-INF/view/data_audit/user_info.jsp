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
					<h5>基本资料</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">姓名:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.name }</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">别名:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.alias }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">照 片:</label>
								<div class="col-sm-8">
									<img alt="" src="${loginUserInfo.photo }">
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">性别:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.sex == 0?'男':'女' }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">出生日期:</label>
								<div class="col-sm-8">
									<div class="form-control">
										<fmt:formatDate value="${loginUserInfo.birthday }"
											pattern="yyyy-MM-dd" />
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">参加工作时间:</label>
								<div class="col-sm-8">
									<div class="form-control">
										<c:if test="${loginUserInfo.workTime == null }">
											未工作
										</c:if>
										<c:if test="${loginUserInfo.workTime != null }">
											<fmt:formatDate value="${loginUserInfo.workTime }"
												pattern="yyyy-MM-dd" />
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">经营地址:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.address }</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">民族:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.nation }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">婚姻状况:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.maritalStatus }</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">身高:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.stature }厘米</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">体重:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.weight }kg</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">地址:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.addrStr }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">详细地址:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.address}</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">户籍所在地:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.nativePlaceStr }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">户籍地址:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.nativePlaceAddress}</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">职业:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.profession }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">毕业院校:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.graduateInstitution}"</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">专业:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.study }</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">学历:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.education}"</div>
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
										<fmt:formatDate value="${loginUserInfo.createTime}"
											pattern="yyyy-MM-dd hh:mm:ss" />
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核编号:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.auditNumber }</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核人:</label>
								<div class="col-sm-8">
									<div class="form-control">${loginUserInfo.auditUser.nickName}</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label class="col-sm-4 control-label">审核时间:</label>
								<div class="col-sm-8">
									<div class="form-control">
										<fmt:formatDate value="${loginUserInfo.auditTime}" pattern="yyyy-MM-dd hh:mm:ss" />
									</div>
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
					<h5>个人获奖信息</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="form-horizontal">
						<c:forEach items="${loginUserInfo.loginUserHonors }"
							var="loginUserHonor">
							<div class="form-group">
								<div class="col-sm-6">
									<label class="col-sm-4 control-label">名称:</label>
									<div class="col-sm-8">
										<div class="form-control">${loginUserHonor.name}</div>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-4 control-label">图片:</label>
									<div class="col-sm-8">
										<img alt="" src="${loginUserHonor.img}">
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>个人代表作</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="form-horizontal">
						<c:forEach items="${loginUserInfo.loginUserMagnumOpus }"
							var="loginUserMagnumOpu">
							<div class="form-group">
								<div class="col-sm-6">
									<label class="col-sm-4 control-label">名称:</label>
									<div class="col-sm-8">
										<div class="form-control">
											<a target="_blank" href="${loginUserMagnumOpu.url}"
												title="点击查看">${loginUserMagnumOpu.name}</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
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