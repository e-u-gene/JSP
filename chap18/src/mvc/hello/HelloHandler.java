package mvc.hello;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class HelloHandler implements CommandHandler {

	@Override
	// 인터페이스이므로 재정의함.
	public String process(HttpServletRequest req, HttpServletResponse res) {
//		req.setAttribute("hello", "안녕하세요!");
		return "/WEB-INF/view/hello.jsp";
	}

}
