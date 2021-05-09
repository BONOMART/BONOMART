<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bn.jsp.client.model.vo.*, java.util.*" %>
<%
	ArrayList<Client> list = (ArrayList<Client>)request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Bank> bankList = (ArrayList<Bank>)request.getAttribute("bankList");
	String dataThing = (String)request.getAttribute("data");
	String sortThing = (String)request.getAttribute("sort");

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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>거래처 조회</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

 
<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/clientList.css">

<style>
      input-group mb-3 {
         margin-left : auto;
         margin-right : auto;
         width: 600px;
      }
</style>

<script>
	$(function(){
		$('#tableList tr').on('click',function(){
			var m_code = $(this).children().eq(0).text();
			var m_title = $(this).children().eq(1).text();
			var m_b_name = $(this).children().eq(2).text();
			var m_b_code = $(this).children().eq(3).val();
			var m_who = $(this).children().eq(4).text();
			var m_phone = $(this).children().eq(5).text();
			var m_account = $(this).children().eq(6).text();
			var m_addr = $(this).children().eq(7).text();
			
			$("#m_code").val(m_code);
			$("#m_title").val(m_title);
			$("#bankInputMod").val(m_b_name);
			$("#bankCodeInputMod").val(m_b_code);
			$("#m_who").val(m_who);
			$("#m_phone").val(m_phone);
			$("#m_account").val(m_account);
			$("#m_addr").val(m_addr);
			
			$("#myModal").modal();
		
		});
	});
	
	$(function(){
		$('#bankInputMod').on('click',function(){
			$('#myModalBank').modal();
		});
		
		$('#myModalBank tbody tr').on('click',function(){
			$('#bankCodeInputMod').val($(this).children().eq(1).text());
			$('#bankInputMod').val($(this).children().eq(0).text());
			$('#myModalBank').modal('hide');
		});
		
	});

	$(function(){
		$('#deleteClient').on('click',function(){
			var c_no = $('#m_code').val();
			location.href = '/bono/delete.cl?c_no=' + c_no;
		});
	})
	
	
	
</script>

