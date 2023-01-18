<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	
	if (name != null && value != null) {
		application.setAttribute(name, value);
		/* "이름","김수한무거북이와두루미" */
	}
%>

<html>
<head><title>application 속성 지정</title></head>
<body>
<%
	if (name != null && value != null) {
%>
application 기본 객체의 속성 설정:
<!-- 이거는 변수를 출력한것. -->
  <br><%= name %> = <%= value %><br>

 <!-- 이 밑의 출력식은 설정된 값들을 다시 불러오는것. -->
 이름 = <%= application.getAttribute(name) %> 
 <!-- 키가 "이름" 변수는 name, name안의 값이 이름이므로 괄호안에 name 대신 "이름"을 넣어도 값이 잘 출력된다. -->
<%
	} else {
%>
application 기본 객체의 속성 설정 안 함
<%
	}
%>
</body>
</html>
