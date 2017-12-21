<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cmn-Hans">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>系统内部错误</title>

<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/favicon-32x32.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless-skin.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/endless/endless.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/js/bootstrap.min.js"></script>
<style>
  .error {margin: 5px; padding: 5px; border-bottom: 1px solid lightgrey; }
  .glink {color: #b8860b; font-weight: bold;}
</style>
</head>

<body>
  <div id="wrapper">
    <div class="padding-md" style="margin-top:50px;">

      <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 text-center">
          <div class="h4">抱歉, 系统内部出错了 ...</div>
          <h1 class="m-top-none error-heading">500</h1>
          <a class="btn btn-success m-bottom-sm" href="${pageContext.request.contextPath}/index"><i class="fa fa-home"></i> 返回首页 </a>
        </div><!-- /.col -->
      </div><!-- /.row -->

      <div class="row">
		<div class='col-md-2 text-right'><h5 style="padding-top:5px;">错误:</h5></div>
		<div class='col-md-9 error'>${pageContext.exception}</div>
      </div> <!-- /.row -->

      <div class='row'>
		<div class='col-md-2 text-right'><h5>出错地址:</h5></div>
		<div class='col-md-9 error'>${pageContext.errorData.requestURI}</div>
      </div> <!-- /.row -->

      <div class='row'>
		<div class='col-md-2 text-right' onclick="show()"><h5 class="glink" >详情:</h5></div>
		<div class='col-md-9 error' id='divDetail'>
			<c:forEach var="trace" items="${pageContext.exception.stackTrace}">
				<p>${trace}</p>
			</c:forEach>		
		</div>
      </div> <!-- /.row -->

    </div><!-- /.padding-md -->
  </div><!-- /wrapper -->
</body>

<script type="text/javascript">
	function show() {
		$('#divDetail').toggle();
	}
	
	$(function(){show();});
</script>
</html>