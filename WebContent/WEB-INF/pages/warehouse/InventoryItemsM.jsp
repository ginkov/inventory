<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-xs">
	<div class="panel panel-default">
		<div class="panel-heading"  style="font-size:14px; height:78px;">
			<div>
				<a href="<c:url value="/warehouse/list?mobile"/>" class="glink">仓库</a> / ${warehouse.name} <span id="pMsg"></span>
			</div>
			<div style="margin-top:10px;">
				<a class="btn btn-default btn-sm" 
					href="<c:url value="/warehouse/listflow/${warehouse.id}?mobile"/>" style="margin-right:5px;">
					<i class="fa fa-bars"></i> 记录 
				</a>
			<a class="btn btn-danger btn-sm pull-right" 
					href="<c:url value="/warehouse/popitem/${warehouse.id}?mobile"/>">
				<i class="fa fa-external-link"></i> 出库 
			</a>
			<a class="btn btn-success btn-sm pull-right" 
					href="<c:url value="/warehouse/additem/${warehouse.id}?mobile"/>" style="margin-right:10px;">
				<i class="fa fa-sign-in"></i> 入库
			</a>
			</div>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover" id="table">
				<thead>
					<tr>
						<th>名称</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="entry">
				<tr>
					<td class="no-overflow">
						<a class='glink' href="<c:url value="/item/detail/${entry.id}?mobile"/>">${entry.name}</a>
					<td>${entry.qty}
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div> <!-- /Panel body -->
	</div> <!-- /Panel -->

		<!-- Error Alerts  -->	
		<%@ include file = "/WEB-INF/pages/alert.jsp" %>

</div> <!-- ./padding -->

<script type="text/javascript">
 $(document).ready(function() {
    $('#table').DataTable({
		language: {url: '${pageContext.request.contextPath}/static/Endless-1.5.1/i18n/dataTable-Chinese.json'}
    	, "bJQueryUI": true
    	, "sPaginationType": "full_numbers"
    	, "lengthChange": false
    	, orderClasses: false
	});
    if(document.getElementById("modalAlert")) { $("#modalAlert").modal("show"); }
} );
</script>

