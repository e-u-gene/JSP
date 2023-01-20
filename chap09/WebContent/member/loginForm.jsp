<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>로그인폼</title>
</head>
<body>

<!-- 컨텍스패스는 일종의 절대경로 
	만약 위치가 바뀌어 다른 디렉토리에 있다면, 절대패스로 해줘야함...
	<%=request.getContextPath()%>/member/login.jsp써주면 된다.
	getContextPath()는 context root를 의미하므로 chap09/member/login.jsp 
	와 동일한 의미를 가진다.
-->

<!-- 현재 디렉토리에 있는 login.jsp로 보낼때는 이렇게도 가넝 -->
	<form action="./login.jsp"
	method="post">
		아이디 <input type="text" name="id" size="10"> 암호 <input
			type="password" name="password" size="10"> <input
			type="submit" value="로그인">
	</form>

</body>
</html>
