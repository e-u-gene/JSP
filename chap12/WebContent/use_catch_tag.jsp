<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- c태그 사용하기위해 태그 라이브러리 경로를 적어줘야함. -->
<html>
<head><title>catch 태그</title></head>
<body>

<c:catch var="ex">
name 파라미터의 값 = <%= request.getParameter("name") %><br>
<%  if (request.getParameter("name").equals("test")) {  %>
${param.name}은 test 입니다.
<%  }   %>
</c:catch>
<p>
<c:if test="${ex != null}">
익셉션이 발생하였습니다:<br>
${ex}
</c:if>

</body>
</html>
