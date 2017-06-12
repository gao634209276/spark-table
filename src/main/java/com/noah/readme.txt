$.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/msgquery/messageQuery.json",
            data: {
                'startDay': $("#startTime").val(),
                 //...
            },
            success: function (result) {
                viewModel.dataList.removeAll();
                if (result.error == 1 || result == "") {
                    $("#pageP").hide();
                    $('#querybtn').removeAttr("disabled");
//                        alert(result.errordetail);
                    alert("暂无 数据");
                } else {
                    for (var i = 0; i < result.listPage.length; i++) {
                        viewModel.dataList.push(result.listPage[i]);
                    }
                    $('#querybtn').removeAttr("disabled");
                    $("#tablesize").val(result.tablesize);
//                        sethighlight();
                }
            }
        });


4.至于controller测试，测试appoint方法可不必写jsp，用curl就行，比如
curl -H "Accept: application/json;charset=utf-8" -d "id=1" localhost:8080/main/test/hello

curl -l -H "Content-type: application/json" -X POST -d '{"phone":"13521389587","password":"test"}' localhost:8080/main/test/hello
curl -H "Accept: application/json;charset=utf-8" -XPOST  localhost:8080/main/test/hellotest  -d "id=1"
