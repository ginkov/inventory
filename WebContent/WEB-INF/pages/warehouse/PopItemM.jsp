<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="padding-xs">
	<form:form modelAttribute="obj" name="form" cssClass="form-horizontal" 
			action="${pageContext.request.contextPath}/warehouse/savepop/${warehouse.id}" 
			method="post" acceptCharset='utf-8'>
	<div class="panel panel-default">
		<div class="panel-heading" style="font-size:14px; height:52px;">
			<a href="<c:url value="/warehouse/list?mobile"/>" class='glink'>仓库</a> / 
			<a class="glink" href="<c:url value="/warehouse/inventory/${warehouse.id}?mobile"/>">${warehouse.name}</a>
			<input id="btnSumbit" class="btn btn-success btn-sm pull-right" style="width: 100px;" type="submit" value="出库"/>
		</div>
		<div class="panel-body">
			<form:hidden path="id"/>
			<input type="hidden" name="mobile" value="true"/>
			<input type="hidden" name="io" value="O"/>
			<div class="form-group">
				<label class="col-md-2 control-label" for="itemName">物料</label>
				<div class="col-md-8">
					<form:select path="itemName" cssClass="form-control chosen-select" items="${warehouse.items}"
						itemValue="name" itemLabel="name"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="qty">数量</label>
				<div class="col-md-8">
					<form:input path="qty" cssClass="form-control" value="0"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-2 control-label" for="otherPlace">目的地</label>
				<div class="col-md-8">
					<form:input path="otherPlace" cssClass="form-control" required="true"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="purpose">说明</label>
				<div class="col-md-8">
					<form:input path="purpose" cssClass="form-control"/>
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
//	$('.chosen-select').chosen({"search_contains":false});
	$('.chosen-select').chosen();
});
</script>
