<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cmn-Hans">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 找不到网页</title>

  <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/favicon-32x32.png">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless-skin.css">
  <script src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/endless/endless.js"></script>
</head>
<body>
	<div id="wrapper">
		<div class="padding-md" style="margin-top:50px;">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 text-center" style="margin-top: 80px;">
					<div class="h5"> 没有找到页面 </div>
					<h1 class="m-top-none error-heading">404</h1>
					
					<a class="btn btn-success m-bottom-sm" href="<c:url value="/index" />"><i class="fa fa-home"></i> 返回首页</a>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.padding-md -->
	</div><!-- /wrapper -->
</body>
</html>
