package mvc.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	// 인터페이스이므로 재정의함.
	public String process(HttpServletRequest req, HttpServletResponse res) {
//		req.setAttribute("login", "안녕하세요!");
		return "/WEB-INF/view/sessionLogout.jsp";
		if(session.invalidate())
	}

}
