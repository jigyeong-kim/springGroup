package study.j0806;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet ("/J0806/T15_2Ok")
public class T15_2Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requsest, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		requsest.setCharacterEncoding("utf-8");
		
		String name = requsest.getParameter("name")==null ? "" : requsest.getParameter("name");
		String hakbun = requsest.getParameter("hakbun")==null ? "" : requsest.getParameter("hakbun");
		String hostIp = requsest.getParameter("hostIp")==null ? "" : requsest.getParameter("hostIp");
		int kor = (requsest.getParameter("kor")==null || requsest.getParameter("kor").equals("")) ? 0 : Integer.parseInt(requsest.getParameter("kor"));
		int eng = (requsest.getParameter("eng")==null || requsest.getParameter("eng").equals("")) ? 0 : Integer.parseInt(requsest.getParameter("eng"));
		int mat = (requsest.getParameter("mat")==null || requsest.getParameter("mat").equals("")) ? 0 : Integer.parseInt(requsest.getParameter("mat"));
		int sci = (requsest.getParameter("sci")==null || requsest.getParameter("sci").equals("")) ? 0 : Integer.parseInt(requsest.getParameter("sci"));
		int soc = (requsest.getParameter("soc")==null || requsest.getParameter("soc").equals("")) ? 0 : Integer.parseInt(requsest.getParameter("soc"));
		
		int tot = kor + eng + mat + sci + soc;
		double avg = tot / 5.0;
		String grade = "";
		
		switch ((int) (avg / 10)) {
			case 10:
			case 9: grade = "A"; break;
			case 8: grade = "B"; break;
			case 7: grade = "C"; break;
			case 6: grade = "D"; break;
			default: grade = "F";
		}
		
		T15VO vo = new T15VO(name, hakbun, kor, eng, mat, sci, soc, tot, avg, hostIp, grade);
		
		requsest.setAttribute("vo", vo);
		
		String viewPage = "/study/0806/t15_res.jsp";
		RequestDispatcher dispatcher = requsest.getRequestDispatcher(viewPage);
		
		dispatcher.forward(requsest, response);
	}
}
