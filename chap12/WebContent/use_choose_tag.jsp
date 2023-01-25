<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>choose 태그</title>
</head>
<body>

	<%-- <%
	String name = "bk";
	switch(name){
		case "bk":
		 out.println("당신의 이름은 bk입니다.");		
		 break;
		default:
		-> 이거랑 밑의 c태그랑 동일.
	}
%>
 --%>
	<ul>
	<!-- 셋 중 하나 일치하면, 그다음으로 넘어가지 않음...!  -->
		<c:choose>
			<c:when test="${param.name == 'bk'}">
				<li>당신의 이름은 ${param.name} 입니다.
			</c:when>
			<c:when test="${param.age > 20}">
				<li>당신은 20세 이상입니다.
			</c:when>
			<c:otherwise>
				<li>당신은 'bk'가 아니고 20세 이상이 아닙니다.
			</c:otherwise>
		</c:choose>
	</ul>

</body>
</html>
