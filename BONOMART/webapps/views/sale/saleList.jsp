<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.bn.jsp.sale.model.vo.*, java.util.*" %>

<%
	ArrayList<SaleJoin> list = (ArrayList<SaleJoin>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int st = pi.getStartPage();
	int ed = pi.getEndPage();
	int mx = pi.getMaxPage();
	int limit = pi.getLimit();
	int listCount = pi.getListCount();
	int cur = pi.getCurrentPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="/bono/assets/css/saleList.css" />
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<style>
	svg:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<div class="innder">
		<div class="wrapper">
			
			<div class="container sub-contents">
				<h3>판매조회</h3>
				
				<!-- 판매 검색 -->
				<div class="input-group" id="search_sale">
				  <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
				  <div class="input-group-append">
				  	<button type="button" class="btn btn-primary">검색하기</button>
				    <button type="button" class="btn btn-outline-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				      <span class="sr-only">Toggle Dropdown</span>
				    </button>
					    <div class="dropdown-menu">
					      	<a class="dropdown-item" href="#">판매일자 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
					    	<a class="dropdown-item" href="#">상품코드 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
					    	<a class="dropdown-item" href="#">상품명 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
				      		<a class="dropdown-item" href="#">판매수량 정렬</a>
				      		<div role="separator" class="dropdown-divider"></div>
				      		<a class="dropdown-item" href="#">총 판매금액 정렬</a>
				      		<div role="separator" class="dropdown-divider"></div>
						</div>
					</div>
				</div>
				
				<div class="sale_search_list">
					<table class="table table-hover">
					
						<thead>
							<tr>
								<th>판매번호</th>
								<th>판매일자</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>판매수량</th>
								<th>총 판매금액</th>
							</tr>
						</thead>
						
						<tbody>
							
							<% for ( SaleJoin s : list ) {  %>
								<tr>
									<td><%= s.getS_no() %></td>
									<td><%= s.getS_date() %></td>
									<td><%= s.getP_no() %></td>
									<td><%= s.getP_name() %></td>
									<td><%= s.getS_quan() %></td>
									<td><%= s.getS_total() %></td>
									<td>
										<svg class="updateTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  											<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
										</svg>
										<svg class="deleteTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  											<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  											<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
										</svg>
									</td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="pagingArea" align="center">
			
				<%-- 맨 첫 페이지로  --%>
				<button onclick="location.href='/bono/selectList.sa?currentPage=1'">
					&lt;&lt; <!-- << -->
				</button>
			
				<%-- 한 칸 앞페이지로 --%>
				<% if ( cur <= 1 ) { %>
					<button disabled> &lt; </button>
				<% } else { %>
					<button onclick="location.href='/bono/selectList.sa?currentPage=<%= cur - 1 %>'"> &lt; </button>
				<% } %>
			
				<%-- 페이지 버튼 --%>
				<% for ( int p = st ; p <= ed ; p++ ) { %>
			
					<% if ( p == cur ) { %>
						<button disabled> <%= p %> </button>  <%-- 현재 페이지라면 무효화 --%>
					<% } else { %>
						<button onclick="location.href='/bono/selectList.sa?currentPage=<%= p %>'"><%= p %></button>
					<% } %>
				
				<% } %>
			
				<%-- 한 칸 뒷페이지로 --%>
				<% if ( cur >= mx ) { %>
					<button disabled> &gt; </button>
				<% } else { %>
					<button onclick="location.href='/bono/selectList.sa?currentPage=<%= cur + 1 %>'"> &gt; </button>
				<% } %>
			
				<%-- 맨 마지막 페이지로 --%>
				<button onclick="location.href='/bono/selectList.sa?currentPage=<%= mx %>'">
					&gt;&gt; <!-- >> -->
				</button>
			
		</div>
			
		</div>
	</div>
	
	<script>
		
	</script>
	
	<%@include file="../common/footer.jsp" %>
</body>
</html>