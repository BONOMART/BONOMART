<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.bn.jsp.sale.model.vo.*, java.util.*" %>

<%
	ArrayList<SaleJoin> list = (ArrayList<SaleJoin>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	String searchD = (String) request.getAttribute("searchData");
	String searchS = (String) request.getAttribute("searchSort");
	

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
<title>판매 조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="/bono/assets/css/saleList.css" />
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<style>
	svg:hover {
		cursor: pointer;
	}
	
	.btn-outline-secondary {
        background : #4e73df;
        color : white;
    }
	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<div class="innder">
		<div class="wrapper">
			
			<div class="container sub-contents">
				<!-- header 영역과 게시판 영역 사이 공간 -->
                <div style="padding-bottom: 50px;"></div>

                <h3 style="text-align: center;">판매 조회</h3>
                
                <!-- 조회 페이지의 서치 바 (검색 내용과 소트내용을 전송할 폼태그) -->
                <form action="/bono/search.sa" id="searchForm">
                <div class="input-group mb-3" style="margin-left : auto;
	                 margin-right : auto; margin-bottom: 50px; width: 600px; background : white;">
	                 <input type="text" class="form-control" placeholder="검색할 데이터를 입력하세요.." aria-label="Recipient's username" aria-describedby="button-addon2"
	                 style="width: 300px" id="searchData" name="searchData" value="${param.searchData}">
	                    
	                 <!-- 검색 조건 select bar -->
					<select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon" style="width:40px" name="searchSort">
						<option selected>검색조건</option>
						<option ${(param.searchSort == "p_no")? "selected" : "" } value="p_no">상품코드</option>
						<option ${(param.searchSort == "p_name")? "selected" : "" } value="p_name">상품명</option>
					</select>
					
					<!-- 검색 버튼 -->	
					<div class="input-group-append">
						<button id="searchBtn" class="btn btn-outline-secondary" type="button" onclick="searchSort();">검색</button>
					</div>
							     
	            </div>
                </form>
	            
				<!-- DB의 판매정보를 전부 보여줄 게시판 -->
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
								<th>수정/삭제</th>
							</tr>
						</thead>
						
						<tbody>
							
							<% for ( SaleJoin s : list ) {  %>
								<tr>
									<td id="s_no"><%= s.getS_no() %></td>
									<td><%= s.getS_date() %></td>
									<td id="p_no"><%= s.getP_no() %></td>
									<td><%= s.getP_name() %></td>
									<td id="s_quan"><%= s.getS_quan() %></td>
									<td id="s_total"><%= s.getS_total() %></td>
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
			
			
			<!-- 페이지 list 구현 영역 -->	
			<div class="pagingArea" align="center">
			
			<!-- 검색창과 소트창이 null이라면 (아무것도 검색하지 않았다면) 기본 리스트 -->
			<% if (searchD == null || searchS == null) { %>
			
			<nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="/bono/selectList.sa?currentPage=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/selectList.sa?currentPage=<%= cur-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } %>
                        </li>
                        <% for ( int p = st ; p <= ed ; p++ )  { %>
                        	<% if ( p == cur ) { %>
                        		<li class="page-item">
                        		<a class="page-link" href="#"><%=p %></a>
                        		</li>
                        	<% } else { %>
                        		<li class="page-item">
                        		<a class="page-link" href="/bono/selectList.sa?currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>
                        
                        
                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/selectList.sa?currentPage=<%=cur+1 %>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/selectList.sa?currentPage=<%= mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
                                      
                    </ul>
                </nav>
                
            <% } else { %>
            
			<nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/search.sa?searchData=<%=searchD %>&searchSort=<%=searchS %>&currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/search.sa?searchData=<%=searchD %>&searchSort=<%=searchS %>&currentPage=<%= cur-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } %>
                        </li>
                        <% for ( int p = st ; p <= ed ; p++ )  { %>
                        	<% if ( p == cur ) { %>
                        		<li class="page-item">
                        		<a class="page-link" href="#"><%=p %></a>
                        		</li>
                        	<% } else { %>
                        		<li class="page-item">
                        		<a class="page-link" href="/bono/search.sa?searchData=<%=searchD %>&searchSort=<%=searchS %>&currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>
                        
                        
                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/search.sa?searchData=<%=searchD %>&searchSort=<%=searchS %>&currentPage=<%=cur+1 %>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/search.sa?searchData=<%=searchD %>&searchSort=<%=searchS %>&currentPage=<%= mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
                                      
                    </ul>
                </nav>
                
            <% } %>
                
			</div>
			
			
		
			
		</div>
	</div>
	
	<script>
	// 검색버튼 누르면 검색창 폼 제출
	$(function() {
		$('#searchBtn').on('click', function() {
			$('#searchForm').submit();
		});
	});
	
	// 출고단가를 받아올 배열
	var arr = [];
	
	// 수정, 삭제
	$(function () {
		// 휴지통 클릭 시 삭제
		$('.deleteTr').on('click', function() {
			
			// 삭제할 판매번호
			var sno = $(this).parent().siblings('td#s_no').text();
			
			// 판매번호 전송 -> DB에서 해당 판매번호 삭제
			$.ajax({
				url : "/bono/delete.sa",
				type : "post",
				data : { s_no : sno },
				success : function() {}, 
				error : function(error) {
					console.log("판매 삭제 전송 실패");
				} 
			
			});
			
			// 화면에서도 지우기
			$(this).parent().parent().remove();
		});
		
		// 연필 클릭 시 수량 수정
		$('.updateTr').on('click', function() {
			
			// 화면 먼저 수정해서 servlet으로 넘길거임
			// 수량을 input태그로 변경
			var update = $(this).parent().siblings('td#s_quan');
			var val_up = $(this).parent().siblings('td#s_quan').text();
    		
    		update.replaceWith('<td id="s_quan"> <input type="number" id="up_s_quan"' 
    				            + ' style="width:70px; margin-top:7px;" value="' + val_up + '"/>' 
    				            + '<button id="updateBtn">수정</button> </td>');
    		
    		// 수정 버튼 클릭 시 input태그로 수정한 값 처리
    		$('#updateBtn').on('click', function() {
    			
    			var sno = $(this).parent().siblings('td#s_no').text();
    			var pno = $(this).parent().siblings('td#p_no').text();
    			var stotal = $(this).parent().siblings('td#s_total');
    			
    			// 새로 입력된 값 (수정 값)
    			var updated = $('input[id=up_s_quan]').val();
        		
    			// 수량 td를  input -> text로 바꾸기
        		var update2 = $(this).parent('td#s_quan');
    			update2.replaceWith('<td id="s_quan">' + updated + '</td>');
        		
    			// 해당 열의 상품코드 전송 -> DB에서 출고단가 받음
    			$.ajax({
					url : "/bono/space.sa",
					type : "post",
					async : false,
					data : { p_no : pno },
					success : function(data) {
					
						for(var i in data) {
							arr[i] = data[i];
						}
					
					}, error : function(error) {
						console.log("상품정보 에러발생");
					}
				});
    			
    			// 수정된 수량으로 총 금액 다시 계산해서 넣기
    			var price = updated*arr[1];
    			stotal.text(price);
    			
    			// 화면에서 수정한 값을 DB에 반영하기 위해 ajax로 전송
    			// 판매번호, 수정된 수량 전송 
        		$.ajax({
					url : "/bono/update.sa",
					type : "post",
					data : { s_no : sno, 
					         up_s_quan : updated },
					success : function() {}, 
					error : function(error) {
						console.log("판매 수정 전송 실패");
					} 
				});
        		
    		});
		});
	});
	
	</script>
	
	<%@include file="../common/footer.jsp" %>
</body>
</html>