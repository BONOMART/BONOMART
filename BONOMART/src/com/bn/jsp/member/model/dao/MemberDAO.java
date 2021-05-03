package com.bn.jsp.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

import com.bn.jsp.member.model.vo.Member;

import static com.bn.jsp.common.JDBCTemplate.*;

public class MemberDAO {

	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class
									.getResource("/config/member.properties")
									.getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
	}
	
	public int insertMember(Connection con, Member m) {
		
		int result = 0;
		PreparedStatement ps = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			
			ps = con.prepareStatement(sql);
			
			// DB 숫자 시작은 1부터.
			ps.setString(1, m.getUserName());
			ps.setString(2, m.getUserId());
			ps.setString(3, m.getUserPwd());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getPhone());
			ps.setString(6, m.getjCode());
			ps.setString(7, m.getdCode());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(ps);
		}
		
		return result;
	}

	public int idcheck(Connection con, String userId) {
		
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("idcheck");		// properties로 이동.
		
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
	}

	public Member selectMember(Connection con, Member loginMember) {
		
		Member result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			// 2. ps 에 준비한 쿼리 연결
			ps = con.prepareStatement(sql);
			
			// 3. sql ? 채우기
			ps.setString(1, loginMember.getUserId());
			ps.setString(2, loginMember.getUserPwd());
			
			// 4. rs (select 실행 결과) 받아오기
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = new Member();
				
				result.setUserName(   rs.getString("m_id") );
				result.setUserId(  rs.getString("m_password"));
				result.setUserPwd( rs.getString("m_Name"));
				result.setEmail(   rs.getString("m_email")        );
				result.setPhone(      rs.getString("m_phone")       );
				result.setdCode(    rs.getString("dept_code")  );
				result.setjCode(  rs.getString("job_Code"));
			}
			
			System.out.println("조회 결과 : " + result);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
		
	}

}
