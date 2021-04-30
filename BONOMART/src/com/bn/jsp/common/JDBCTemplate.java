package com.bn.jsp.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//  getConnection( 오라클서버url, 사용자계정, 비밀번호 );
			con = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", 
							"BONOMART", "BONOMART");
			
			con.setAutoCommit(false); 
			// 에러 여부와 관계없이 자동 커밋하는 것을 방지
			
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		
		return con;
		
		
	}
	
	// 오버로딩 적용하기
		public static void close(Statement stmt) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void close(ResultSet rset) {
			try {
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void close(Connection con) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void commit(Connection con) {
			// 변경사항 저장 메소드
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void rollback(Connection con) {
			// 변경사항 취소 메소드
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
