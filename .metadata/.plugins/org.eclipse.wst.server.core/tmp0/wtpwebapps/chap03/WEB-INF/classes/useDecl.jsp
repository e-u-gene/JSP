<%@ page contentType = "text/html; charset=utf-8" %>
<%!
	public int multiply(int a , int b) {
		int c = a * b;
		return c;
	}
%>
<!-- 위의 선언부에서 메소드를 선언한것. -->

<html>
<head><title>선언부를 사용한 두 정수값의 곱</title></head>
<body>

10 * 25 = <%= multiply(10, 25) %>

</body>
</html>
