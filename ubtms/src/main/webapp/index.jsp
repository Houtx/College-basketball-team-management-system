<%--登录页面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<title>Hello Maven</title>
	</head>
	
	<body>
		<p>大家好！</p>
		<%
			response.sendRedirect("/user/mainPage");
		%>
	</body>
</html>