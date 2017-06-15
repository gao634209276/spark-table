<%--
  Created by IntelliJ IDEA.
  User: noah
  Date: 17-6-14
  Time: 上午11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-switch.css">
	<link rel="stylesheet" type="text/css" href="icheck/flat/blue.css"/>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="bootstrap/js/jquery-1.11.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
	<script src="bootstrap/bootstrap-table.js"></script>
	<script src="bootstrap/locale/bootstrap-table-zh-CN.js"></script>
	<script src="bootstrap/bootstrap-table-select2-filter.js"></script>
	<script src="bootstrap/bootstrap-switch.js"></script>
	<script src="bootstrap/js/tableExport.js"></script>
	<script src="bootstrap/bootstrap-table-export.js"></script>
	<script src="My97DatePicker/calendar.js"></script>
	<script src="My97DatePicker/WdatePicker.js"></script>
	<title>Title</title>
</head>

<body>
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			查询条件
		</div>
		<div class="panel-body" style="padding-bottom:0px;">
			<div class="panel-body">
				<form id="formSearch" class="form-horizontal">

					<div class="form-group" style="margin-top:15px">
						<label for="event_type" class="control-label col-lg-1 col-md-1">事件类型</label>
						<div class="col-sm-3">
							<select class="form-control" id="event_type">
								<option disabled selected value></option>
								<option value="合约类商品订购">合约类商品订购</option>
								<option value="办理业务">办理业务</option>
								<option value="流量包订购">流量包订购</option>
								<option value="交费充值">交费充值</option>
								<option value="登录">登录</option>
							</select>
						</div>
						<label for="state_type" class="control-label col-sm-1">状态类型</label>
						<div class="col-sm-3">
							<select class="form-control" id="state_type">
								<option value="">---请选择---</option>
								<option value="推荐状态">推荐状态</option>
								<option value="办理业务">办理业务</option>
								<option value="用户登录">用户登录</option>
							</select>
						</div>

					</div>
					<div class="form-group" style="margin-top:15px">

						<label for="province" class="control-label col-sm-1">省份</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="province">
						</div>

						<label for="channel" class="control-label col-sm-1">渠道</label>
						<div class="col-sm-3">
							<select class="form-control" id="channel">
								<option value="">---请选择---</option>
								<option value="码上购">码上购</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>


					<div class="form-group" style="margin-top:15px">

						<label for="recommend_time" class="control-label col-lg-1 col-md-1">推荐时间</label>
						<div class="col-lg-2 col-md-2">
							<input id="recommend_time" class=" form-control" type="text"
							       onFocus="WdatePicker({startDate:'%y-%M-%D %H:00:00',dateFmt:'yyyy-MM-dd HH:00:00',alwaysUseStartDate:true})"/>
						</div>

						<label for="event_time" class="control-label col-lg-1 col-md-1">事件时间</label>
						<div class="col-lg-2 col-md-2">
							<input id="event_time" class=" form-control" type="text"
							       onFocus="WdatePicker({startDate:'%y-%M-%D %H:00:00',dateFmt:'yyyy-MM-dd HH:00:00',alwaysUseStartDate:true})"/>
						</div>
						<div class="col-sm-4" style="text-align:right;">
							<button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">
								查询
							</button>
						</div>
					</div>

					<div class="form-group" style="margin-top:15px">
						<%--<label for="mobile" class="control-label col-sm-1">手机号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mobile">
						</div>--%>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div>
		<table id="table"></table>
	</div>
</div>

<script>
	var queryParams = function (params) {
		var param = {
			/*pageIndex: Math.ceil(params.offset / params.limit) + 1,
			 pageSize: params.limit,
			 order: params.order,
			 ordername: params.sort,*/
			eventType: $("#event_type").val(),
			stateType: $("#state_type").val(),
			province: $("#province").val,
			channel: $("#channel").val,
			recommendTime: $("#recommend_time").val,
			eventTime: $("#event_time").val
		};
		return param;
	}


	$('#table').bootstrapTable({
		//url: '/json/user3',
		url: 'json/user2',
		method: "post",
		contextType: "application/x-www-form-urlencoded",
		// contentType : "application/json;charset=utf-8",
		queryParams: queryParams,
		columns: [
			{field: 'mobile', title: 'mobile'},
			{field: 'eventType', title: 'eventType'},
			{field: 'stateType', title: 'stateType'},
			{field: 'province', title: 'province'},
			{field: 'channel', title: 'channel'},
			{field: 'recommendTime', title: 'recommendTime'},
			{field: 'eventTime', title: 'eventTime'},
		],
		toolbar: '#toobar',
		showRefresh: true,
		pageNumber: 1,//默认加载页
		pageSize: 5,//每页数据
		pageList: [5, 10, 20],//可选的每页数据
		height: 460,
		search: true,
		strictSearch: true,
		clickToSelect: true,
		showColumns: true,
		showToggle: true,
		cardView: false,
		detailView: false,
		pagination: true,
		showExport: true,
		exportDataType: "all", //basic', 'all', 'selected'.
		formatLoadingMessage: function () {
			return "请稍等，正在加载中...";
		},
		formatNoMatches: function () {  //没有匹配的结果
			return '无符合条件的记录';
		},
		onLoadError: function (data) {
			$('#table').bootstrapTable('removeAll');
		}
	});

	function getUser() {
		$('#table').bootstrapTable('refresh', {});
	}
</script>


</body>
</html>
