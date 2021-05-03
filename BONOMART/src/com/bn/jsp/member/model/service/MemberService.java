package com.bn.jsp.member.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bn.jsp.common.JDBCTemplate;
import com.bn.jsp.member.model.dao.MemberDAO;
import com.bn.jsp.member.model.vo.Member;

import static com.bn.jsp.common.JDBCTemplate.*;
import static com.bn.jsp.common.JDBCTemplate.getConnection;

public class MemberService {
		private Connection con;
		private MemberDAO dao = new MemberDAO();
		
		public int insertMember(Member m) {
			con = getConnection();
			
			int result = dao.insertMember(con, m);
		
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return result;
		}

		// 중복 확인
		public int idcheck(String userId) {
			con = getConnection();
			
			int result = dao.idcheck(con, userId);
			
			close(con);
			
			return result;
		}

		public Member selectMember(Member loginMember) {
			
			// DB연결을 위해 getConnection 사용
			con = getConnection();	
			
			// DB와 직접적 연결을 수행하는 객체인 dao에게
			// con 정보와 함께 loginMember에 해당하는 사용자를
			// DB에서 찾음.
			
			Member result = dao.selectMember(con, loginMember);
			
			// 데이터를 수정하지 않고 조회만 하므로
			// commit이나 rollback 할 필요가 없으므로
			// close를 수행.
			close(con);
			
			return result;
		}
}
