<%@ page contentType = "text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberInfo" class="chap08.member.MemberInfo" />
<!-- 우선 객체를 만들고 그뒤에 setProperty를 함 -->


<!--파라미터로 넘어온 값들을 다 넣어라..~이건 한땀한땀 작성하는 방식...
근데 파라미터가 많아질 수록 노동력과 시간투입이 너무 많아짐.. 
<jsp:setProperty name="memberInfo" property="id" param = "id"/>
<jsp:setProperty name="memberInfo" property="name" param = "name"/>
<jsp:setProperty name="memberInfo" property="email" param = "email"/>
 -->
 
<jsp:setProperty name="memberInfo" property="*" />
<!-- 이 별표를 넣으면 id와 똑같은 프로퍼티들 전부가 들어가게 됨...! 즉, 자동으로매핑되어 프로퍼티 설정이 된다. -->
<jsp:setProperty name="memberInfo" property="password"
				 value="<%= memberInfo.getId() %>" />
<html>
<head><title>가입</title></head>
<body>

<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>아이디</td>
	<td><jsp:getProperty name="memberInfo" property="id" /></td>
	<td>암호</td>
	<td><jsp:getProperty name="memberInfo" property="password" /></td>
</tr>
<tr>
<tr>
    <td>이름</td>
    <td><jsp:getProperty name="memberInfo" property="name" /></td>
    <td>이메일</td>
    <td><jsp:getProperty name="memberInfo" property="email" /></td>
</tr>
</table>

</body>
</html>
