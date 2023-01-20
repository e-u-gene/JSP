<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>
<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
	response.sendRedirect("../examples/login.jsp");
/* AUTH 쿠키를 날려라! 초를 0으로 설정했으므로! 쿠키 날리기가 가능하다.*/
%>
