<%--
  Created by IntelliJ IDEA.
  User: Noah
  Date: 2017/6/12
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="datas" border="1" cellspacing="0" style="border-collapse: collapse">
    <tr>
        <th>订单ID</th>
        <th>客户ID</th>
        <th>雇员ID</th>
        <th>订购日期</th>
        <th>发货日期</th>
        <th>货主名称</th>
        <th>货主地址</th>
        <th>货主城市</th>
        <th>更多信息</th>
    </tr>
    <tr id="template">
        <td id="OrderID"></td>
        <td id="CustomerID"></td>
        <td id="EmployeeID"></td>
        <td id="OrderDate"></td>
        <td id="ShippedDate"></td>
        <td id="ShippedName"></td>
        <td id="ShippedAddress"></td>
        <td id="ShippedCity"></td>
        <td id="more"></td>
    </tr>
</table>
<%--http://www.cnblogs.com/fredlau/archive/2008/08/12/1266089.html--%>
<script>
    $.ajax({
        type: "get",//使用get方法访问后台
        dataType: "json",//返回json格式的数据
        url: "BackHandler.ashx",//要访问的后台地址
        data: "pageIndex=" + pageIndex,//要发送的数据
        complete: function () {
            $("#load").hide();
        },//AJAX请求完成时隐藏loading提示
        success: function (msg) {//msg为返回的数据，在这里做数据绑定
            var data = msg.table;
            $.each(data, function (i, n) {
                var row = $("#template").clone();
                row.find("#OrderID").text(n.订单ID);
                row.find("#CustomerID").text(n.客户ID);
                row.find("#EmployeeID").text(n.雇员ID);
                row.find("#OrderDate").text(ChangeDate(n.订购日期));
                if (n.发货日期 !== undefined) row.find("#ShippedDate").text(ChangeDate(n.发货日期));
                row.find("#ShippedName").text(n.货主名称);
                row.find("#ShippedAddress").text(n.货主地址);
                row.find("#ShippedCity").text(n.货主城市);
                row.find("#more").html("<a href=OrderInfo.aspx?id=" + n.订单ID + "&pageindex=" + pageIndex + ">&nbsp;More</a>");
                row.attr("id", "ready");//改变绑定好数据的行的id
                row.appendTo("#datas");//添加到模板的容器中
            });

</script>
</body>
</html>
