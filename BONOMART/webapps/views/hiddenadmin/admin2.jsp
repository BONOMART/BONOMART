<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bn.jsp.admin.model.vo.*, java.util.*" %>
    <% 
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    
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
<title>Insert title here</title>
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
                             <a href="/bono/searchOK.ad" style= "color:white;"><h3> 회원 승인요청</h3> </a>
                            </div> 
                         	
                            <div id = "member" >
                                                                                                          	
                                    <div id="table2">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="memberList">
                                           	<thead>
                                           <tr>
                                               <th> 회원번호 </th>
                                               <th> 이 름 </th>
                                               <th> 아이디 </th>
                                               <th> 비밀번호 </th>
                                               <th> 이메일 </th>
                                               <th> 연락처 </th>
                                               <th> 직 급 </th>
                                               <th> 부 서 </th>
                                               <th> 가입승인 </th>
                                           </tr>
                                           </thead>
                                <% for( Member m : list)  { %>
                             
                                         <tr id ="tbody">
                                        	<td id="<%=m.getUserNo() %>"> <%=m.getUserNo() %> </td>
                                          <td> <%=m.getUserName()%></td>
                                          <td> <%=m.getUserId() %>  </td>
                                          <td><%=m.getUserPwd() %>  </td>
                                          <td> <%=m.getEmail() %> </td>
                                          <td> <%=m.getPhone() %>  </td>
                                          <td> <%=m.getJob() %>  </td>
                                          <td> <%=m.getDept() %>  </td>
                                          <td>
                                           <button type="button" class="btn btn-success" name="Ok"> 승 &nbsp; 인 </button>
                                          <button type="button" class="btn btn-danger"  name="No">  거&nbsp; 절 </button> </td>
                                      </tr>
                                      	<% } %>
                                         </table>
                                      	 </div> 
                                       </div>      
									</div>
										
										<!-- 페이지 네이션 -->
										<div style="padding-top: 20px; padding-bottom: 10px;"></div> 
										<nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                    	<li class="page-item">
                            <a class="page-link" href="/bono/searchOK.ad?currentPage=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>                    	
                        <li class="page-item">
                        <% if (cur <= 1) { %>
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } else { %>
                        	<a class="page-link" href="/bono/searchOK.ad?currentPage=<%= cur-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        <% } %>
                        </li>
                        <% for(int p = st ; p <= ed ; p++)  { %>
                        	<% if( p == cur) { %>
                        		<li class="page-item">
                        		<a class="page-link" href="#"><%=p %></a>
                        		</li>
                        	<% } else {%>
                        		<li class="page-item">
                        		<a class="page-link" href="/bono/searchOK.ad?currentPage=<%=p %>" ><%=p %></a>
                        		</li>
                        	<% } %>
                        <% } %>
                        
                        
                        <li class="page-item">
                        <% if (cur >= mx) { %>
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        <% } else { %>
                            <a class="page-link" href="/bono/searchOK.ad?currentPage=<%=cur+1 %>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>                        
                        <% } %>
                        </li>
                        
                    	<li class="page-item">
                            <a class="page-link" href="/bono/?currentPage=<%= mx %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>                    	
                        <li class="page-item">          
                                      
                    </ul>
                </nav>
                            </div>
                            
                            
                   
           
 <script>

	 /* 거절 버튼 클릭  */
	$("[name=No]").on('click',function(){
		
		var mno = $(this).parent().parent().children().first().attr('id');
				
		$.ajax({
			url : "/bono/adminNo.ad?mno=" + mno,
			type : "get",
			data : {
				mno,
				access : "B" 
			}, success : function(data){	
				
				
				location.href="/bono/searchOK.ad"
				alert("승인 거절");
			}, error : function(error){
				alert("승인 거절 실패!");
			}
			
		});
	});
	
 	
 	 /* 승인 버튼 클릭  */
 	$("[name=Ok]").on('click',function(){
 		
 		var mno = $(this).parent().parent().children().first().attr('id');
 				
 		
 		
 		$.ajax({
 			url : "/bono/adminOk.ad?mno=" + mno,
 			type : "get",
 			data : {
 				mno,
 				access : "Y" 
 			}, success : function(data){	
 				
 				
 				location.href="/bono/searchOK.ad"
 				alert("승인 성공!");
 			}, error : function(error){
 				alert("승인 실패!");
 			}
 			
 		});
 	});
	
 
 
</script>






<%@ include file ="..//common/footer.jsp" %>

</body>
</html>