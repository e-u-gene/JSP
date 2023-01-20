<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	/*리퀘스트로 쿠키를 얻고,,!  */
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0 ; i < cookies.length ; i++) {
			if (cookies[i].getName().equals("name")) {
				Cookie cookie = new Cookie("name", "");
				/*맥스에이지를 0로 바꾸어서 삭제!  */
				cookie.setMaxAge(5);
				response.addCookie(cookie);
			}
		}
	}
%>
<html>
<head><title>쿠키 삭제</title></head>
<body>
name 쿠키를 삭제합니다.
</body>
</html>
