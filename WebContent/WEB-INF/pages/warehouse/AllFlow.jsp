<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-md">
	<div class="panel panel-default">
		<div class="panel-heading"  style="font-size:14px; height:52px;">
			<a class="glink" href="<c:url value="/warehouse/list"/>">仓库</a> / 所有存取记录<span id="pMsg"></span>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover" id="table">
				<thead>
					<tr>
						<th>日期</th>
						<th>名称</th>
						<th>数量</th>
						<th>单位</th>
						<th>源</th>
						<th>到</th>
						<th>目的</th>
						<th>经手人</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="entry">
				<tr>
					<td><fmt:formatDate value="${entry.timestamp}" pattern="yyyy-MM-dd" />
					<td>${entry.itemName}
					<td>${entry.qty}
					<td>${entry.unit}
					<c:choose>
						<c:when test="${entry.io == 'I'}">
						<td>${entry.otherPlace}
						</c:when>
						<c:otherwise>
						<td>${entry.warehouseName}
						</c:otherwise>
					</c:choose>
					<td>到
					<c:choose>
						<c:when test="${entry.io == 'I'}">
						<td>${entry.warehouseName}
						</c:when>
						<c:otherwise>
						<td>${entry.otherPlace}
						</c:otherwise>
					</c:choose>
					<td>${entry.operator}
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

