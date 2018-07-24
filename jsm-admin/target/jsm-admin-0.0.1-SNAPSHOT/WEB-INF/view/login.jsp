<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>后台管理系统 - 登录</title>
<link href="${path }/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/static/css/font-awesome.min.css-v=4.4.0.css"
	rel="stylesheet">
<link href="${path }/static/css/animate.min.css" rel="stylesheet">
<link href="${path }/static/css/style.min.css" rel="stylesheet">
<link href="${path }/static/css/login.min.css" rel="stylesheet">
<script type="text/javascript"
	src="${path }/static/js/jquery.min.js-v=2.1.4"></script>
<script type="text/javascript" src="${path }/static/js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${path }/static/js/tools.js"></script>
<style type="text/css">
	.layui-layer-content{
		color: black;
	}
</style>
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>后台管理系统</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						欢迎使用 <strong>后台管理系统</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 数据统计</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 业务监控</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 用户管理</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 权限管理</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-5">
				<form method="post" action="javascript:;" id="loginForm">
					<h4 class="no-margins">登录：</h4>
					<p class="m-t-md">登录到系统</p>
					<input type="text" class="form-control uname" name="login_name" placeholder="用户名" />
					<input type="password" class="form-control pword m-b"
						placeholder="密码" name="login_pwd" />
					<input type="text" class="form-control pword m-b" name="login_code" placeholder="验证码" />
						<img alt="" id="generate_code_id" src="${path }/generate_code" onclick="generate_code(this)"/>
					<button class="btn btn-success btn-block" onclick="login();">登录</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var login = function(){
		$("#loginForm").sub("${path}/login",function(data){
			location.href="${path}/index"
		},function(data){
			layer.alert(data.msg,{icon:2,title:"登录错误"});
			$("#generate_code_id").get(0).click();
		},"登录中...");
	}
	var generate_code = function(t){
		$(t).attr("src","${path}/generate_code?time="+new Date().getTime());
	}
</script>
</html>