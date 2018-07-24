<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<title>${menu_title }</title>
	<link href="${path }/static/css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="${path }/static/css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">
    <link href="${path }/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path }/static/css/animate.min.css" rel="stylesheet">
    <link href="${path }/static/css/style.min1.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" />
    <link href="${path }/static/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content" style="margin-left: 10px;margin-right: 10px;">
        <div class="row animated fadeInRight">
              <div class="ibox float-e-margins col-sm-12">
                 <div class="ibox-title">
                     <h5>${menu_content }</h5>
                     <div class="ibox-tools">
                         <a href="javascript:location.replace(location.href)" style="color: #1c84c6" title="刷新">
                             <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                         </a>
                     </div>
                 </div>
                 <div class="ibox-content">