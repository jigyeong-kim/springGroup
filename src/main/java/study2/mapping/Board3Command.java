package study2.mapping;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Board3Command {
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		System.out.println("이곳은 Board3Command객체 입니다.");
		request.setAttribute("msg", "이곳은 Board3Command객체 입니다.");
	}
}
