/**
 * Created by noah on 17-6-12.
 */


function postSimpleData() {
	$.ajax({
		type: "POST",
		url: "Service/SimpleData",
		contentType: "application/json", //必须有
		dataType: "json", //表示返回值类型，不必须
		data: JSON.stringify({'foo': 'foovalue', 'bar': 'barvalue'}),  //相当于 //data: "{'str1':'foovalue', 'str2':'barvalue'}",
		success: function (jsonResult) {
			alert(jsonResult);
		}
	});
}
function login() {
	$.ajax({
		url: "Service/login",
		type: "POST",
		contentType: "application/json",
		dataType: "json",
		data: JSON.stringify({
			MachineIP: "127.0.0.1",
			AppTag: "4",
			RequestInfo: {
				StaffCode: "",
				Password: "",
				StaffCard: "01411"
			},
		}),
		async: true,
		success: function (data) {
			var ss = JSON.stringify(data);
			$("#result").val(ss);
			console.log(ss);
		}
	});
}
function postEmployees() {
	$.ajax({
		type: "POST",
		url: "Service/Employees",
		contentType: "application/json",
		dataType: "json",
		data: JSON.stringify({
			"Employees": [
				{"firstName": "Bill", "lastName": "Gates"},
				{"firstName": "George", "lastName": "Bush"},
				{"firstName": "Thomas", "lastName": "Carter"}
			]

		}),
		success: function (jsonResult) {
			alert(jsonResult);
		}
	});
}