<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>
<%
	Cookies cookies = new Cookies(request);
%>
<html>
<head>
<title>로그인여부 검사</title>
</head>
<body>

	<%
		if (cookies.exists("AUTH")) {
			/*만약 로그인 하지 않았다면 AUTH 생성이 안되어 있을것*/
	%>
	아이디 "<%=cookies.getValue("AUTH")%>"로 로그인 한 상태
	<%
		} else {
	%>
	로그인하지 않은 상태
	<%
		}
	%>
</body>
</html>
