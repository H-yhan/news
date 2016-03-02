<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/news/add.js"></script>
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
	text-align: right;
}

.col-sm-9 {
	width: 85%;
	float: left;
	text-align: left;
}

label[class ^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/news/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">标题</label>
				</div>
				<div class="col-sm-9">
					<input type="title" class="form-control"
						placeholder="请输入标题,12字数以内、、、" name="newsFormMap.title" id="title"
						maxlength="12">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">作者</label>
				<div class="col-sm-9">
					<input type="author" class="form-control checkacc"
						placeholder="请输入作者姓名。。。" name="newsFormMap.author" id="author"
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
						placeholder="请输入描述内容，50字数以内" name="newsFormMap.description"
						id="description" maxlength="12">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label for="name">文章内容</label>
				<textarea id="edit_id" name="newsFormMap.content" cols="100"
					rows="8" style="width:750px;height:400px;visibility:hidden"></textarea>
			</div>
			<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
			</footer>
		</section>
	</form>
	<script type="text/javascript">
		onloadurl();
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>