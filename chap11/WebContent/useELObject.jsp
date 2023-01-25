<%@ page contentType = "text/html; charset=utf-8" %>
<%
	request.setAttribute("name", "최범균");
%>
<html>
<head><title>EL Object</title></head>
<body>

요청 URI: ${pageContext.request.requestURI}<br>
<!-- pageContext의 request객체의 URI를 가져온다..  -->
request의 name 속성: ${requestScope.name}<br>
<%= request.getAttribute("name") %>
<!-- 표현식으로 표현하면 이렇게 표현할 수 있다. -->
code 파라미터: ${param.code}
<%=request.getParameter("code") %>
<!-- 표현식으로 표현하면 이렇게 표현할 수 있다. -->

</body>
</html>
