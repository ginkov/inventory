<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="padding-md">
	<form:form modelAttribute="obj" name="form" cssClass="form-horizontal" action="${pageContext.request.contextPath}/mgmt/update" method="post" acceptCharset='utf-8'>
	<div class="panel panel-default">
		<div class="panel-heading" style="font-size:14px; height:52px;">
			<span><a href="<c:url value="/mgmt/list"/>" class='glink'>仓库</a> / ${obj.name} / 编辑</span>
			<input id="btnSumbit" class="btn btn-success btn-sm pull-right" style="width: 100px;" type="submit" value="保存"/>
		</div>
		<div class="panel-body">
			<form:hidden path="id"/>
			<div class="form-group">
				<label class="col-md-2 control-label" for="name">名称</label>
				<div class="col-md-9">
					<form:input path="name" cssClass="form-control"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-2 control-label" for="addr">地址</label>
				<div class="col-md-9">
					<form:input path="addr" cssClass="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="owner">管理员</label>
				<div class="col-md-9">
					<form:select cssClass="chosen-select" path="owner" items="${people}" itemLabel="name" itemValue="uid"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-2 control-label" for="description">备注</label>
				<div class="col-md-9">
					<form:input path="description" cssClass="form-control"/>
				</div>
			</div>
			
			
		</div> <!-- /Panel body -->
		<div class="panel-footer">
		</div><!-- panel-footer -->
	</div> <!-- /Panel -->
	</form:form>
	<!-- Error Alerts  -->
	<%@ include file = "/WEB-INF/pages/alert.jsp" %>
</div> <!-- ./padding -->

<script type="text/javascript">

$().ready(function(){
	$('.chosen-select').chosen({"search_contains":false});
	if (document.getElementById("modalAlert")) { $("#modalAlert").modal("show"); }
});
</script>
