<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>
<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
/* AUTH 쿠키를 날려라! 초를 0으로 설정했으므로! 쿠키 날리기가 가능하다.*/
%>
<html>
<head>
<title>로그아웃</title>
</head>
<body>로그아웃하였습니다.

</body>
</html>
