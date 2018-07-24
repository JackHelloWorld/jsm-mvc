<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>后台管理</title>


    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${path }/static/css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="${path }/static/css/font-awesome.min.css-v=4.4.0.css"rel="stylesheet">
    <link href="${path }/static/css/animate.min.css" rel="stylesheet">
    <link href="${path }/static/css/style.min1.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <a style="display: none;" class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:;"></a>
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header" style="text-align: center">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${path }/static/img/profile_small.jpg" style="height:60px"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${session_user.nickName }</strong></span>
                                <span class="text-muted text-xs block">${session_user.roleName }<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="javascript:;" onclick="updatePwd()">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${path }/logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">e-os
                        </div>
                    </li>
                    <c:forEach items="${menus }" var="menu">
	                    <li>
	                        <a <c:if test="${fn:length(menu.nodes) < 1}"> class="J_menuItem" </c:if> href="${menu.url }"><i class="${menu.icon }"></i> <span class="nav-label">${menu.text }</span><c:if test="${fn:length(menu.nodes) > 0}"> <span class="fa arrow"></span> </c:if></a>
	                        <c:if test="${fn:length(menu.nodes)>0}">
	                        	<ul class="nav nav-second-level">
		                        	<c:forEach var="node" items="${menu.nodes }">
			                            <li><a <c:if test="${fn:length(node.nodes) < 1}"> class="J_menuItem" </c:if> href="${node.url }"><i class="${node.icon }"></i>${node.text }<c:if test="${fn:length(node.nodes) > 0 }"> <span class="fa arrow"></span> </c:if></a>
			                            	 <c:if test="${fn:length(node.nodes)>0}">
			                            	 	<ul class="nav nav-third-level">
			                            	 	<c:forEach var="n" items="${node.nodes }">
			                                   		<li><a class="J_menuItem" href="${n.url }"><i class="${n.icon }"></i>${n.text }</a></li>
			                            	 	</c:forEach>
			                            	 	</ul>
			                            	 </c:if>
			                            </li>
		                        	</c:forEach>
	                        	</ul>
	                        </c:if>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="${path }/home">控制台</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${path }/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${path }/home" data-id="${path }/home" seamless></iframe>
            </div>
            <div class="footer">
                <div style="text-align: center;">&copy;<a href="javascript:;">后台管理系统</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <div id="updatePwdModel" style="display: none;" class="col-sm-12">
	<form class="form-horizontal" id="updatePwdForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">原密码</label>
			<div class="col-sm-10">
				<input class="form-control" name="old_pwd" type="password"> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">新密码</label>
			<div class="col-sm-10">
				<input class="form-control" name="new_pwd" id="new_pwd" type="password"> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">确认密码</label>
			<div class="col-sm-10">
				<input class="form-control" id="new_pwd1" type="password"> 
			</div>
		</div>
	</form>
</div>
    <script src="${path }/static/js/jquery.min.js-v=2.1.4"></script>
    <script src="${path }/static/js/bootstrap.min.js-v=3.3.5"></script>
    <script src="${path }/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${path }/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${path }/static/js/plugins/layer/layer.js"></script>
    <script src="${path }/static/js/hplus.min.js-v=4.0.0"></script>
    <script type="text/javascript" src="${path }/static/js/contabs.min.js"></script>
    <script src="${path }/static/js/plugins/pace/pace.min.js"></script>
    <script type="text/javascript" src="${path }/static/js/tools.js"></script>
	<script type="text/javascript">
		var updatePwd = function(){
			$("#updatePwdForm input").val("");
			layer.open({
				type : 1,
				title : '修改密码',
				closeBtn : 1,
				anim : 2,
				area : [ '40%', '40%' ],
				shadeClose : false,
				content : $("#updatePwdModel"),
				btn : [ '保存', '取消' ],
				yes : function(index, layero) {
					var newPwd = $("#new_pwd").val();
					var newPwd1 = $("#new_pwd1").val();
					if(newPwd!=newPwd1){
						layer.msg('密码输入不一致',{icon:7});
						return;
					}
					$("#updatePwdForm").sub("${path}/update_pwd", function(data) {
						$("#updatePwdForm input").val("");
						layer.msg("操作成功", {
							icon : 1
						});
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
		}
	</script>
</body>

</html>