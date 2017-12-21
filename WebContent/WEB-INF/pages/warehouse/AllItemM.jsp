<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-xs">
	<div class="panel panel-default">
		<div class="panel-heading"  style="font-size:14px; height:52px;">
			<a class="glink" href="<c:url value="/warehouse/list?mobile"/>">仓库</a> / 所有库存信息 <span id="pMsg"></span>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover" id="table">
				<thead>
					<tr>
						<th>仓库</th>
						<th>名称</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="entry">
					<tr>
						<td>
							<a class='glink' href="<c:url value="/warehouse/inventory/${entry.warehouse.id}?mobile"/>">
							${entry.warehouse.name}</a>
						<td class="no-overflow">${entry.name}
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

