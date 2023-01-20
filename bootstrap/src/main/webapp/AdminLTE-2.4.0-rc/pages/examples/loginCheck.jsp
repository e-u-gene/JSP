<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>    

<%
//스트링 객체를 생성..!
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	if (email.equals(password)) {
		/* // ID와 암호가 같으면 로그인에 성공한 것으로 판단. */
		response.addCookie(Cookies.createCookie("AUTH", email, "/", -1));
		response.sendRedirect("../main/index.jsp");
%>
<html>
<head>
<title>로그인성공</title>
</head>
<body>
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