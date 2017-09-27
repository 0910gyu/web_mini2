package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import car.dto.MemberVO;
import car.util.DBUtil;

public class JoinDao {
	private static String sql;
	private static DataSource source = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			System.out.println(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void memberJoin(MemberVO mem) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		sql = "insert into member values (?,?,?,?,?,?)";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPassword());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getEmail());
			pstmt.setString(5, mem.getAddr());
			pstmt.setString(6, mem.getPhone());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(con, pstmt);
		}
		
	}
}
