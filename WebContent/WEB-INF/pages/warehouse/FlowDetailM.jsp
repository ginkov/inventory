<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="padding-xs">
	<div class="panel panel-default">
		<div class="panel-heading" style="font-size:14px; height:52px;">
			<span><a href="<c:url value="/warehouse/list?mobile"/>" class='glink'>仓库</a> / 
			<a class="glink" href="<c:url value="/warehouse/inventory/${warehouse.id}?mobile"/>">${obj.warehouseName}</a>
			</span>
			
		</div>
		<div class="panel-body form-horizontal">
			<div class="form-group">
				<label class="col-md-2 control-label">时间</label>
				<div class="col-md-8">
					<input class="form-control" value="<fmt:formatDate value="${obj.timestamp}" pattern="yyyy-MM-dd" />" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">物料</label>
				<div class="col-md-8">
					<input class="form-control" value="${obj.itemName}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">数量</label>
				<div class="col-md-8">
					<input class="form-control" value="${obj.qty}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">单位</label>
				<div class="col-md-8">
					<input class="form-control" value="${obj.unit}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">从</label>
				<div class="col-md-8">
					<c:choose>
					<c:when test="${obj.io == I}">
						<input class="form-control" value="${obj.otherPlace}" readonly/>
					</c:when>
					<c:otherwise>
						<input class="form-control" value="${obj.warehouseName}" readonly/>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">到</label>
				<div class="col-md-8">
					<c:choose>
					<c:when test="${obj.io == I}">
						<input class="form-control" value="${obj.warehouseName}" readonly/>
					</c:when>
					<c:otherwise>
						<input class="form-control" value="${obj.otherPlace}" readonly/>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">经手人</label>
				<div class="col-md-8">
					<input class="form-control" value="${obj.operator}" readonly/>
				</div>
			</div>

			
		</div> <!-- /Panel body -->
		<div class="panel-footer">
		</div><!-- panel-footer -->
	</div> <!-- /Panel -->
<!-- Error Alerts  -->
<%@ include file = "/WEB-INF/pages/alert.jsp" %>
</div> <!-- ./padding -->