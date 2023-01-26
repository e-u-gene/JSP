package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				// 게스트북 커넥션 풀에서 커넥션을 가져옴.
				"jdbc:apache:commons:dbcp:guestbook");
	}
}