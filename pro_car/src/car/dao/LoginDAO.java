package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import car.dto.MemberVO;
import car.util.DBUtil;

public class LoginDAO {

	private static LoginDAO instance;

	private LoginDAO() {
	}

	public static LoginDAO getInstance() {
		if (instance == null) {
			instance = new LoginDAO();
		}
		return instance;
	}

	private static String sql;
	
public static String loginCheck(String id, String pwd){
		System.out.println("로그인 검증");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = "select pwd from member where id = ?";
		String msg = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			msg = "아이디가 올바르지 않습니다.";//-1
			String idDB = null;
			String passwordDB = null;
			if(rs.next()){
				passwordDB = rs.getString("pwd");
				if(!pwd.equals(passwordDB)){
					msg = "비밀번호가 올바르지 않습니다.";//0
				}else {
					msg = "로그인 성공";//1
				}
				
			} else {
				msg = "아이디가 존재하지 않습니다.";//-1
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rs);
			
		}

		return msg;
		
	}

	
//	public static int loginCheck(String id, String pwd) {
//		System.out.println("로그인 검증");
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String dbPW = "";
//		int x = -1;
//		sql = "select pwd from member where id=?";
//		System.out.println(pwd);
//		try {
//			con = DBUtil.getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				dbPW = rs.getString("pwd");
//				
//				if (dbPW.equals(pwd)) {
//					x = 1;
//				} else {
//					x = 0;
//				}
//			} else {
//				x = -1;
//			}
//			
//		} catch (Exception e) {
//			
//		} finally {
//			DBUtil.close(con, pstmt, rs);
//		}
//		return x;
//		
//	}

	public MemberVO getUserInfo(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;

		sql = "select * from member where id=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("mail"));
				member.setAddr(rs.getString("addr"));
				member.setPhone(rs.getString("phone"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rs);
		}
		return member;

	}
}