<%@ page contentType = "text/html; charset=utf-8" %>
<jsp:useBean id="member" scope="request" class="chap08.member.MemberInfo" />
<!-- 위의 코드는 -->
 
<!--  
 chap08.member.MemberInfo member = new chap08.member.MemberInfo();
 스크립트렛을 사용한 이 코드와 동일한 역할을 한다.
-->
<%
	member.setId("madvirus");
	member.setName("최범균");
%>
<jsp:forward page="/useObject.jsp" />
