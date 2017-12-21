<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-md">
	<div class="panel panel-default">
		<div class="panel-heading"  style="font-size:14px; height:52px;">
			仓库列表 <span id="pMsg"></span>
			<a class="btn btn-success btn-sm pull-right" 
					href="<c:url value="/warehouse/allflow"/>" style="width: 120px;">
				<i class="fa fa-bars"></i> 全部存取记录
			</a>
			<a class="btn btn-success btn-sm pull-right" 
					href="<c:url value="/warehouse/allitem"/>" style="margin-right:10px; width: 120px;">
				<i class="fa fa-cubes"></i> 查看全部库存
			</a>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover" id="table">
				<thead>
					<tr>
						<th>名称</th>
						<th>地址</th>
						<th>管理员</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="entry">
					<tr>
						<td style="width:120px;"><a class='glink' href="<c:url value="/warehouse/inventory/${entry.id}"/>">${entry.name}</a>
						<td>${entry.addr}
						<td>${entry.ownerName}
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

