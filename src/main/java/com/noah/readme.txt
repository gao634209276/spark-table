$.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/msgquery/messageQuery.json",
            data: {
                'startDay': $("#startTime").val(),
                 //...
            },
            success: function (result) {
                viewModel.dataList.removeAll();

                    for (var i = 0; i < result.listPage.length; i++) {
                        viewModel.dataList.push(result.listPage[i]);
                    }

                }
            }
        });


4.至于controller测试，测试appoint方法可不必写jsp，用curl就行，比如
curl -H "Accept: application/json;charset=utf-8" -d "id=1" localhost:8080/ajax/ajax/test

curl -l -H "Content-type: application/json" -X POST -d '{"phone":"13521389587","password":"test"}' localhost:8080/main/test/hello
curl -H "Accept: application/json;charset=utf-8" -XPOST  localhost:8080/main/test/hellotest  -d "id=1"

curl -XPOST  localhost:8080/ajax/bodyTest -d '{"id":1,"name":"jin","sex":"man","address":"moerben","age":"12","phone":"110"}'

curl -XPOST  localhost:8080/ajax/bodyTest -d {"username":"zhangsan","name":"jin","sex":"man","email":"moerben@qq.com","age":"12","phone":"110"}

{"username":"zhangsan","name":"jin","sex":"man","email":"moerben@qq.com","age":"12","phone":"110"}



curl -H "Content-type: application/json;charset=utf-8" -X POST localhost:8080/ajax/getUser -d '{"username":"zhangsan","name":"jin","sex":"man","email":"moerben@qq.com","age":"12","phone":"110"}'






http://blog.csdn.net/heting90/article/details/52248729
http://www.cnblogs.com/huanzei/category/759362.html
http://blog.csdn.net/lipingrong01/article/details/51316385
http://www.cnblogs.com/gamehiboy/p/5176618.html
http://www.cnblogs.com/yanglang/p/6697657.html
















