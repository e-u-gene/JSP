<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Calendar" %>
<html>
<head><title>현재 시간</title></head>
<body>

<%
/* request객체의 타임을 불러온다. 그 타임을 캘린더 객체로 강제 형변환 해준다. */
	Calendar cal = (Calendar) request.getAttribute("time");
%>
현재 시간은 <%= cal.get(Calendar.HOUR) %>시
			<%= cal.get(Calendar.MINUTE) %>분
			<%= cal.get(Calendar.SECOND) %>초 입니다.
</body>
</html>
