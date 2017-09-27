package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.JoinDao;
import car.dao.LoginDAO;
import car.dao.UpdateDao;
import car.dto.MemberVO;

@WebServlet("/logSc")
public class LoginSearch extends HttpServlet {
	
	public LoginSearch() {
        super();      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");

		if (command.equals("login")) {
			login(request, response);
			System.out.println("로그인");
		} else if (command.equals("join")) {
			insertMember(request, response);
			System.out.println("가입성공");
		} else if (command.equals("update")) {
			update(request, response);
			System.out.println("수정");
		} else if (command.equals("info")) {
			System.out.println("개인정보");
			info(request, response);
		}
	}
	// 회원정보 조회
	private void info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);

		MemberVO infomem = new MemberVO();
		infomem.setId(id);
		String url = null;

		LoginDAO.getInstance();
		request.setAttribute("id", id);

		url = "info.jsp";

		request.getRequestDispatcher(url).forward(request, response);
		System.out.println("개인정보");

	}
	
		// 로그인
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		System.out.println(id);
		String pwd = request.getParameter("pwd");
		System.out.println(pwd);
		MemberVO loginMember = new MemberVO();
		loginMember.setId(id);
		loginMember.setPassword(pwd);
		String url = null;
		String result = LoginDAO.loginCheck(id, pwd);
		if(result.equals("로그인 성공")) {//result==1
		try {
			LoginDAO.getInstance();
			request.setAttribute("loginMember", loginMember);
			url = "loginView.jsp";
		} catch (Exception e) {
			request.setAttribute("error", "입력 실패");
			url = "error.jsp";
			e.printStackTrace();
		}

		request.setAttribute("id", id);
		request.setAttribute("pwd", pwd);
		
//		url = "loginView.jsp";

		request.getRequestDispatcher(url).forward(request, response);
		
		System.out.println(loginMember.toString());
		} else {
			System.out.println("로그인 실패");
			url = "error.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	// 회원가입
	public void insertMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String name = request.getParameter("name").trim();
		String mail = request.getParameter("mail").trim();
		String addr = request.getParameter("addr").trim();
		String phone = request.getParameter("phone").trim();
		MemberVO mem = new MemberVO(id, pwd, name, mail, addr, phone);
		String url = null;
		try {
			JoinDao.memberJoin(mem);
			request.setAttribute("mem", mem);
			url = "addSuccess.jsp";
		} catch (Exception e) {
			request.setAttribute("error", "아이디 중복");
			url = "error.jsp";
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	// 회원정보 수정
	private void update(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String name = request.getParameter("name").trim();
		String mail = request.getParameter("mail").trim();
		String addr = request.getParameter("addr").trim();
		String phone = request.getParameter("phone").trim();
		MemberVO mem = new MemberVO(id, pwd, name, mail, addr, phone);
		String url = null;
		
		try {
			UpdateDao.update(mem);
			request.setAttribute("mem", mem);
			url = "loginView.jsp";
		} catch (SQLException e) {
			request.setAttribute("error", "에러");
			url = "error.jsp";
			e.printStackTrace();
		}
		request.setAttribute("id", id);

		request.getRequestDispatcher(url).forward(request, response);
		
	}
}
