package study.j0805;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/test04Ok")
public class Test04 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		response.setContentType("text/html; charset=UTF-8");
		
//		response.getWriter().append("name : " + name + "<br>");
//		response.getWriter().append("age : " + age + "<br>");
//		response.getWriter().append("<a href='0805/test04.jsp'>Back</a>");
		
		PrintWriter out = response.getWriter();
		out.println("성명 : " + name + "<br>나이 : " + age + "<br><a href='0805/test04.jsp'>Back</a>");
	}
}
