<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (id.equals(password)) {
		/* // ID와 암호가 같으면 로그인에 성공한 것으로 판단. */
		response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
		/* 위코드가 돌아가려면 우선 import로 쿠키 클래스를 가져와야함. */
%>
<html>
<head>
<title>로그인성공</title>
</head>
<body>로그인에 성공했습니다.

</body>
</html>
<%
	} else { // 로그인 실패시
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
	/* 얘는 바로 전 페이지로 가는것 */
</script>
<%
	}
%>
