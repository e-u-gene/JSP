<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.*" %>
<html>
<head><title>절대 경로 사용하여 자원 읽기</title></head>
<body>

<%
	char[] buff = new char[128];
	int len = -1;
	
	/* 백슬래시를 하나씩 더 넣는 이유? \t와 \n같이 특수키가 존재하기때문에 \\을 두 개 적어줘야함. */
			// 파일의 물리적 위치를 넣어주기! 오ㅐ? 인풋스트림은 상대경로로 읽어올 수 없기 때문에,,,
	String filePath = "D:\\dev\\workspace\\jsp\\chap05\\WebContent\\message\\notice.txt";
	/*  파일 인풋스트림 -> 바이트 기반.이므로 인풋스트림으로 문자형태로 다시 바꾸어줌.*/
	try(InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "UTF-8")) {
		// read 메소드 통해서 데이터를 읽어옴! 
		while ( (len = fr.read(buff)) != -1) {
			// out은 스트링객체로 출력
			out.print(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("익셉션 발생: "+ex.getMessage());
	}
%>

</body>
</html>
