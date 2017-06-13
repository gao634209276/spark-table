<%--
  Created by IntelliJ IDEA.
  User: noah
  Date: 17-6-13
  Time: 下午2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<head>
		<meta charset="UTF-8">
		<title>Bootstrap-Table</title>
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/js/bootstrap-table.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	</head>
	<title> Test Get User</title>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="/js/bootstrap-table.js"></script>
	<script src="/js/bootstrap-table-zh-CN.js"></script>

	<script>
		//1.点击按钮事件
		function getUser() {
			$('#userListTable').bootstrapTable('refresh');
		}

		$(function () {
			a();
		});
		function a() {
			$('#userListTable').bootstrapTable({
				url: '/ajax/getUser2', //服务器数据的加载地址
				method: 'post',
				//contentType : "application/x-www-form-urlencoded",
				//contentType : "application/json",
				//dataType: "json",
				toolbar: '#toobar',
				showRefresh: true,
				//showColumns: true,
				striped: true,
				cache: false,
				pagination: true,
				sidePagination: 'client',//client server
				sortable: false,
				sortOrder: "asc",

				//field字段必须与服务器端返回的字段对应才会显示出数据
				columns: [{field: 'name', title: '姓名', align: 'center', valign: 'middle'},
					{field: 'sex', title: '性别'},
					{field: 'phone', title: '手机'},
					{field: 'email', title: '邮箱', align: 'center'},
					{field: 'rolename', title: '权限', align: 'center'}
				],//页面需要展示的列，后端交互对象的属性
				queryParams: function (params) {
					return {
						pageSize: params.pageSize,
						pageNumber: params.pageNumber,
						username: $("#search_username").val(),
						name: $("#search_name").val(),
						sex: $("#search_sex").val(),
						phone: $("#search_mobile").val(),
						email: $("#search_email").val()
					}
				},
				pageNumber: 1,//默认加载页
				pageSize: 5,//每页数据
				pageList: [5, 10, 20],//可选的每页数据
				strictSearch: true,
				clickToSelect: true,
				height: 460,
				cardView: false,
				detailView: false
			});
		}
	</script>
</head>
<body>
<div id="page-content" class="animated fadeInRight">
	<div class="col-sm-4 col-md-3 col-lg-3" style="width: 100%;">
		<form id="search_User">
			<div class="panel-body search_box">
				<div class="search_div">
					<label for="search_name">用户姓名：</label>
					<input type="text" class="form-control" id="search_name" name="UserV2.name">
				</div>
				<div class="search_div">
					<label for="search_mobile">手机号：</label>
					<input type="text" class="form-control" id="search_mobile" name="UserV2.phone">
				</div>
				<div class="search_div">
					<label for="search_sex">性别：</label>
					<select class="form-control" id="search_sex" name="UserV2.sex">
						<option value="">---请选择---</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="panel-body search_box">
				<div class="search_div">
					<label for="search_name">用户账号：</label>
					<input type="text" class="form-control" id="search_username" name="UserV2.username">
				</div>
				<div class="search_div">
					<label for="search_name">用户Email：</label>
					<input type="text" class="form-control" id="search_email" name="UserV2.email">
				</div>
				<div class="search_div" style="text-align: center;">
					<input type="button" class="btn btn-primary btn_search" value="搜索" onclick="getUser()"/>
				</div>
			</div>
		</form>
	</div>
	<table id="userListTable"></table>
</div>

</body>
</html>
