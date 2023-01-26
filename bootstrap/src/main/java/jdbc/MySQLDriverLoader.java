package jdbc;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/*서블릿 클래스를 사용하기 위한 제약조건
 servlet클래스 -> http를 상속받은 자식 클래스로 작성한다.
 init 메소드는 이 클래스를 실행하면 자동으로 실행되게 하는메소드이며, 
 init의 역할은 Class.forName("com.mysql.jdbc.Driver"); 위 코드를
 자동으로 서버에 올리는 역할이다. 
  */
public class MySQLDriverLoader extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception ex) {
            throw new ServletException(ex);
        }
    }
}
