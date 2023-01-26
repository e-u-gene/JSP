<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%

	// 파라미터가 들어오면 읽어서 idValue에 저장
	String idValue = request.getParameter("id");
	/*드라이버로드 작업이 없음.
	왜? 로드하는 코드를 각각 페이지별로 넣음.*/
			
	// conn은 Connection타입의 변수
	Connection conn = null;
	//PreparedStatement 타입의 변수 두개를 설정
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtDetail = null;
	
		
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
						"useUnicode=true&characterEncoding=utf8";
	String dbUser = "jspexam";
	String dbPass = "jsppw";
	
	//Throwable 모든 예외에 대한 부모 클래스이며 occuredException라는 변수를 선언
	Throwable occuredException = null;
	
	try {
		// 변수가 스트링으로 들어오므로 int형으로 바꿔줌.
		int id = Integer.parseInt(idValue); // id 밸류를 1로 지정
		
		
		//jdbc api
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//transaction 처리 -> 여러개의 데이터 베이스를 하나로 묶는것.
		// commit을 통해서 DB를 하나로 묶었음.따라서 오토커밋은 거짓으로 바꿔줘야함.
		conn.setAutoCommit(false);
		
		
		/* String query = "insert into ITEM values("+id+", '상품이름"+id+"')";
		Statement stmt = conn.createStatement();
		int num =  stmt.executeUpdate(query);
		 -> statement 객체로 하면 가독성이 너무 떨어져서 prepareStatement 사용함. 
		*/
		 
		
		
		//prepareStatement객체는 쿼리를 물음표로 지정함.
		pstmtItem = conn.prepareStatement("insert into ITEM values (?, ?)");
		pstmtItem.setInt(1, id);// 이 값은 첫번째 물음표에 id를 지정
		pstmtItem.setString(2, "상품 이름 " + id); // 이 값은 두번째 물음표에 할당됨.
		pstmtItem.executeUpdate();
		
		// 파라미터에 error라고 치면 null값이 아니게 되므로
		if (request.getParameter("error") != null) {
			// 의도적으로 예외가 발생된다. 예외가 발생되므로 try문을 빠져나와 catch문으로 가게된다.
			throw new Exception("의도적 익셉션 발생");
		}
		
		pstmtDetail = conn.prepareStatement(
			"insert into ITEM_DETAIL values (?, ?)");
		pstmtDetail.setInt(1, id);
		pstmtDetail.setString(2, "상세 설명 " + id);
		pstmtDetail.executeUpdate();
		
		// 커밋을 통해 두개의 실행문을 하나의 트랜잭션으로 만들어줌.
		// 커밋 전까지는 물리적 데이터에 저장된 상태가 아님. 사용자에게만 보여지는 상태임.
		conn.commit();
		
		
		// 모든 예외를 캐치하려고 trowable 클래스를 사용했으며 여기서 e는 throw new Exception("의도적 익셉션 발생");
		// 이 값을 담는다.
	} catch(Throwable e) {
		// conn이 널이 아니면
		if (conn != null) {
			try {
				// rollback을 발생시킨다.
				conn.rollback();
			} catch(SQLException ex) {}
		}
		
		occuredException = e;// occuredExecption에 위에서 할당한 e를 넣어줌.
	} finally {
		// 그 뒤에 pstmt도 닫아줌.
		if (pstmtItem != null)
			try { pstmtItem.close(); } catch(SQLException ex) {}
		if (pstmtDetail != null)
			try { pstmtDetail.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<html>
<head><title>ITEM 값 입력</title></head>
<body>

<!-- 저 위의 트라이캐치문에서 occuredException변수에 값을 할당해주었으므로 예외 발생시 이 메시지가 브라우저에 뜸.-->
<%  if (occuredException != null) { %>
에러가 발생하였음: <%= occuredException.getMessage() %>
<%  } else { %>
데이터가 성공적으로 들어감
<%  } %>
</body>
</html>
