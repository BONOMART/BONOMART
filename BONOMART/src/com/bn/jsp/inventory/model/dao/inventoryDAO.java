package com.bn.jsp.inventory.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.bn.jsp.inventory.model.vo.Inventory;

import static com.bn.jsp.common.JDBCTemplate.*;

public class inventoryDAO {
	private Properties prop;
	
	public inventoryDAO() {
		prop = new Properties();
		
		String filePath = inventoryDAO.class
									.getResource("/config/inventory.properties")
									.getPath();
		
			try {
				prop.load(new FileReader(filePath));
			} catch (IOException e) {
			
				e.printStackTrace();
			}
	}

	// inventory null 값일때 게시글 수 가져오기 
	public int getListCoutil(Connection con) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String 	sql = null; 

		sql = prop.getProperty("listCountil");
		
		
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

	// inventory null 값일때 리스트 가져오기 
	public ArrayList<Inventory> inventoryList(Connection con, int currentPage) {
		ArrayList<Inventory> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;
		
		String sql = prop.getProperty("inventoryList");
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				Inventory in = new Inventory();
				
				in.setP_no(rs.getString("P_NO"));
				in.setP_group(rs.getString("G_NAME"));
				in.setP_name(rs.getString("P_NAME"));
				in.setP_client(rs.getString("C_NAME"));
				in.setP_quan(rs.getInt("P_QUAN"));
				
				result.add(in);
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


	// searchInventory 총게시글수 확인
	public int getListCountSi(Connection con, String type, String content) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String 	sql = ""; 

		
		if( type.equals("p_no")) {
				sql = prop.getProperty("searchNoCount");
				
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
				
				
		} else if ( type.equals("p_group") ){
				sql = prop.getProperty("searchGroupCount");
				
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
				
			
		} else if (type.equals("p_name")) {
				sql =prop.getProperty("searchNameCount");

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
				
			
		} else if ( type.equals("p_client")) {
			sql = prop.getProperty("searchClientCount");
			
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
	 		sql = prop.getProperty("listCountil");
	 		
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

	
	// searchInventory 총게시글 리스트 가져오기
	public ArrayList<Inventory> listSi(Connection con, int currentPage, String type, String content) {
		Inventory in = null;
		ArrayList<Inventory> result = new ArrayList<>() ;
		PreparedStatement ps  = null;	
		ResultSet rs = null;
		String sql = "";
	
		// 1: 1 - 10 , 2 : 11 - 20 , 3 : 21 - 30
		int startRow = (currentPage -1) * 10  + 1;
		int endRow = currentPage * 10 ;	
		System.out.println(type);
		System.out.println(content);
		
		if( type.equals("p_no") ) {
				sql = prop.getProperty("searchNo");
	
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						in = new Inventory();
						
						in.setP_no(rs.getString("P_NO"));
						in.setP_group(rs.getString("G_NAME"));
						in.setP_name(rs.getString("P_NAME"));
						in.setP_client(rs.getString("C_NAME"));
						in.setP_quan(rs.getInt("P_QUAN"));
						
						
						result.add(in);
		
					}
						
					} catch (SQLException e) {
						
						e.printStackTrace();
					} finally {
						close(rs);
						close(ps);
					}	

		} else if ( type.equals("p_group"))  {
				sql = prop.getProperty("searchGroup");
				
				
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						in = new Inventory();
						
						in.setP_no(rs.getString("P_NO"));
						in.setP_group(rs.getString("G_NAME"));
						in.setP_name(rs.getString("P_NAME"));
						in.setP_client(rs.getString("C_NAME"));
						in.setP_quan(rs.getInt("P_QUAN"));
						
						
						result.add(in);
					}
						
					} catch (SQLException e) {
						
						e.printStackTrace();
					} finally {
						close(rs);
						close(ps);
					}	
										
	
		} else if (type.equals("p_name") ) {
				sql =prop.getProperty("searchName");
				
				
				try {
					ps= con.prepareStatement(sql);
					
					ps.setString(1, content);
					ps.setInt(2, endRow);
					ps.setInt(3, startRow);
				
					rs = ps.executeQuery();
							
					while(rs.next()) {
							
						in = new Inventory();
						
						in.setP_no(rs.getString("P_NO"));
						in.setP_group(rs.getString("G_NAME"));
						in.setP_name(rs.getString("P_NAME"));
						in.setP_client(rs.getString("C_NAME"));
						in.setP_quan(rs.getInt("P_QUAN"));
						
						
						result.add(in);
					}
						
					} catch (SQLException e) {
						
						e.printStackTrace();
					} finally {
						close(rs);
						close(ps);
					}		
				
		} else if ( type.equals("p_client")) {
			sql = prop.getProperty("searchClient");
			
			
			try {
				ps= con.prepareStatement(sql);
				
				ps.setString(1, content);
				ps.setInt(2, endRow);
				ps.setInt(3, startRow);
			
				rs = ps.executeQuery();
						
				while(rs.next()) {
						
					in = new Inventory();
					
					in.setP_no(rs.getString("P_NO"));
					in.setP_group(rs.getString("G_NAME"));
					in.setP_name(rs.getString("P_NAME"));
					in.setP_client(rs.getString("C_NAME"));
					in.setP_quan(rs.getInt("P_QUAN"));
					
					
					result.add(in);
				}
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				} finally {
					close(rs);
					close(ps);
				}		System.out.println(result);
		
		} 
									

		return result;
 }
	
	// 선택한 재고의 정보 가져오기 
	public ArrayList selectInventoryInfo(Connection con, String pno) {
		
		ArrayList list = new ArrayList();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectInevntoryInfo");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, pno);
			
			rs = ps.executeQuery();
			
			while ( rs.next() ) {
				
				list.add( rs.getString(1) );
				list.add( rs.getInt(2) );
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	// 재고 수정
	public int updateInventory(Connection con, Inventory in) {
			int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("updateInventory");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, in.getP_quan());
			ps.setString(2, in.getP_no());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(ps);
		}
		
		return result;
	}
	
	
	
}
