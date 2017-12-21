<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="padding-xs text-center" >
	<div class="row" style="margin-top:80px;">
		<a class="btn btn-lg btn-success col-xs-10 col-xs-offset-1"
			href="<c:url value="/warehouse/list?mobile"/>">
			<i class="fa fa-cubes fa-lg"></i> 
			仓库	
		</a>
	</div>
	<div class="row" style="margin-top:40px;">
		<a class="btn btn-lg btn-default col-xs-10 col-xs-offset-1"
			href="<c:url value="/mgmt/list?mobile"/>">
			<i class="fa fa-cog fa-lg"></i>
			设置	
		</a>
	</div>
</div>