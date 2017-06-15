4.至于controller测试，测试appoint方法可不必写jsp，用curl就行，比如
curl -l -H "Content-type: application/json" -X POST -d ' ' localhost:8080/main/test/hello
curl -H "Content-type: application/json;charset=utf-8" -X POST localhost:8080/ajax/getUser
-d '{"username":"zhangsan","name":"jin","sex":"man","email":"moerben@qq.com","age":"12","phone":"110"}'

http://blog.csdn.net/heting90/article/details/52248729
http://www.cnblogs.com/huanzei/category/759362.html
http://blog.csdn.net/lipingrong01/article/details/51316385
http://www.cnblogs.com/gamehiboy/p/5176618.html
http://www.cnblogs.com/yanglang/p/6697657.html

-------------------------------------------------------------------
t_codewapdetail
字段:
province_id
city_id
usermobile
fzr_usermobile
application
app_from
fazhanren
tuijian_time
activ_time
activ_level
activ_type
product_name
state_type
lq_result
fail_respon
yyt_no
develop_no
------------------------
private String provinceId;
private String appFrom;
private String tuijianTime;
private String activeTime;
private String activeType;
private String stateType;
private String userMobile;







bj-yz302-c02-r720-3
bj-yz302-c02-r720-1
bj-yz302-c02-r720-2
bj-yz302-f12-r720-6
bj-yz302-f13-r720-1
bj-yz302-f13-r720-3
bj-yz302-f13-r720-4




