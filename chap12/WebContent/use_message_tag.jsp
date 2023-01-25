<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <fmt:setLocale value="en" />  --%>
<!-- 위의 주석을 풀면 영어로 실행될것이다.! -->

<fmt:bundle basename="resource.message">
<!-- 태그몸체에 사용할 리소스 번들을 지정해줌. chap12 프로젝트 안의 리소스 패키지안의 message로 
시작되는 문서들을 의미함.-->
<fmt:message key="TITLE" var="title"/>
<!--메시지를 출력한다. 번들에서 정의한 키값을 var에 집어넣는다. -->
<html>
<head><title>${title}</title></head>
<!-- title을 헤드에서 출력! -->
<body>

<fmt:message key="GREETING" />
<br>
<c:if test="${! empty param.id}">
<fmt:message key="VISITOR">
    <fmt:param value="${param.id}" />
</fmt:message>
</c:if>

</body>
</html>
</fmt:bundle>
