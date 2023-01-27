package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

// 얘는 서블릿! http 통신이 가능한 자바클래스
public class ControllerUsingFile extends HttpServlet {

    // <커맨드, 핸들러인스턴스> 매핑 정보 저장
    private Map<String, CommandHandler> commandHandlerMap = 
    		new HashMap<>();
    // {"hello",new HelloHandler}

    public void init() throws ServletException {
        String configFile = getInitParameter("configFile");
        //-> /WEB-INF/commandHandler.properties
        Properties prop = new Properties(); 
        // properties 맵 -> 키와 밸류가 스트링타입 <String, String>
        String configFilePath = getServletContext().getRealPath(configFile);
        //configFile의 리얼패스!
        // D:\dev\workspace\jsp\chap18\WebContent\WEB-INF\commandHandler.properties 얘를 가져옴
        try (FileReader fis = new FileReader(configFilePath)) {
//        	문자기반의 입력스트림인 FileReader에 리얼패스를 넣음.
//        	property 객체의 load에 fis를 넣음
//        	load는 문자기반의 입력스트림값만 들어갈 수 있음.
        	prop.load(fis);
        	// prop{"hello ":"mvc.hello.HelloHandler ", "key":"value"} 이렇게 키와 밸류가 들어올것이다.
        	
        	// 파일이므로 파일없으면 예외 발생하므로 try-catch 잡아줌.
        } catch (IOException e) {
            throw new ServletException(e);
        }
        
//        키를 다시 set으로 만들어줌. 
        Iterator keyIter = prop.keySet().iterator();
        // hello 하나 존재하므로 true
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();// command에 hello 나옴
            String handlerClassName = prop.getProperty(command);
            // hello 를 집어넣으면 밸류값인mvc.hello.HelloHandler 리턴
            try {
//            	handlerClassName 클래스를 메모리에 로드
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
                // new HelloHandler(); 의미와 동일
                commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
            		| IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
    }
    // url 요청 들어오면 get 방식으로 요청들어옴 -> doget 메소드 실행
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
    	// 실행되면 cmd 를 읽어옴
        String command = request.getParameter("cmd");
        
        
        // 밸류값은 new HelloHandler() 이거고 이거 리턴을 해준다.
        CommandHandler handler = commandHandlerMap.get(command);
        if (handler == null) {
            handler = new NullHandler();
        }
        String viewPage = null;
        try {
            viewPage = handler.process(request, response);//"/WEB-INF/view/hello.jsp 로 리턴하게 함.
//            process는 이제 new HelloHandler() 의 메소드가 되는것.
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        if (viewPage != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
    }
}
