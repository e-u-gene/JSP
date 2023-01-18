
<!--페이지 디렉티브  -->
<%@ page contentType="text/html; charset=utf-8" %>


<!--스크립트렛: 자바 실행문 기술한다.  -->
<%
	String id = request.getParameter("memberId");
/*id가 널값이 아니고 id가 madvirus가 아니면 if문 실행  */
	if (id != null && id.equals("madvirus")) {
		response.sendRedirect("/chap03/index.jsp");
	} else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
잘못된 아이디입니다.
</body>
</html>

<!--여기서 스크립트렛으로 다시 else문의 대괄호를 닫아준다.  -->
<%
	}
%>
