<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.bn.jsp.order.model.vo.*, java.util.*" %>

<%
	ArrayList<OrderList> list = (ArrayList<OrderList>) request.getAttribute("list");
	
	String SearchValue = (String) request.getAttribute("SearchValue");
	String SearchKey = (String) request.getAttribute("SearchKey");
/* 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	System.out.println(pi);
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>발주 조회</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/orderList.css">

</head>
<body>
<!-- 헤더 영역 추가 -->
<%@ include file="/views/common/header.jsp" %>
      
                <!-- header 영역과 게시판 영역 사이 공간 -->
                <div style="padding-top: 50px; padding-bottom: 50px;"></div>

                <h3 style="text-align: center;">발주 조회</h3>
                
                <!-- 조회 페이지의 서치 바 -->
                <form action="<%=request.getContextPath() %>/order/orderlist.do" id="searchForm" method="">
                
	                <div class="input-group mb-3" style="margin-left : auto; margin-right : auto; width: 600px;">
					
	                    <input type="text" class="form-control" placeholder="검색할 데이터를 입력하세요.." aria-label="Recipient's username" aria-describedby="button-addon2"
	                    		id="searchValue" name="searchValue">
	                    <select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon" style="width:40px" name="searchKey">
							<option selected value="all">검색조건</option>
							<option value="o_no">발주번호</option>
							<option value="p_no">상품코드</option>
							<option value="c_name">거래처명</option>
							<option value="o_quan">발주수량</option>
						</select>
						<!-- 검색 버튼 -->	
						<div class="input-group-append">
							<button id="searchBtn" class="btn btn-outline-secondary" type="submit">검색</button>
						</div>
	                   <!-- 검색 버튼 -->
	                   <!--  <div class="btn-group">
	                       <button type="button" class="btn btn-primary" id="searchbtn">검색</button>
	                       <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                         <span class="sr-only">Toggle Dropdown</span>
	                       </button>
	                       <div class="dropdown-menu">
	                               <a class="dropdown-item" href="#">발주 번호 기준 정렬</a>
	                               <div class="dropdown-divider"></div>
	                               <a class="dropdown-item" href="#">발주 상품코드 기준 정렬</a>
	                               <div class="dropdown-divider"></div>
	                               <a class="dropdown-item" href="#">거래처 코드 기준 정렬</a>
	                               <div class="dropdown-divider"></div>
	                               <a class="dropdown-item" href="#">발주 일자 기준 정렬</a>
	                               <div class="dropdown-divider"></div>
	                               <a class="dropdown-item" href="#">담당자 기준 정렬</a>
	                        </div>
	                  	</div> -->
	               	</div>
                </form>
                <!-- 검색 버튼 끝 -->
                
                <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
               	<div class="scrollable">
                <table class="table table-hover text-center" id="table1">
                    <thead>
                        <tr data-target=".modal" data-toggle="modal">
                            <th>발주번호</th>
                            <th>발주상품코드</th>
                            <th>거래처명</th>
                            <th>발주수량</th>
                            <th>발주일자</th>
                            <th>총 금액</th>
                            <th>담당자</th>
                            <th>수정&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
                        </tr>
                    </thead>

                    <tbody class="LookUpList">
                    	<% for(OrderList o : list) { %>
                    		<tr>
                    			<td id="order_No"><%=o.getO_no() %></td>
                    			<td id="order_Pno"><%=o.getP_no() %></td>
                    			<td id="order_Cname"><%= o.getC_name() %></td>
                    			<td id="order_Oquan"><%= o.getO_quan() %></td>
                    			<td id="order_Odate"><%= o.getO_date() %></td>
                    			<td id="order_Aprice"><%= o.getA_price() %></td>
                    			<td id="order_Mname"><%= o.getM_name() %></td>
                    			<td>
									<svg class="updateRow" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  										<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
									</svg>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<svg class="deleteRow" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  										<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  										<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg>
								</td>
                    		</tr>
                    	<% } %>
 					</tbody>
                </table>
                </div>

				<!-- 삭제 버튼 클릭 시, 팝업될 모달창 -->
                <!-- <div class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">등록한 발주 데이터 삭제</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>정말 삭제하시겠습니까??</p>
                                <p>삭제 후, 다시 등록하셔야 합니다.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">삭제</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- 모달 끝 -->
                 </tbody>
                </table>
                <!-- 게시판 끝 -->

                <!-- 게시판 영역과 page nation 영역 사이 공간 -->
                <div style="padding-top: 30px; padding-bottom: 30px;"></div>

            <!-- 푸터 영역 추가 -->
            <%@ include file="../common/footer.jsp" %>
                </div>
            </div>
        </div>

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
            
		<script>
	       	
			var arr =[];
		
	        $(function() {
	        	$('.deleteRow').on('click',function() {
	        		var self = this;
	        		var o_no = $(self).parent().siblings('td#order_No').text();
	        		
	        		/* alert(o_no); */
	        		
	        		if(confirm("정말 삭제학시겠습니까?")) {
		        		$.ajax({
		        			url: "/bono/OrderListDelete.do",
		        			type: "POST",
		        			data: {o_no : o_no},
		        			success: function() {
		        				console.log("삭제 성공");
					       		$(self).parent().parent().remove();
					       		//alert("삭제");
		        			}, error: function() {
		        				alert("삭제 실패");
		        			}
		        		});
		        	
	        		}
	        		
	        	});

	        	$('.updateRow').on('click', function() {

	        		var update = $(this).parent().siblings('td#order_Oquan');
	        		
	        		update.replaceWith('<td id="order_Oquan">' +
	        								'<input type="number" id="up_o_quan" style="width: 70px; margin-top: 7px;">' +
	        								'<button id="updateBtn">수정</button> </td>');
	        		
	        		$('#updateBtn').on('click', function() {
	        			var o_no = $(this).parent().siblings('td#order_No').text();
	        			var p_no = $(this).parent().siblings('td#order_Pno').text();
	        			var a_price = $(this).parent().siblings('td#order_Aprice');
	        			
	        			var success_Update = $('input[id=up_o_quan]').val();
	        			
	        			var success_Updated = $(this).parent('td#order_Oquan');
	        			success_Updated.replaceWith('<td id="order_Oquan">' + success_Update + '</td>');
	        			
	        			$.ajax({
	        				url: "/bono/OrderSpace.or",
	        				type: "post",
	        				async: false,
	        				data : {order_Pno : p_no},
	        				success : function(data) {
	        					for (var i in data) {
	        						arr[i] = data[i];
	        						console.log(arr[i]);
	        					}
	        				},
	        				error : function(error) {
	        					console.log("발주정보 에러발생");
	        				}
	        			});
	        			
	        			var price = success_Update*arr[1];
	        			a_price.text(price);
	        			
	        			$.ajax({
	        				url: "/bono/OrderUpdate.or",
	        				type: "post",
	        				data : {
	        					order_No : o_no,
	        					up_o_quan : success_Update },
	        				success : function() {},
	        				error : function(error) {
	        					console.log("발주 수정 전송 실패");
	        				}
	        			});
	        		});
	        	});
	        });
           
    	</script>

</body>
</html>