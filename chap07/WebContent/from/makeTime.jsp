<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
/*  time -> 변수*/
	request.setAttribute("time", cal);
%>
<jsp:forward page="/to/viewTime.jsp" />
