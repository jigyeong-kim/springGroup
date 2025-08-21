package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet ("*.test")
public class Extension2Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/study2/mapping/";
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		
		if(command.equals("home")) {
			viewPage += command;
		}
		else if(command.equals("guest")) {
			viewPage += command;
		}
		else if(command.equals("board")) {
			viewPage += command;
		}
		else if(command.equals("pds")) {
			viewPage += command;
		}else {
			viewPage += "extension2";
		}
		
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
