package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.StationDao;
import car.dto.SidoVO;
import car.dto.StationVO;

@WebServlet("/loc")
public class LocationInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		
		System.out.println(command + " 0920");
		
		try {
			if(command.equals("sido")) {
				getCode(request,response);
			} else if(command.equals("sido0")) {
					getSidoList(request,response);
			} else if(command.equals("csNm")) {
				getCsinfo(request,response);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // end of service()
	
	
	public void getSidoList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		ArrayList<SidoVO> sdList = StationDao.getSidoList();		// 0922 // @@@
		request.getSession().setAttribute("sdList", sdList);
		request.getRequestDispatcher("Charging.jsp").forward(request, response);
	}
	
	public void getCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.getSession().getAttribute("sdList");
		System.out.println("0925");
		System.out.println(request.getSession().getAttribute("sdList")); 		// 0925 // @@@
		String code = request.getParameter("SI_DO");
		System.out.println(code + " 0920"); 		// @@@
		ArrayList<StationVO> staList = StationDao.infoStation(Integer.parseInt(code));
		request.setAttribute("staList", staList);
		request.getRequestDispatcher("searchView.jsp").forward(request, response);
	}
	
	public void getCsinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("euc-kr");
		String keyName = request.getParameter("search").trim();
		System.out.println(keyName);
		StationVO st = StationDao.staDetail(keyName);
		System.out.println(st.getCsnm());
		request.setAttribute("st", st);
		request.getRequestDispatcher("detailView.jsp").forward(request, response);
	}
}
