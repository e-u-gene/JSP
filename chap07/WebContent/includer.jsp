<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>include 디렉티브</title></head>
<body>

<%
/*인클루더에서 저장한 변수  */
	int number = 10;
%>

<!-- file = "" 따옴표 사이에 첨부하고 싶은 파일을 적어준다.-->
<%@ include file="/includee.jspf" %>

공통변수 DATAFOLDER = "<%= dataFolder %>"

</body>
</html>
