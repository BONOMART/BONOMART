package com.bn.jsp.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.bn.jsp.admin.model.vo.Member2;

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
	
	// joinRequest 총게시글수 확인
	public int getListCountJR(Connection con) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String 	sql = null; 

		sql = prop.getProperty("listCountJR");
		
		
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
	
	//joinRequest 리스트 가져오기
	public ArrayList<Member2> listJR(Connection con, int currentPage) {

		ArrayList<Member2> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;
		
		String sql = prop.getProperty("listJR");
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				Member2 me = new Member2();
				
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
	
	// 회원 승인요청 승인과 거절
	public int MemberOk(Connection con, String accOk, int mno) {
		
		int result = 0;
		PreparedStatement ps = null;
	
		if( accOk.equals("Y")) {
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
		} else if ( accOk.equals("N")){
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
		}

		return result;
	}

	// searhMemberList 총게시글수 확인
	public int getListCountSM(Connection con, String type, String content) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String 	sql = ""; 

		
		if( type.equals("userId")) {
				sql = prop.getProperty("searchIdCount");
				
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
				
				
		} else if ( type.equals("userName") ){
				sql = prop.getProperty("searchNameCount");
				
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
				
			
		} else if (type.equals("userNo")) {
				sql =prop.getProperty("searchNoCount");

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
				
			
		} else if ( type.equals("dept")) {
			sql = prop.getProperty("searchDeptCount");
			
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
		
		} else if ( type.equals("job") ) {
			sql = prop.getProperty("searchJobCount");
			
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
			
	 	} else {
	 		sql = prop.getProperty("listCountSM");
	 		
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
	 	}
	
		return result; 
		}

	
	//searchMemberList 리스트 가져오기
	public ArrayList<Member2> listSM(Connection con, int currentPage, String type, String content) {
		Member2 me = null;
		ArrayList<Member2> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		String sql = "";
	
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;	
		System.out.println(type);
		System.out.println(content);
		
		if( type.equals("userId") ) {
				sql = prop.getProperty("searchId");
	
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						me = new Member2();
						
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

		} else if ( type.equals("userName"))  {
				sql = prop.getProperty("searchName");
				
				
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						me = new Member2();
						
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
										
	
		} else if (type.equals("userNo") ) {
				sql =prop.getProperty("searchNo");
				
				
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						me = new Member2();
						
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
				
		} else if ( type.equals("dept")) {
			sql = prop.getProperty("searchDept");
			
			
			try {
				ps= con.prepareStatement(sql);
				
				ps.setString(1, content);
				ps.setInt(2, endRow);
				ps.setInt(3, startRow);
			
				rs = ps.executeQuery();
						
				while(rs.next()) {
						
					me = new Member2();
					
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
				}		System.out.println(result);
		
		} else if ( type.equals("job")) {
			sql = prop.getProperty("searchJob");
			
			
			try {
				ps= con.prepareStatement(sql);
				
				ps.setString(1, content);
				ps.setInt(2, endRow);
				ps.setInt(3, startRow);
			
				rs = ps.executeQuery();
						
				while(rs.next()) {
						
					me = new Member2();
					
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
									
			
	 	}		
		
		return result;
	}
	
	// searchMemberList null값일때 리스트 수가져오기
	public int getListCountad(Connection con) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String 	sql = null; 

		sql = prop.getProperty("listCountad");
		
		
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

	
	// searchMemberList null값일때 리스트가져오기
	public ArrayList<Member2> searchOKMemberad(Connection con, int currentPage) {

		ArrayList<Member2> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;
		
		String sql = prop.getProperty("searchOKMe2");
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				Member2 me = new Member2();
				
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

	// 탈퇴버튼 클릭
	public int MemberOut(Connection con, int mno) {
		int result = 0;
		PreparedStatement ps = null;

		String sql = prop.getProperty("memberOut");
		
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

		
	


	
	
	
	
	
	
	
	
	
	
	
//	
//	public List<Member> searchMember(Connection con, String type, String content, int currentPage) {
//		
//		Member me = null;
//		List<Member> result = new ArrayList<>() ;
//		PreparedStatement ps  = null;	
//		ResultSet rs = null;
//		String sql = null;
//	
//		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
//		int startRow = (currentPage -1) * 10  + 1;
//		int endRow = currentPage * 10 ;	
//		
//		if( type.equals("userId")) {
//				sql = prop.getProperty("searchId");
//				
//				
//		} else if ( type.equals("userName")) {
//				sql = prop.getProperty("searchName");
//				
//			
//		} else if (type.equals("userNo" )) {
//				sql =prop.getProperty("searchNo");
//				
//			
//		} else if ( type.equals("dept")) {
//			sql = prop.getProperty("searchDept");
//		
//		} else if ( type.equals("job")) {
//			sql = prop.getProperty("searchJob");
//			
//	 	} 
//		
//		try {
//			ps= con.prepareStatement(sql);
//			
//			ps.setString(1, content);
//			ps.setInt(2, endRow);
//			ps.setInt(3, startRow);
//		
//			rs = ps.executeQuery();
//					
//			while(rs.next()) {
//					
//				me = new Member();
//				
//				me.setUserNo( rs.getInt("M_NO"));
//				me.setUserName(rs.getString("M_NAME"));
//				me.setUserId( rs.getString("M_ID"));
//				me.setUserPwd( rs.getString("M_PASSWORD"));
//				me.setEmail(rs.getString("M_EMAIL"));
//				me.setPhone(rs.getString("M_PHONE"));
//				me.setDept(rs.getString("DEPT_TITLE"));
//				me.setJob(rs.getString("JOB_TITLE"));
//				me.setAccess(rs.getString("M_ACCESS"));
//				me.setJoinacc(rs.getString("M_JOINACC"));
//				
//				result.add(me);
//			}
//				
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			} finally {
//				close(rs);
//				close(ps);
//			}
//								
//		
//		return result;
//	}



	
	
	
	
	
	


	


	

	

	
	}


