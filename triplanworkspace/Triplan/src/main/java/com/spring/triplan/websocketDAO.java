package com.spring.triplan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.AreaDetailVO;
import com.spring.model.AreaVO;
import com.spring.model.ChatVO;
import com.spring.model.MemberVO;
import com.spring.model.ScheduleVO;
import com.spring.model.TourInfoCommVO;
import com.spring.model.TourInfoTypeVO;
import com.spring.model.TourInfoVO;


public class websocketDAO {

	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	
	public String sT = "";
	public String sS = "";
	
	public void close() {
		try {
			if(rs != null) 
				rs.close();

			if(pstmt != null)
				pstmt.close();
			
			if(conn != null)
				conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// close
	
	public HashMap<String,String> getScheduleMember(String sc_idx) throws SQLException
	{
		
		try {
			
			conn = DBConnection.getConn();
			
			String sql = "select userid from tbl_join where sc_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sc_idx);
			
			rs = pstmt.executeQuery();
			
			HashMap<String, String> useridMap = new HashMap<String, String>();
			
			while(rs.next())
			{
				String userid = rs.getString("userid");
				useridMap.put(userid, userid);
			}

			return useridMap;
			
		}finally {
			close();
		}
	}

}
