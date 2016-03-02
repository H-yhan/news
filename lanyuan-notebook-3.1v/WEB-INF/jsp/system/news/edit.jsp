<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/news/edit.js"></script>
<link rel="stylesheet"
	href="${ctx}/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="${ctx}/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${ctx}/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="${ctx}/js/kindeditor/plugins/code/prettify.js"></script>
<script>
	KindEditor.ready(function(K) {
		K.create('#edit_id', {
			uploadJson : '${ctx}/upload_json.jsp',
			fileManagerJson : '${ctx}/file_manager_json.jsp',
			allowFileManager : true,
			afterBlur : function() {
				this.sync();
			}
		});
	});
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/news/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${news.id}"
			name="userFormMap.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">标题</label>
				</div>
				<div class="col-sm-9">
					<input type="title" class="form-control" value="${news.title }"
						name="newsFormMap.title" id="title" maxlength="12">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">作者</label>
				</div>
				<div class="col-sm-9">
					<input type="author" class="form-control checkacc"
						value="${news.author }" name="newsFormMap.author" id="author"
						maxlength="5">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">描述</label>
				</div>
				<div class="col-sm-9">
					<input type="description" class="form-control"
						value="${news.description }" name="newsFormMap.description"
						id="description" maxlength="12">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
			<div class="form-group">
				<label for="name">文章内容</label>
				<textarea id="edit_id" name="newsFormMap.content" cols="100"
					rows="8" style="width:750px;height:400px;visibility:hidden">${news.content }</textarea>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">保存</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
		onloadurl();
	</script>
</body>
</html>