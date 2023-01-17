<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 컨텐츠 타입은 text/html . 아파치 톰캣은 기본적으로 디코딩을 UTF-8로 한다.. 
그래서 인코딩도 UTF-8로 되어있어야 타입이 맞아서 글씨가 깨지지 않는다... 만약 타입이 다르면 글씨는 깨질것.-->
<%@ page import="java.util.Date" %>
<%
	Date now = new Date();
%>
<html>
<head><title>현재 시간</title></head>
<body>
현재 시각: 
<%= now %>
</body>
</html>
