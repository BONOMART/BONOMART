<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/admin.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body style= "background: whitesmoke;">

<%@ include file ="../common/header.jsp" %>


    <div id="graph">
                            <div id="serach">
                              <h3> 회원 관리 </h3> 
                            </div> 

                            <div id = member >
                                  <form action=""> 
                                    <div id="field2">
										<div id="select_box">
									    		<label for="color">항목선택</label>
									    			<select id="color" title="select color">
									     		  <option selected="selected">항목선택</option>
									      		  <option>아이디</option>
									      		  <option>이 름</option>
									      		  <option>회원번호</option>
									  		  </select>
											</div>
											<div id="text1"> &nbsp;<input type="text"  size="50"/>    &nbsp; &nbsp;
											<button type="button" class="btn btn-primary">조 회</button>
											</div>
											
									      </div>                                
                                    </form>
                                
                                
                                
                                
                           <!--      <form action=""> 
                                    <div id="field2">
                                   
                                     이 름 &nbsp;&nbsp;&nbsp; <input type="text"> &nbsp;&nbsp;&nbsp;
                                     아이디 &nbsp;&nbsp;&nbsp; <input type="text"> &nbsp;&nbsp;&nbsp;
                                     회원번호 &nbsp;&nbsp; <input type="text">  &nbsp;&nbsp;&nbsp;&nbsp;
                                     <button type="button" class="btn btn-primary"> 검 &nbsp; 색 </button> 
                                    </div>                                
                                    </form>  -->
                                    	
                                    <div id="table2">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
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
                                               <th> 권한회수 </th>
                                           </tr>
                                           <tr>
                                                <td> No.119 </td>
                                                <td> 김보노 </td>
                                                <td> admin </td>
                                                <td> pass01 </td>
                                                <td> bono@bonomart.com </td>
                                                <td> 010-1234-5678 </td>
                                                <td> 관리자 </td>
                                                <td> 재무부 </td>
                                                <td> <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button></td>
                                                <td><button type="button" class="btn btn-danger"> 회 &nbsp; 수 </button> </td>
                                           </tr>
                                           <tr>
                                            <td> No.119 </td>
                                            <td> 김보노 </td>
                                            <td> admin </td>
                                            <td> pass01 </td>
                                            <td> bono@bonomart.com </td>
                                            <td> 010-1234-5678 </td>
                                            <td> 관리자 </td>
                                            <td> 재무부 </td>
                                            <td> <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button></td>
                                            <td><button type="button" class="btn btn-danger"> 회 &nbsp; 수 </button> </td>
                                           </tr>
                                           <tr>
                                            <td> No.119 </td>
                                            <td> 김보노 </td>
                                            <td> admin </td>
                                            <td> pass01 </td>
                                            <td> bono@bonomart.com </td>
                                            <td> 010-1234-5678 </td>
                                            <td> 관리자 </td>
                                            <td> 재무부 </td>
                                            <td> <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button></td>
                                            <td><button type="button" class="btn btn-danger"> 회 &nbsp; 수 </button> </td>
                                        </tr>
                                         <tr>
                                        <td> No.119 </td>
                                          <td> 김보노 </td>
                                          <td> admin </td>
                                          <td> pass01 </td>
                                          <td> bono@bonomart.com </td>
                                          <td> 010-1234-5678 </td>
                                          <td> 관리자 </td>
                                          <td> 재무부 </td>
                                          <td> <button type="button" class="btn btn-success"> 승 &nbsp; 인 </button></td>
                                          <td><button type="button" class="btn btn-danger"> 회 &nbsp; 수 </button> </td>
                                      </tr>
                                          
                                          
                                         </table>
                                       </div> 
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
 
</script>






<%@ include file ="..//common/footer.jsp" %>

</body>
</html>