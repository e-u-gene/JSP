<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>초기화 파라미터 읽어오기</title></head>
<body>

초기화 파라미터 목록:
<ul>
<%
/*getInitParameterNames() -> 웹 어플리케이션 초기파라미터의 목록을 리턴  */
    Enumeration<String> initParamEnum = application.getInitParameterNames();
	while (initParamEnum.hasMoreElements()) {
		/* web.xml 파일의 요소들이 더 이상 없을 때까지 와일문 실행 */
		String initParamName = initParamEnum.nextElement();
%>
<li><%= initParamName %> = 
    <%= application.getInitParameter(initParamName) %>
<%
	}
%>
</ul>
</body>
</html>
