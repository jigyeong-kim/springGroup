package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardGoodCheckPlueMinusCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int goodCnt = (request.getParameter("goodCnt")==null || request.getParameter("goodCnt").equals("")) ? 0 : Integer.parseInt(request.getParameter("goodCnt"));
		BoardDAO dao = new BoardDAO();

		//좋아요 조회수 1씩 증가시키기
		int res = dao.setBoardGoodCheckPlusMinus(idx, goodCnt);
		
		response.getWriter().write(res + "");
	}

}
