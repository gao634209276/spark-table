<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/view/common/head.jsp" %>
	<%--	<style>
			.ui-widget {
				font-family: Verdana, Arial, sans-serif /*{ffDefault}*/;
				font-size: 1.3rem /*{fsDefault}*/;
			}
		</style>--%>
	<%--	<style>
			body {
				cursor: pointer;
			}

			.combo-input {
				width: 100%;
				font-size: 1.1rem;
			}

			.combo-dropdown li {
				font-size: 1.2rem;
				list-style: outside none none;
				margin: 0;
				padding: 8px 1em;
			}
		</style>--%>

	<script type="text/javascript">

		function setshow() {
			$.ajax({
				type: "POST",
				async: true,
				url: "<%=request.getContextPath()%>/ajax/Hello",
				data: {
					'room': $("#roomid").find('option:selected').text(),
					'roomid': $("#roomid").val()
				},
				dataType: "json",
				success: function (data) {
					if (data.success) {
						value = data;
					}
					else {
						alert("设置失败！");
					}
				},
				error: function () {
					alert("网络连接出错！");
				}
			});
			return value;
		}
	</script>
</head>

<body>
<h2>Hello World!</h2>

<form role="form" class="form-inline">
	<div class="form-group">
		<label>日期</label>
		<input type="date" class="form-control">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail">邮箱</label>
		<input type="email" class="form-control" id="exampleInputEmail" placeholder="请输入您的邮箱地址">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">密码</label>
		<input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入您的邮箱密码">
	</div>
	<div class="checkbox">
		<label>
			<input type="checkbox">记住密码
		</label>
	</div>
	<button type="submit" class="btn btn-default">进入邮箱</button>
</form>

<table class="table table-striped table-bordered table-hover">
	<thead>
	<tr>
		<th>表格标题</th>
		<th>表格标题</th>
		<th>表格标题</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>表格单元格</td>
		<td>表格单元格</td>
		<td>表格单元格</td>
	</tr>
	<tr>
		<td>表格单元格</td>
		<td>表格单元格</td>
		<td>表格单元格</td>
	</tr>
	</tbody>
</body>
</html>
