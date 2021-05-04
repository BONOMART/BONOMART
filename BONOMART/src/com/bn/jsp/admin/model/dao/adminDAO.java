package com.bn.jsp.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import com.bn.jsp.admin.model.vo.Member;

import static com.bn.jsp.common.JDBCTemplate.*;



public class adminDAO {
	private Properties prop;

	public adminDAO() {
		prop = new Properties();
		
		String filePath = adminDAO.class
									.getResource("/config/admin.properties")
									.getPath();
		
			try {
				prop.load(new FileReader(filePath));
			} catch (IOException e) {
			
				e.printStackTrace();
			}
	}
	
	
	public List<Member> searchMember(Connection con, String type, String content, int currentPage) {
		
		Member me = null;
		List<Member> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		String sql = null;
	
			
		if( type.equals("userId")) {
				sql = prop.getProperty("searchId");
				
				
		} else if ( type.equals("userName")) {
				sql = prop.getProperty("searchName");
				
			
		} else if (type.equals("userNo" )) {
				sql =prop.getProperty("searchNo");
				
			
		} else if ( type.equals("dept")) {
			sql = prop.getProperty("searchDept");
		
		} else if ( type.equals("job")) {
			sql = prop.getProperty("searchJob");
			
	 	} 
		
		try {
			ps= con.prepareStatement(sql);
			
			ps.setString(1, content);
		
			rs = ps.executeQuery();
					
			while(rs.next()) {
					
				me = new Member();
				
				me.setUserNo( rs.getInt("M_NO"));
				me.setUserName(rs.getString("M_NAME"));
				me.setUserId( rs.getString("M_ID"));
				me.setUserPwd( rs.getString("M_PASSWORD"));
				me.setEmail(rs.getString("M_EMAIL"));
				me.setPhone(rs.getString("M_PHONE"));
				me.setDept(rs.getString("DEPT_TITLE"));
				me.setJob(rs.getString("JOB_TITLE"));
				me.setAccess(rs.getString("M_ACCESS"));
				me.setJoinacc(rs.getString("M_JOINACC"));
				
				result.add(me);
			}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
								
		
		return result;
	}


	public ArrayList<Member> searchOKMember(Connection con, int currentPage) {

		ArrayList<Member> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;
		
		String sql = prop.getProperty("searchOKMe");
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				Member me = new Member();
				
				me.setUserNo( rs.getInt("M_NO"));
				me.setUserName(rs.getString("M_NAME"));
				me.setUserId( rs.getString("M_ID"));
				me.setUserPwd( rs.getString("M_PASSWORD"));
				me.setEmail(rs.getString("M_EMAIL"));
				me.setPhone(rs.getString("M_PHONE"));
				me.setDept(rs.getString("DEPT_TITLE"));
				me.setJob(rs.getString("JOB_TITLE"));
				me.setAccess(rs.getString("M_ACCESS"));
				me.setJoinacc(rs.getString("M_JOINACC"));
				
				result.add(me);
			}
			
			System.out.println(result);
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
	}


	public int MemberOk(Connection con, String accOk, int mno) {
		
		int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("memberOk");
		
		try {
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, mno);
			
			result =ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(ps);
		}

		return result;
	}

	public int MemberNo(Connection con, String accOk, int mno) {
		
		int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("memberNo");
		
		try {
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, mno);
			
			result =ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(ps);
		}

		return result;
	}


	public int getListCount(Connection con) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String 	sql = null; 

		sql = prop.getProperty("listCount");
		
		
		try {
			ps = con.prepareStatement(sql);

			
			rs = ps.executeQuery();
			
			if( rs.next() ) {
				result =rs.getInt(1);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return result;
	}

	public int getListCount2(Connection con, String type, String content) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String 	sql = null; 

		
		if( type.equals("userId")) {
				sql = prop.getProperty("searchIdCount");
				
				
		} else if ( type.equals("userName")) {
				sql = prop.getProperty("searchNameCount");
				
			
		} else if (type.equals("userNo" )) {
				sql =prop.getProperty("searchNoCount");
				
			
		} else if ( type.equals("dept")) {
			sql = prop.getProperty("searchDeptCount");
		
		} else if ( type.equals("job")) {
			sql = prop.getProperty("searchJobCount");
			
	 	} 
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, content);
			
			rs = ps.executeQuery();
			
			if( rs.next() ) {
				result =rs.getInt(1);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return result;
	}




//	public int searchLoginMember(Connection con, int currentPage) {
//		PreparedStatement ps  = null;	
//		ResultSet rs = null;
//		
//		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
//		int startRow = (currentPage -1) * 10  + 1;
//		int endRow = currentPage * 10 ;
//		
//		String sql = prop.getProperty("searchOKMe");
//		
//		try {
//			ps=con.prepareStatement(sql);
//			ps.setInt(1, endRow);
//			ps.setInt(2, startRow);
//		return 0;
//	}
//	}
}
