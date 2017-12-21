<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>${pageTitle}</title>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/colorbox/colorbox.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/jquery.dataTables_themeroller.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/TableTools-2.2.4/css/dataTables.tableTools.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/datepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Endless-1.5.1/css/endless-skin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/chosen_v1.5.1/chosen.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/select2-4.0.3/select2.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/jstree/dist/themes/proton/style.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/uncompressed/pace.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery.popupoverlay.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/uncompressed/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/TableTools-2.2.4/js/dataTables.tableTools.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/uncompressed/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/modernizr.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/Endless-1.5.1/js/endless/endless.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/chosen_v1.5.1/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/select2-4.0.3/select2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jstree/dist/jstree.min.js"></script>
	<style type="text/css">
		body { font-family: "Microsoft YaHei",  sans-serif, monospace; }
		.pointer {
			cursor: pointer;
			-webkit-touch-callout: none;
    		-webkit-user-select: none;
    		-khtml-user-select: none;
    		-moz-user-select: none;
    		-ms-user-select: none;
			user-select: none;
		}
		.glink {
			color: #b8860b; font-weight: bold; 
		}
		.no-overflow{
			overflow:hidden; white-space: nowrap; text-overflow:ellipsis;
		}
	</style>
</head>
<body>
	<!-- 采用 endless admin 前端框架构建  -->
	<!-- Main Wrapper -->
    <div id="wrapper">
<!-- Top Navigation -->
    <div id="top-nav" class="fixed skin-6">
			<div class="brand">
			<a href="<c:url value="/index"/>"><img alt="Brand" src="${pageContext.request.contextPath}/static/img/logo.png" style="height: 23px;"></a> 
			库存管理 </div>
			<button type="button" class="navbar-toggle pull-left hide-menu" id="menuToggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<ul class="nav-notification clearfix">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown"><i class='fa fa-user fa-lg'></i> <%=request.getUserPrincipal().getName()%> <i class="fa fa-angle-down fa-lg"></i></a>
					<ul class="dropdown-menu task dropdown-1" style="width: 60px;">
						<li> <a class="clearfix" href="<c:url value="/logout"/>">退出 <i class="fa fa-sign-out"></i></a>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-question-circle fa-lg"></i>
					</a>
					<ul class="dropdown-menu task dropdown-2" style="width: 60px;">
						<li> <a class="clearfix" href="#" data-toggle="modal" data-target="#modal-help-about">关于</a></li>
					</ul>
				</li>
			</ul>
    </div>
    <!-- End of Top Navigation -->

    <!-- Sidebar Menu -->
    <aside class="skin-6">
    	<div class="main-menu">
		    <ul>
		    	<!-- 开始分析，两级菜单 -->
			    <li>
			    		<a href="<c:url value="/warehouse/list"/>">
						<span class="menu-icon"> <i class="fa fa-cubes"></i> </span>
						<span class="text">仓库</span>
						<span class="menu-hover"></span>
					</a>
				</li>
			    <li>
			    		<a href="<c:url value="/mgmt/list"/>">
						<span class="menu-icon"> <i class="fa fa-cog fa-lg"></i> </span>
						<span class="text">设置</span>
						<span class="menu-hover"></span>
					</a>
				</li>
		    </ul>
    </div>
    </aside>
    <!-- End of Sidebar Menu -->

    <!-- Main Container -->
    <div id="main-container">
    	<jsp:include page="/WEB-INF/pages/${pageContent}.jsp"/>
	</div>
    <!-- End of Main Container -->

    <!-- Footer -->
    <footer>
    </footer> <!-- End of Footer -->

</div> <!-- End of Main Wrapper -->

    <!--Modal-->
		<div class="modal fade" id="modal-help-about">
  			<div class="modal-dialog modal-sm">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>关于库存管理</h4>
      				</div>
				    <div class="modal-body">
				        <p>管理 库存信息</p>
			        	<br>
			        	<p> 目前系统刚刚上线，不免会有很多错误和不方便的地方
			        	<p> 请使用中及时反馈。感谢！
			        	<p>
			        	<p class="pull-right">v1.0 佳耘科技 2017</p>
			        	<br>
				    </div>
				    <div class="modal-footer">
				        <button class="btn btn-sm btn-success" data-dismiss="modal">关闭</button>
				    </div>
			  	</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
</body>