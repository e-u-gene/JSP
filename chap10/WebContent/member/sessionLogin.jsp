<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String id = request.getParameter("id");
	String password =request.getParameter("password");
	
	if (id.equals(password)) {
		session.setAttribute("MEMBERID", id);
		/* 자동 형변환 된것이다. id안에 어떤값이든 들어갈 수 있으므로 object 타입인데
		우린 string값을 줬으므로, 자동으로 형변환 된것.*/
%>
<html>
<head><title>로그인성공</title></head>
<body>

로그인에 성공했습니다.

</body>
</html>
<%
	} else { // 로그인 실패시
%>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
	}
%>
