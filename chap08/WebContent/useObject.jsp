<%@ page contentType = "text/html; charset=utf-8" %>
<!-- 아래의 useBean 코드는 새로 만드는것은 아니고 기존에 있는것을 가져온것이다. -->
<jsp:useBean id="member" scope="request"
             class="chap08.member.MemberInfo" />
<html>
<head><title>인사말</title></head>
<body>

<%= member.getName() %> (<%= member.getId() %>) 회원님
안녕하세요.

</body>
</html>