</head>
<body>
<!-- 헤더 영역 추가 -->
<%@ include file="/views/common/header.jsp" %>

                <!-- header 영역과 게시판 영역 사이 공간 -->
                <div style="padding-top: 50px; padding-bottom: 50px;"></div>

                <h3 style="text-align: center;">거래처 조회</h3>
                <form action="/bono/listSort.cl" method="get">
                <!-- 조회 페이지의 서치 바 -->
		            <div class="input-group mb-3" style="margin-left : auto;
		                 margin-right : auto; width: 600px; background : white;">
		                 <input type="text" class="form-control" placeholder="검색할 데이터를 입력하세요.." aria-label="Recipient's username" aria-describedby="button-addon2"
		                 style="width: 300px" id="searchData" name="searchData" value="${param.searchData}">
		                    
		                 <!-- 검색 버튼 -->
						<select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon" style="width:40px" name="searchSort">
							<option ${(param.searchSort == "c_no")? "selected" : "" } value="c_no">거래처 코드</option>
							<option ${(param.searchSort == "c_name")? "selected" : "" } value="c_name">거래처 명</option>
							<option ${(param.searchSort == "c_manager")? "selected" : "" } value="c_manager">담당자 명</option>
						</select>
							
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit" >검색하기</button>
						</div>
						
							
		                <!-- 검색 버튼 끝 -->
		                  
		            </div>
	            </form>
            	
            <!-- 서치 바 끝 -->
                
                 <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                <table class="table table-hover text-center">
                    <thead>
	                    <tr>
	                        <th>거래처 코드</th>
	                        <th>거래처 명</th>
	                        <th>은행명</th>
	                        <th>담당자 명</th>
	                        <th>전화 번호</th>
	                        <th>계좌 번호</th>
	                        <th>주소</th>
	                    </tr>
                    </thead>

                    <tbody id="tableList">
                    <% for(Client c : list) { %>
                        <tr>
                            <td><%=c.getC_no() %></td>
                            <td><%=c.getC_name() %></td>
                            <td><%=c.getB_title() %></td>
                            <input type="hidden" value="<%=c.getB_code()%>"/>
                            <td><%=c.getC_manager() %></td>
                            <td><%=c.getC_tel() %></td>
                            <td><%=c.getC_account() %></td>
                            <td><%=c.getC_address() %></td>
                        </tr>
                    <% } %>
                    </tbody>

                </table>

				<!-- 등록 버튼 클릭 시, 팝업될 모달창 -->
				<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
									
							<div class="modal-header">
								<h5 class="modal-title">거래처 데이터 수정</h5>
								<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="/bono/update.cl" method="post" >	
								<div class="modal-body">
									<div class="product_select">
										<div class="select">	
											<div class="item" style="width:45%">
												<input type="hidden" id="listNum" />
												<div>
													<span class="foamSpan">거래처 코드</span><div class="col-sm-8"><input type="text" name="c_no" class="form-control" id="m_code"></div>
												</div>
												<div>
													<span class="foamSpan">거래처 명</span><div class="col-sm-8"><input type="text" name="c_name" class="form-control" id="m_title"></div>
												</div>
												<div>
	                                           		<span class="foamSpan">은행명</span>
	                                           		<div class="col-sm-8" >
	                                           			<input type="text" class="form-control" id="bankInputMod" value="은행명을 골라주세요"/>
	                                           			<input type="hidden" id="bankCodeInputMod" name="b_code" />
	                                           		</div>
	                                        	</div> 
											</div>
													
											<div class="item" style="width:45%">
												<div>
													<span class="foamSpan">담당자 명</span><div class="col-sm-8"><input type="text" class="form-control" id="m_who" name="c_who"></div>
												</div>
												<div>
													<span class="foamSpan">담당자 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="m_phone" name="c_phone" pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000"></div>
												</div>
												<div>
													<span class="foamSpan">계좌 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="m_account" name="c_account" pattern="\d{1,6}-\d{1,6}-\d{1,6}" title="형식 000-000000-00000"></div>
												</div>
											</div>
										</div>
													
										<div class="select2">
											<span class="foamaddSpan">주소</span>
											<div class="foamaddDiv"><input type="text" class="form-control" id="m_addr" name="c_addr"></div>
										</div>
													
									</div>
								</div>
											
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary"
									>수정</button>
									<button type="button" class="btn btn-primary"
									id="deleteClient" style="background:red;">삭제</button>
									<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								</div>
							</form>            	
						</div>
					</div>
				</div>
                <!-- 모달 끝 -->
				<div class="modal" tabindex="-1" id="myModalBank">
	  				<div class="modal-dialog">
	    				<div class="modal-content">
						
							<div class="modal-header">
								<h5 class="modal-title">은행 선택</h5>
								<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							
							<div class="modal-body" id="modal_bank">
								<table class="table table-hover text-center">
								
									<thead>
										<tr>
											<th>은행명</th>
											<th>은행 코드</th>
	                        			</tr>
	                    			</thead>
	
	                    			<tbody>
										<% for(Bank b : bankList) {%>
										<tr>
											<td><%=b.getB_title() %></td>
											<td><%=b.getB_code() %></td>
										</tr>
										<%} %>
	                    			</tbody>
	
	                			</table>

							</div>
						</div>
					</div>
				</div>	

                <!-- 게시판 영역과 page nation 영역 사이 공간 -->
                <div style="padding-top: 30px; padding-bottom: 30px;"></div>

                <!-- 페이지 네이션 시작 -->
                <%if (dataThing==null && sortThing==null) {%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/selectlist.cl?currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/selectlist.cl?currentPage=<%= cur-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } %>
                        </li>
                        <% for(int p = st ; p <= ed ; p++)  { %>
                        	<% if( p == cur) { %>
                        		<li class="page-item">
                        		<a class="page-link" href="#" style="background:lightgrey;"><%=p %></a>
                        		</li>
                        	<% } else {%>
                        		<li class="page-item">
                        		<a class="page-link" href="/bono/selectlist.cl?currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>
                        
                        
                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/selectlist.cl?currentPage=<%=cur+1 %>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/selectlist.cl?currentPage=<%= mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
                                      
                    </ul>
                </nav>
                <%} else { %>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/listSort.cl?searchData=<%=dataThing %>&searchSort=<%=sortThing %>&currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/listSort.cl?searchData=<%=dataThing %>&searchSort=<%=sortThing %>&currentPage=<%= cur-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } %>
                        </li>
                        <% for(int p = st ; p <= ed ; p++)  { %>
                        	<% if( p == cur) { %>
                        		<li class="page-item">
                        		<a class="page-link" href="#" style="background:lightgrey;"><%=p %></a>
                        		</li>
                        	<% } else {%>
                        		<li class="page-item">
                        		<a class="page-link" href="/bono/listSort.cl?searchData=<%=dataThing %>&searchSort=<%=sortThing %>&currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>
                        
                        
                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/listSort.cl?searchData=<%=dataThing %>&searchSort=<%=sortThing %>&currentPage=<%=cur+1 %>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/listSort.cl?searchData=<%=dataThing %>&searchSort=<%=sortThing %>&currentPage=<%= mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">
                                      
                    </ul>
                </nav>                
                <%} %>
                <!-- 페이지 네이션 끝 -->
                <!-- 푸터 영역 추가 -->
            <%@ include file="../common/footer.jsp" %>
            </div>
        </div>
    </div>

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>

</body>
</html>