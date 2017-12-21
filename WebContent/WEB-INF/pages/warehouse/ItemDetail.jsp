<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="padding-md">
	<form:form modelAttribute="obj" name="form" cssClass="form-horizontal" 
			action="${pageContext.request.contextPath}/item/save" 
			method="post" acceptCharset='utf-8'>
	<div class="panel panel-default">
		<div class="panel-heading" style="font-size:14px; height:52px;">
			<span><a href="<c:url value="/warehouse/list"/>" class='glink'>仓库</a> / 
			<a class="glink" href="<c:url value="/warehouse/inventory/${obj.warehouse.id}"/>">${obj.warehouse.name}</a>
			</span>
			<input id="btnSumbit" class="btn btn-success btn-sm pull-right" style="width: 100px;" type="submit" value="修改"/>
			<a id="btnDel" style="width:60px; margin-right: 20px;" 
						class="btn btn-danger btn-sm pull-right" data-toggle="modal" data-target="#modalConfirmDel">
						<i class="fa fa-trash"></i> 删除</a>
			
		</div>
		<div class="panel-body">
			<form:hidden path="id"/>
			<div class="form-group">
				<label class="col-md-2 control-label" for="name">物料</label>
				<div class="col-md-8">
					<form:input path="name" cssClass="form-control"/>
				</div>
			</div>
			<form:hidden path="qty"/>
			<form:hidden path="warehouse.id" />

			<div class="form-group">
				<label class="col-md-2 control-label" for="qty">数量</label>
				<div class="col-md-5">
					<input class="form-control" value="${obj.qty}" readonly/>
				</div>
				<label class="col-md-1 control-label" for="unit">单位</label>
				<div class="col-md-2">
					<form:input path="unit" cssClass="form-control"/>
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

<div class="modal fade" id="modalConfirmDel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				确定要删除吗 ?<br>
				此操作会被记录
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        		<a type="button" class="btn btn-sm btn-danger" href="<c:url value="/item/del/${obj.id}" />">删除</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$().ready(function(){
});
</script>
