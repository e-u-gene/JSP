<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
	String memberID = request.getParameter("memberID");
%>
<html>
<head><title>회원 정보</title></head>
<body>

<%
// 1. jdbc 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	// try - catch로 받음
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "jspexam";
		String dbPass = "jsppw";
		String query = 
		  /* 요 밑에가 실행되는 쿼리문 */
				"select * from MEMBER where MEMBERID = '"+memberID+"'";
		
		//2.데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//3. 스테이트먼트 생성
		stmt = conn.createStatement();
		
		// 쿼리 실행
		rs = stmt.executeQuery(query);
		//
		if( rs.next() ) {
%>
<table border="1">
<tr>
	<td>아이디</td><td><%= memberID %></td>
</tr>
<tr>
	<td>암호</td><td><%= rs.getString("PASSWORD") %></td>
</tr>
<tr>
	<td>이름</td><td><%= rs.getString("NAME") %></td>
</tr>
<tr>
	<td>이메일</td><td><%= rs.getString("EMAIL") %></td>
</tr>
</table>
<%
		} else {
%>
<%= memberID %>에 해당하는 정보가 존재하지 않습니다.
<%
		}
	} catch(SQLException ex) {
%>
에러 발생: <%= ex.getMessage() %>
<%
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>

</body>
</html>
