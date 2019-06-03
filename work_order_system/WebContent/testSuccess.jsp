<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>测试页面</h1>
	<p>测试成功</p>
	<p>${msg}${workOrderCountOfGroup}</p>
	<script src="js/MyjsV0-8.2.js"></script>
	<script>
		ajax({
			url:"test.do",
			type:"post",
			data:{user:"lisi"},
			success:function(msg){
				alert($$.json.toObject(msg).get("user"));
			}
		});
	</script>
</body>
</html>