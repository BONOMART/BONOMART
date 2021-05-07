<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bn.jsp.admin.model.vo.*, java.util.*" %>
       <% 
    	ArrayList<Member2> list = (ArrayList<Member2>)request.getAttribute("list");
    
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
<title>회원 관리</title>
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<link rel="stylesheet" href="/bono/assets/css/admin.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body style= "background: whitesmoke;">

<%@ include file ="../common/header.jsp" %>

    <div id="graph">
                            <div id="search">
                                 <a href="/bono/MemberList.ad" style= "color:white;"><h3> 회원 관리 </h3> </a>          
                            </div> 
						
                            <div id = member >
                                 <form action="/bono/searchList.ad"  id="searchForm">  
                                    <div id="field2">
										<div id="select_box">
									    		<label for="color">항목선택 &nbsp; &nbsp;
									    				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
  													 <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
													</svg>  			
									    		</label>
									    			<select id="color" title="select color" name="type">
									     		   <option selected="selected">항목선택	</option> 
									      		  <option value="userId" >아이디</option>
									      		  <option value="userName">이 름</option>
									      		  <option value="userNo">회원번호</option>
									      		  <option value="dept">부 서</option>
									      		  <option value="job">직 급</option>
									  		  </select>
											</div>
											<div id="text1"> &nbsp;<input type="text" name="content" size="50"/>    &nbsp; &nbsp;
											<button type="submit" class="btn btn-primary" id="btn1">조 회</button>
											</div>
									      </div>                                
                   					   </form>                                
                                                  	
                                    <div id="table2">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="memberList">
                                           	<thead>
                                           <tr>
                                               <th> 회원번호 </th>
                                               <th> 이 름 </th>
                                               <th> 아이디 </th>
                                               <th> 이메일 </th>
                                               <th> 연락처 </th>
                                               <th> 직 급 </th>
                                               <th> 부 서 </th>
                                               <th> 권한회수 </th>
                                           </tr>
                                           </thead>
                                      	
                                      	 <% for( Member2 me : list)  {%>
                                      	 <tr id ="tbody">
                                     	<td id="<%=me.getUserNo() %>"> <%=me.getUserNo() %> </td>
                                          <td> <%=me.getUserName()%></td>
                                          <td> <%=me.getUserId() %>  </td>
                                          <td> <%=me.getEmail() %> </td>
                                          <td> <%=me.getPhone() %>  </td>
                                          <td> <%=me.getJob() %>  </td>
                                          <td> <%=me.getDept() %>  </td>
                                          <td> <button type="button" class="btn-danger" name="Out"> 탈&nbsp;퇴 </button></td>
                                      </tr>
                                      	<% } %>
											</table>
                                       </div> 
									</div>
											
				<!-- 페이지 네이션 -->
				<div style="padding-top: 20px; padding-bottom: 10px;"></div> 
					
					<!-- 검색창과 소트창이 null이라면 (아무것도 검색하지 않았다면) 기본 리스트 -->
					<% if (type == null || content == null)  {%>
				<nav aria-label="Page navigation example">	
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/MemberList.ad?currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/MemberList.ad?currentPage=<%= cur-1%>" aria-label="Previous">
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
                        		<a class="page-link" href="/bono/MemberList.ad?currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>

                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/MemberList.ad?currentPage=<%=cur+1%>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/MemberList.ad?currentPage=<%=mx %>" aria-label="Next">
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
                            <a class="page-link" href="/bono/searchList.ad?type=<%=type%>&content=<%=content %>&currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/searchList.ad?type=<%=type%>&content=<%=content %>&currentPage=<%= cur-1%>" aria-label="Previous">
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
                        		<a class="page-link" href="/bono/searchList.ad?type=<%=type%>&content=<%=content %>&currentPage=<%=p%>" ><%=p%></a>
                        		</li>
                        	<% } %>
                        <% } %>

                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/searchList.ad?type=<%=type%>&content=<%=content %>&currentPage=<%=cur+1%>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/searchList.ad?type=<%=type%>&content=<%=content %>&currentPage=<%=mx%>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
						                    </ul>
						                </nav>
								
								<%} %>
								<div style="padding-top: 50px; padding-bottom: 50px;"></div> 
                            </div>
                            
                            </div>
                            <% } %>
     
           
 <script>
 /*      -------------------------------------- select----------------------------------------------  */
		jQuery(document).ready(function(){
		    
		    var select = $("select#color");
		    
		    select.change(function(){
		        var select_name = $(this).children("option:selected").text();
		        $(this).siblings("label").text(select_name);
		    });
		});
 
 
/*  	$(function(){ 
 		$('#color').on('selected', function() {
 			
 			var option =  $('#color', )
 		});
 	}); */
 	
 	// 검색버튼 클릭
 
	$('#btn1').on('click', function(){
       		$('#searchForm').submit();
	});


		// 탈퇴 버튼클릭
		$("[name=Out]").on('click',function(){
		
		var mno = $(this).parent().parent().children().first().attr('id');
		
		var com = confirm("탈퇴하시겠습니까?");
		
		if(com == true){
		
		$.ajax({
			url : "/bono/adminMemberOut.ad",
			type : "post",
			data : { mno : mno },
			success : function() {}, 
			error : function(error) {
				console.log("회원 삭제 전송 실패");
			} 
		  });
		  // 화면에서도 지우기
		  $(this).parent().parent().remove();
		   alert("회원탈퇴가 성공하였습니다.")

		  }else if(com== false) {
			  alert("탈퇴가 취소되었습니다.")
			  
		  }
		});


</script>






<%@ include file ="..//common/footer.jsp" %>

</body>
</html>