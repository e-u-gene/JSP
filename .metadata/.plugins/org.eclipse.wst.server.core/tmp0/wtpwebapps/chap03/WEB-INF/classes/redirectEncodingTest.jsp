<%@ page pageEncoding="utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	String value = "자바";
  /* 자바라는 String value를 utf-8형태로 인코딩하라고 하는 메소드  */
	String encodedValue = URLEncoder.encode(value, "utf-8");
  // 위의 값을 가지고 ch03의 index.jsp로 리다이렉트 하라는것.
	response.sendRedirect("/chap03/index.jsp?name=" + encodedValue);
%>
