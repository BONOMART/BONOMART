<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%@ page import="com.bn.jsp.inventory.model.vo.*, java.util.*" %>
  <% 
    	ArrayList<Inventory> list = (ArrayList<Inventory>)request.getAttribute("list");
    
		PageInfo pi = (PageInfo) request.getAttribute("pi");
		
		String type = (String)request.getAttribute("type");
		String content = (String)request.getAttribute("content");
		
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
<title>재고 관리</title>
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<link rel="stylesheet" href="/bono/assets/css/inventory.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body style= "background: whitesmoke;">

<%@ include file ="../common/header.jsp" %>


    <div id="graph">
                            <div id="serach">
                              <a href="/bono/inventoryLogin.in" style= "color:black;"><h2> 재고 관리 </h2> </a>
                            </div> 
							 <hr />
                            <div id = member >
                                  <form action="/bono/searchList.in" id="searchForm"> 
                                    <div id="field2">
										<div id="select_box">
									    		<label for="color">항목선택 &nbsp; &nbsp;
									    				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
  													 <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
													</svg>
									    		</label>
									    			<select id="color" title="select color" name="type">
									     		  <option selected="selected">항목선택</option>
									      		  <option value="p_no">상품코드</option>
									      		  <option value="p_group">그룹명</option>
									      		  <option value="p_name">상품명</option>
									      		  <option value="p_client">거래처명</option>
									  		  </select>
											</div>
											<div id="text1"> &nbsp;<input type="text" name="content" size="50"/>    &nbsp; &nbsp;
											<button type="button" class="btn btn-primary" id="btn1">조 회</button>
											</div>				
									      </div>                                
                                    </form>
                                       	 
                                    <div id="table2">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="inventoryList">
                                           <tr>
                                                <th>상품코드</th>
                                              	<th>상품명</th>
                                              	<th>그룹명</th>
                                                	<th>거래처명</th>
                                                <th>현재수량</th>
                                                	<th>수정</th>
                                           </tr>      
                                         <%for( Inventory i : list) {%>
                                            <tr id="tobody">
                                                <td id="<%=i.getP_no()%>"><%=i.getP_no()%></td>
                                               	<td><%=i.getP_name()%></td>
                                                <td><%=i.getP_group()%></td>
                                                	<td><%=i.getP_client()%> </td>
                                                <td id="p_quan" name="p_quan"><%=i.getP_quan()%> </td>
                                                <td><svg class="updateTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  													<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
													</svg>
												</td>

                                            </tr>
                                            	   	<% } %>
                                         </table>
									</div>
								</div>
								
				 <!-- 페이지 네이션 -->
					<div style="padding-top: 5px; padding-bottom: 5px;"></div> 
					
					<!-- 검색창과 소트창이 null이라면 (아무것도 검색하지 않았다면) 기본 리스트 -->
					<% if (type == null || content == null)  {%>
				<nav aria-label="Page navigation example">	
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/inventoryLogin.in?currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/inventoryLogin.in?currentPage=<%= cur-1%>" aria-label="Previous">
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
                        		<a class="page-link" href="/bono/inventoryLogin.in?currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>

                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/inventoryLogin.in?currentPage=<%=cur+1%>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/inventoryLogin.in?currentPage=<%=mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
						                    </ul>
						                </nav>
						   <!-- 페이지 네이션 끝 -->
								<%} else { %>
												<nav aria-label="Page navigation example">	
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/searchList.in?type=<%=type%>&content=<%=content %>&currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/searchList.in?type=<%=type%>&content=<%=content %>&currentPage=<%= cur-1%>" aria-label="Previous">
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
                        		<a class="page-link" href="/bono/searchList.in?type=<%=type%>&content=<%=content %>&currentPage=<%=p%>" ><%=p%></a>
                        		</li>
                        	<% } %>
                        <% } %>

                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/searchList.in?type=<%=type%>&content=<%=content %>&currentPage=<%=cur+1%>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/searchList.in?type=<%=type%>&content=<%=content %>&currentPage=<%=mx%>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
						                    </ul>
						                </nav>
								
								<%} %>
								<div style="padding-top: 50px; padding-bottom: 50px;"></div> 
                            </div>
                            
                            </div>
   
 <script>
 /*      -------------------------------------- select----------------------------------------------  */
		jQuery(document).ready(function(){
		    
		    var select = $("select#color");
		    
		    select.change(function(){
		        var select_name = $(this).children("option:selected").text();
		        $(this).siblings("label").text(select_name);
		    });
		});
 
		// 검색버튼 클릭
		 
		$('#btn1').on('click', function(){
	       		$('#searchForm').submit();
		});
		
		var arr = [];
	
	$(function() { 
		
		// 연필 클릭 시 수량 수정
		$('.updateTr').on('click', function() {
		
			//수정할 판매번호
			var pno = $(this).parent().parent().children().first().attr('id');
			var quan	=$(this).parent().siblings('[name="p_quan"]').text();
			
			// 화면 먼저 수정해서 servlet으로 넘길거임
			// 수량을 input태그로 변경
			var update = $(this).parent().siblings('td#p_quan');
    		
    		update.replaceWith('<td id="p_quan" name="p_quan">'+
    											'<input type="number" id="up_s_quan" style="width:70px; margin-top:7px;" value=' + quan + '>' +
                                               	'<button type="button" class="btn btn-success" id="changebtm"> 수 &nbsp; 정 </button> </td>');
    		
    		// 수정 버튼 클릭 시 input태그로 수정한 값 처리
    			$('#changebtm').on('click', function() {
    				
    				var pno = $(this).parent().parent().children().first().attr('id');
	    			// 새로 입력된 값 (수정 값)
	    			var updated = $('#up_s_quan').val();
	        	
	    			// 수량 td를  input -> text로 바꾸기
	        		var update2 = $(this).parent('td#p_quan');
	    			
	    			update2.replaceWith('<td id="p_quan">' + updated + '</td>');
	        		
	    			
	    			// 화면에서 수정한 값을 DB에 반영하기 위해 ajax로 전송
	    			// 판매번호, 수정된 수량 전송 
	        		$.ajax({
						url : "/bono/update.in",
						type : "post",
						data : { p_no : pno, 
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





<%@ include file ="..//common/footer.jsp" %>

</body>
</html>