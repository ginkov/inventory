<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="zh_CN" scope="session"/>
<div class="padding-md">
	<div class="panel panel-default">
		<div class="panel-heading" style="font-size:14px; height:52px;">
			<span><a href="<c:url value="/mgmt/list"/>" class='glink'>仓库</a> / ${obj.name} </span>
				<a id="btnEdit" class="btn btn-default btn-sm pull-right" 
						href="<c:url value="/mgmt/edit/${obj.id}"/>" style="width: 100px;">
						<i class="fa fa-pencil"></i> 修改</a>
				<button id="btnDel" style="width:60px; margin-right: 20px;" 
						class="btn btn-danger btn-sm pull-right" data-toggle="modal" data-target="#modalConfirmDel">
						<i class="fa fa-trash"></i> 删除</button>
		</div>
		<div class="panel-body form-horizontal">
			<div class="form-group">
				<label class="col-md-2 control-label">名称</label>
				<div class="col-md-9">
					<input class="form-control" value="${obj.name}" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">地址</label>
				<div class="col-md-9">
					<input class="form-control" value="${obj.addr}" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">管理员</label>
				<div class="col-md-9">
					<input class="form-control" value="${obj.ownerName}" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">备注</label>
				<div class="col-md-9">
					<input class="form-control" value="${obj.description}" readonly />
				</div>
			</div>

		</div><!-- panel-body-->
	</div> <!-- /Panel -->
</div> <!-- ./padding -->

<div class="modal fade" id="modalConfirmDel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				确定要删除吗?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        		<a type="button" class="btn btn-sm btn-danger" href="<c:url value="/mgmt/del/${obj.id}" />">删除</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
 } );
</script>