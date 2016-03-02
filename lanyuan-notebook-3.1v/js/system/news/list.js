var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
		}, {
			colkey : "title",
			name : "标题"
		}, {
			colkey : "author",
			name : "作者"
		}, {
			colkey : "description",
			name : "描述"
		}, {
			colkey : "postTime",
			name : "出版时间",
			renderData : function(rowindex, data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			name : "操作",
			renderData : function(data, rowdata, rowindex, column) {
				return "<a href=#>查看文章内容";
			}
		} ],
		jsonUrl : rootPath + '/news/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addNews").click("click", function() {
		addNews();
	});
	$("#editNews").click("click", function() {
		editNews();
	});
	$("#delNews").click("click", function() {
		delNews();
	});
	$("#getContentNews").click("click", function() {
		getContentNews();
	});
});
function editNews() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "800px", "100%" ],
		content : rootPath + '/news/editUI.shtml?id=' + cbox
	});
}
function addNews() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "800px", "100%" ],
		content : rootPath + '/news/addUI.shtml'
	});
}
function delNews() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/news/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function getContentNews() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "查看文章内容",
		type : 2,
		area : [ "1200px", "100%" ],
		content : rootPath + '/news/getContent.shtml?id=' + cbox
	});
}