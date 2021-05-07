package com.bn.jsp.order.model.dao;

import static com.bn.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bn.jsp.order.model.vo.Order;
import com.bn.jsp.order.model.vo.OrderList;
import com.bn.jsp.order.model.vo.OrderSearch;
import com.bn.jsp.sale.model.dao.SaleDAO;

//발주 테이블에 실제로 값을 전달하는 클래스
public class OrderDAO {

	private Properties prop;
	private final int MAX_ROWS = 11;
	
	public int startNum(int currentNum) {
		return currentNum - 1 * MAX_ROWS + 1;
	}
	
	public int endNum(int currentNum) {
		return currentNum * MAX_ROWS;
	}

	public OrderDAO() {
		prop = new Properties();

		// DB에 날릴 쿼리가 있는 파일 주소
		String filePath = SaleDAO.class.getResource("/config/order.properties").getPath();

		try {
			prop.load(new FileReader(filePath));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertOrder(Connection con, Order order) {

		int result = 0;
		PreparedStatement ps = null;

		String sql = prop.getProperty("insertOrder");

		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, order.getO_quan());
			ps.setDate(2, order.getO_date());
			ps.setString(3, order.getP_no());
			ps.setInt(4, order.getM_no());

			result = ps.executeUpdate();

			System.out.println(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}

		return result;
	}

	public ArrayList<OrderSearch> selectList(Connection con) {

		ArrayList<OrderSearch> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectList");

		try {
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {

				OrderSearch os = new OrderSearch();

				os.setO_no(rs.getInt("o_no"));
				os.setP_no(rs.getString("p_no"));
				os.setC_no(rs.getString("c_no"));
				os.setO_quan(rs.getString("o_quan"));
				os.setO_date(rs.getDate("o_date"));
				os.setA_price(rs.getInt("a_price"));
				os.setC_name(rs.getString("c_name"));

				list.add(os);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}

		return list;
	}

	public int getMemberNoFindByName(Connection con, String memberName) {
		int memberNo = -1;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = prop.getProperty("getMemberNoFindByName");

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, memberName);

			rs = ps.executeQuery();
			System.out.println("dao getNo : " + sql);
			System.out.println("dao rs : " + rs);
			if (rs.next()) {
				System.out.println("rs in");
				memberNo = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return memberNo;
	}

	public int getListCount(Connection con, String searchKey, String searchValue) {

		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = prop.getProperty("getListCount");
		sql += " WHERE " + searchKey + "=?";

		try {
			System.out.println("query : " + sql);
			ps = con.prepareStatement(sql);
			switch(searchKey) {
			case "o_no":
			case "m_no":
				ps.setInt(1, Integer.parseInt(searchValue));
				break;
			default:
				ps.setString(1, searchValue);
			}
//			ps.setString(1, searchValue);

			
			rs = ps.executeQuery();

			if (rs.next()) {
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
	
	public int getListCount(Connection con) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = prop.getProperty("getListCount");

		try {
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			if (rs.next()) {
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

	public ArrayList<OrderList> searchList(Connection con) {
		
		ArrayList<OrderList> list = new ArrayList<>();
		
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("searchList");

		try {
			ps = con.prepareStatement(sql);
			
//			ps.setInt(1, start);
//			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderList ol = new OrderList();
				
				ol.setO_no(rs.getInt("o_no"));
				ol.setP_no(rs.getString("p_no"));
				ol.setC_name(rs.getString("c_name"));
				ol.setO_quan(rs.getString("o_quan"));
				ol.setO_date(rs.getDate("o_date"));
				ol.setA_price(rs.getInt("a_price"));
				ol.setM_name(rs.getString("m_name"));
				
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}
	
	public ArrayList<OrderList> searchList(Connection con, String searchKey, String searchValue) {
		
		ArrayList<OrderList> list = new ArrayList<>();
		
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		if(searchKey.equals("p_no")) searchKey = "o." + searchKey;
		String headSql = prop.getProperty("searchListConditionKey");
		String conditionSql = " WHERE " + searchKey + "=?";
		String tailSql = prop.getProperty("searchListConditionValue");
		String sql = headSql + conditionSql + tailSql;
		
//		int start = startNum(currentPage);
//		int end = endNum(currentPage);

		try {
			ps = con.prepareStatement(sql);
			switch(searchKey) {
			case "o_no":
			case "m_no":
				ps.setInt(1, Integer.parseInt(searchValue));
				break;
			default:
				ps.setString(1, searchValue);
			}
			
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderList ol = new OrderList();
				
				ol.setO_no(rs.getInt("o_no"));
				ol.setP_no(rs.getString("p_no"));
				ol.setC_name(rs.getString("c_name"));
				ol.setO_quan(rs.getString("o_quan"));
				ol.setO_date(rs.getDate("o_date"));
				ol.setA_price(rs.getInt("a_price"));
				ol.setM_name(rs.getString("m_name"));
				
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public int deletesearchlist(Connection con, int o_no) {

		int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("deletesearchlist");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, o_no);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return result;
	}

	public ArrayList selectOrderInfo(Connection con, String pno) {
		
		ArrayList list = new ArrayList();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectOrderInfo");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, pno);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getInt(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public int updateOrder(Connection con, Order o) {
		
		int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("updateOrder");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1,  o.getO_quan());
			ps.setInt(2,  o.getO_no());
			
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return result;
	}

}
