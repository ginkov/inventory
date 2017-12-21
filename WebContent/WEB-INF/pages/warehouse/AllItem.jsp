<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-md">
	<div class="panel panel-default">
		<div class="panel-heading"  style="font-size:14px; height:52px;">
			<a class="glink" href="<c:url value="/warehouse/list"/>">仓库</a> / 所有库存信息 <span id="pMsg"></span>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover" id="table">
				<thead>
					<tr>
						<th>仓库</th>
						<th>名称</th>
						<th>数量</th>
						<th>单位</th>
						<th>最近存取</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="entry">
					<tr>
						<td style="width:120px;">
							<a class='glink' href="<c:url value="/warehouse/inventory/${entry.warehouse.id}"/>">
							${entry.warehouse.name}</a>
						<td>${entry.name}
						<td>${entry.qty}
						<td>${entry.unit}
						<td><fmt:formatDate value="${entry.lastChange}" pattern="yyyy-MM-dd" />
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

