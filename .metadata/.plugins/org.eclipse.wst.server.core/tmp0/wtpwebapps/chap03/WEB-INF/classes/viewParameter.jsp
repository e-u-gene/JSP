<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
/*리퀘스트 객체의 데이터 파일을 utf-8로 인코딩하겠음!
파라미터에 한글이 포함된 경우 인코딩 잘 못하면 글씨가 깨지닉가요,,*/
	request.setCharacterEncoding("utf-8");
%>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<b>request.getParameter() 메서드 사용</b><br>


<!-- name이라는 파라미터에 들어있는 녀석을 출력해라. -->
<!-- 내가 입력한 파라미터를 가져오는게 바로 getParameter 메소드임. -->
name 파라미터 = <%= request.getParameter("name") %> <br>

address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues() 메서드 사용</b><br>
<%
/*valuse 라는 메소드는 이름이 pet인 모든 파라미터의 값을 문자열 배열로 구현함...
() 안에 뭐가 들어갔는지에 따라 구현하는 배열이다름.  */
	String[] values = request.getParameterValues("pet");
	if (values != null) {
	for (int i = 0 ; i < values.length ; i++) {
%>
	<%= values[i] %>

<!-- 여기서 다시 스크립트렛을 쓴이유는?
출력을 위해서는 표현식이 필요한데 표현식이후 스크립트렛으로 다시 for문과 if문의 괄호를 닫아줘야 하므로. -->
<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	Map parameterMap = request.getParameterMap();
/*{"name" : "홍길동" ,"address" : "서울", "pet" :{"dog","cat","pig"}  */
	String[] nameParam = (String[])parameterMap.get("name");
	if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>
