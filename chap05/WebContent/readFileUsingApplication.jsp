<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.*" %>
<html>
<head><title>application 기본 객체 사용하여 자원 읽기</title></head>
<body>

<%
/*스트링 객체를 선언하고 message 파일안 notice 패스를 넣어준다.  */
	String resourcePath = "/message/notice.txt";
%>
자원의 실제 경로:<br>
<!-- getRealPath는 절대경로를 구할것임. -->
<%= application.getRealPath(resourcePath) %>
<br>
----------<br>
<%= resourcePath %>의 내용<br>
----------<br>
<%
	char[] buff = new char[128];
	int len = -1;
	
	// 여전히 인풋스트림으로 절대경로만 유효하므로 상대경로를 절대경로로 바꾸어주는 작업을 거친다.
	try(InputStreamReader br = new InputStreamReader(
				application.getResourceAsStream(resourcePath), "UTF-8")) {
		while ( (len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("익셉션 발생: "+ex.getMessage());
	}
%>

</body>
</html>
