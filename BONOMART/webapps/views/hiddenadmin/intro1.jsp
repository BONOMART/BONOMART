<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/admin.css" />
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>

<%@ include file ="../common/header.jsp" %>

    <div id="graph">
                            <div id="serach">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                </svg>
                                회원 관리
                            </div> 
                            <hr>

                            <div id = member >
                                <form action="">
                                    <div id="field2">
                                   
                                     이 름 &nbsp;&nbsp;&nbsp; <input type="text"> &nbsp;&nbsp;&nbsp;
                                     아이디 &nbsp;&nbsp;&nbsp; <input type="text"> &nbsp;&nbsp;&nbsp;
                                     회원번호 &nbsp;&nbsp; <input type="text">  &nbsp;&nbsp;&nbsp;&nbsp;
                                     <button type="button" class="btn btn-primary"> 검 &nbsp; 색 </button> 
                                    </div>
                                    </form> 
                                    <div id="table2">
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




<%@ include file ="..//common/footer.jsp" %>

</body>
</html>