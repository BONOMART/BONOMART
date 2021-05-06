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
	
	// 회원 가입
	public int insertMember(Connection con, Member m) {
		
		int result = 0;
		PreparedStatement ps = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			
			ps = con.prepareStatement(sql);
			
			// DB 숫자 시작은 1부터
			ps.setString(1, m.getUserName());
			ps.setString(2, m.getUserId());
			ps.setString(3, m.getUserPwd());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getPhone());
			ps.setString(6, m.getdCode());
			ps.setString(7, m.getjCode());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(ps);
		}
		
		return result;
	}

	// 아이디 중복 확인
	public int idcheck(Connection con, String userId) {
		
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("idcheck");		// properties濡� �씠�룞.
		
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
	}
	

	// 회원 정보 조회
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
				result.setUserNo(rs.getInt("m_no"));
				result.setUserName(   rs.getString("m_name") );
				result.setUserId(  rs.getString("m_id"));
				result.setUserPwd( rs.getString("m_password"));
				result.setEmail(   rs.getString("m_email")        );
				result.setPhone(      rs.getString("m_phone")       );
				result.setdCode(    rs.getString("dept_code")  );
				result.setjCode(  rs.getString("job_Code"));
				result.setAuthority(rs.getString("m_access"));
			}
			
			System.out.println("議고쉶 寃곌낵 : " + result);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
		
	}

	// 회원 비밀번호 변경
	public int updateMemberPwd(Connection con, Member m) {
		int result = 0;
		
		PreparedStatement ps = null;
		String sql = prop.getProperty("updateMemberPwd");
		
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, m.getUserPwd() );
			ps.setString(2, m.getUserId() );
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(ps);
		}
		
		return result;
	}
	
	// 회원 선택 정보 변경
		public int updateMemberExtra(Connection con, Member m) {
			int result = 0;
			
			PreparedStatement ps = null;
			String sql = prop.getProperty("updateMemberExtra");
			
			try {
				
				ps = con.prepareStatement(sql);
				
				ps.setString(1, m.getEmail() );
				ps.setString(2, m.getPhone() );
				ps.setString(3, m.getdCode() );
				ps.setString(4, m.getjCode() );
				ps.setString(5,  m.getUserId());
				
				result = ps.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(ps);
			}
			
			return result;
		}

		public int pwdcheck(Connection con, String userPwd) {
			
			int result = 0;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String sql = prop.getProperty("pwdcheck");		// properties濡� �씠�룞.
			
			try {
				
				ps = con.prepareStatement(sql);
				
				ps.setString(1, userPwd);
				
				rs = ps.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt(1);
					System.out.println(rs.getInt(1));
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				close(rs);
				close(ps);
			}
			return result;
		}
		
		// 회원 탈퇴
		public int deleteMember(Connection con, String userId) {
			int result = 0;
			PreparedStatement ps = null;
			
			String sql = prop.getProperty("deleteMember");
			
			try {
				
				ps = con.prepareStatement(sql);
				
				ps.setString(1, userId);
				
				result = ps.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				
				close(ps);
				
			}
			
			return result;
		}
		
}