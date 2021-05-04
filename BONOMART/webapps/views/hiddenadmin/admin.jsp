<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bn.jsp.admin.model.vo.*, java.util.*" %>
    <% 
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/admin.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body style= "background: whitesmoke;">

<%@ include file ="../common/header.jsp" %>


    <div id="graph">
                            <div id="search">
                              <h3> 회원 관리 </h3> 
                            </div> 
						
                            <div id = member >
                                 <!--  <form action="/Bono/../search.ad" method="post">  -->
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
											 <div id="result">
											</div>
									      </div>                                
  <!--                              </form>  -->                                
                                <script>
                                	$('#btn1').on('click', function(){
                                		
                                		/* var jsonData = { } ;
                                		
                                		jsonData.name = $('[name=type]').val();
                                		jsonData.content = $('[name=content]').val();
                                		
                                		console.log(jsonData); */
                       
                               			$.ajax({
                                			url : "/bono/search.ad",
                                			type : "post",
                                			data : { 
                                				name :$('[name=type]').val(),
                                				content : $('[name=content]').val()
                                			}, success : function( data ) { 
                                				alert("전송성공!");
                                				
                                				 
                                				var $tbody = $('<tbody>');
                                				
                                				for(var i in data){
                                					// 내용을 모두 담을 tr 생성
                                					var $tr = $('<tr>');
                                					
                                					// 내용을 각각 표현할 td 태그 생성
                                					var $userNo= $('<td>').text(data[i].userNo);
                                					var $userName = $('<td>').text(data[i].userName);
                                					var $userId = $('<td>').text(data[i].userId);
                                					var $userPwd = $('<td>').text(data[i].userPwd);
                                					var $email = $('<td>').text(data[i].email);
                                					var $phone = $('<td>').text(data[i].phone);
                                					var $job = $('<td>').text(data[i].job);
                                					var $dept = $('<td>').text(data[i].dept);
                                					var $sign = $('<td>').html($(' <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button>'));
                                					
                                					$tr.append($userNo).append($userName)
                                					   .append($userId).append($userPwd)
                                					   .append($email).append($phone).append($job)
                                					   .append($dept).append($sign);
                                					
                                					$tbody.append($tr);
                                					
                                				}
                                				
                                				$('#memberList>tbody').remove();
                                				
                                				$('#memberList').append($tbody);
                                			 },  error : function(error) {
                                				consle.log("에러 발생!");
                                			}
                                		});	 
                                	});
                                
                                </script>
                                                              	
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
                                       <!--   <tr>
                                        <td> No.119 </td>
                                          <td> 김보노 </td>
                                          <td> admin </td>
                                          <td> pass01 </td>
                                          <td> bono@bonomart.com </td>
                                          <td> 010-1234-5678 </td>
                                          <td> 관리자 </td>
                                          <td> 재무부 </td>
                                          <td> <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button></td>
                                      </tr>
                                           -->
                                      
                                         </table>
                                       </div> 
									</div>
										<!-- 게시판 영역과 page nation 영역 사이 공간 -->
										<div style="padding-top: 50px; padding-bottom: 50px;"></div> 
									
									   <!-- 페이지 네이션 시작 -->
						                <nav aria-label="Page navigation example">
						                    <ul class="pagination justify-content-center">
						                        <li class="page-item">
						                            <a class="page-link" href="#" aria-label="Previous">
						                                <span aria-hidden="true">&laquo;</span>
						                            </a>
						                        </li>
						                        <li class="page-item"><a class="page-link" href="#">1</a></li>
						                        <li class="page-item"><a class="page-link" href="#">2</a></li>
						                        <li class="page-item"><a class="page-link" href="#">3</a></li>
						                        <li class="page-item">
						                            <a class="page-link" href="#" aria-label="Next">
						                                <span aria-hidden="true">&raquo;</span>
						                            </a>
						                        </li>
						                    </ul>
						                </nav>
						                <!-- 페이지 네이션 끝 -->
								<div style="padding-top: 50px; padding-bottom: 50px;"></div> 
                            </div>
                            
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
 
 
 	$(function(){ 
 		$('#color').on('selected', function() {
 			
 			var option =  $('#color', )
 			
 			
 		});
 	});
 
</script>






<%@ include file ="..//common/footer.jsp" %>

</body>
</html>