package kr.co.kic.dev1.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kic.dev1.dao.MemberDao;
import kr.co.kic.dev1.dto.MemberDto;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/member/join")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.sendRedirect("/member/join.html");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8"); // request객체를 사용하기 전에 코딩해야한다. 2바이트 파일을 utf-8로 변환한다.
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		//MemberDto m = new MemberDto(id, email, password);
		MemberDto m = new MemberDto();
		MemberDao dao = MemberDao.getInstance();
		if(dao.insert(m)) {
			response.sendRedirect("/member/join/success");			
		} else {
			response.sendRedirect("/member/join.html");			
		}
	}
}
