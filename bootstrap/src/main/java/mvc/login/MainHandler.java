package mvc.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MainHandler implements CommandHandler {

	@Override
	// 인터페이스이므로 재정의함.
	public String process(HttpServletRequest req, HttpServletResponse res) {
//		req.setAttribute("login", "안녕하세요!");
		return "/WEB-INF/main/index.jsp";
	}

}
