package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import car.dto.SidoVO;
import car.dto.Station2VO;
import car.dto.StationVO;
import car.util.DBUtil;

public class StationDao {
	public static String sql;

	// 시도 리스트 조회
	public static ArrayList<SidoVO> getSidoList() throws SQLException{
		SidoVO sd = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SidoVO> sList = new ArrayList<>();

		sql = "SELECT SIDO_ID, SIDO_NM FROM SIDO ";
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int sidoId = rs.getInt("SIDO_ID");
				String sidoNm = rs.getString("SIDO_NM");
				sList.add(new SidoVO(sidoId, sidoNm));
			}
		} finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return sList;
	}
	//충전소 정보 리스트에 담기
	public static ArrayList<StationVO> infoStation(int code) throws SQLException{
		StationVO st = null;
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StationVO> sList = new ArrayList<>();

		sql = "select * from station where code=?";
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int idNum = rs.getInt(1);
				String csNm = rs.getString(2);
				String addr = rs.getString(3);
				String dpNm = rs.getString(4);
				String lat = rs.getString(5);
				String longI = rs.getString(6);
				sList.add(new StationVO(idNum, csNm, addr, dpNm, lat, longI));
			}
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return sList;
	}
	
	public static ArrayList<Station2VO> infoStation2(int code) throws SQLException{
		Station2VO st = null;
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Station2VO> sList = new ArrayList<>();
		
		sql = " SELECT S.ID ID, CSNM, ADDR, LAT, LONGI, CODE, C.CNT CNT "
				+ " FROM STATION2 S "
				+ " INNER JOIN (SELECT ID, COUNT(*) AS CNT FROM CHARGER GROUP BY ID) C ON S.ID = C.ID "
				+ " WHERE CODE = ? ";
		System.out.println(sql); 		// @@@
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int idNum = rs.getInt("ID");
				String csNm = rs.getString("CSNM");
				String addr = rs.getString("ADDR");
				String lat = rs.getString("LAT");
				String longI = rs.getString("LONGI");
				int cnt = rs.getInt("CNT");
				st = new Station2VO(idNum, csNm, addr, lat, longI, code, cnt);
				sList.add(st);
//				sList.add(new Station2VO(idNum, csNm, addr, lat, longI, code, cnt));
			}
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return sList;
	}
	
	// 입력한 충전소 리스트에 담기
	public static StationVO staDetail(String keyName) throws SQLException{
		StationVO st = null;
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = "select * from station where csnm=?";
		
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, keyName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			int id = rs.getInt(1);
			String csnm = rs.getString(2);
			String addr = rs.getString(3);
			String cpnm = rs.getString(4);
			String lat = rs.getString(5);
			String longi = rs.getString(6);
			st = new StationVO(id,csnm,addr,cpnm,lat,longi);
			}
			System.out.println(st.toString());
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return st;
	}
}
