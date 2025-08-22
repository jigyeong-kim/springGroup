package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet ("*.test4")
public class Extension4Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Extension4Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		
		if(com.equals("Home4")) {
			command = new HomeCommand();
			command.execute(request, response);
			viewPage += "home4";
		}
		else if(com.equals("Guest4")) {
			command = new GuestCommand();
			command.execute(request, response);
			viewPage += "guest4";
		}
		else if(com.equals("Board4")) {
			command = new BoardCommand();
			command.execute(request, response);
			viewPage += "board4";
		}
		else if(com.equals("Pds4")) {
			command = new PdsCommand();
			command.execute(request, response);
			viewPage += "pds4";
		}else {
			viewPage += "extension4";
		}
		
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
