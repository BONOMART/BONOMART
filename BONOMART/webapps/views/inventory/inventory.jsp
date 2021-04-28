<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/inventory.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>

<%@ include file ="../common/header.jsp" %>

  <div id="graph">
                        <div class="wrapper">
                            <div class="container sub-contents">
                                <div id="serach">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30 " fill="currentColor" class="bi bi-basket2-fill" viewBox="0 0 16 16">
                                        <path d="M5.929 1.757a.5.5 0 1 0-.858-.514L2.217 6H.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h.623l1.844 6.456A.75.75 0 0 0 3.69 15h8.622a.75.75 0 0 0 .722-.544L14.877 8h.623a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1.717L10.93 1.243a.5.5 0 1 0-.858.514L12.617 6H3.383L5.93 1.757zM4 10a1 1 0 0 1 2 0v2a1 1 0 1 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 1 1-2 0v-2zm4-1a1 1 0 0 1 1 1v2a1 1 0 1 1-2 0v-2a1 1 0 0 1 1-1z"/>
                                    </svg>
                                    재고 관리
                                </div> 
                                <!-- 상품등록을 위한 폼 -->
                                <div class="product_select">
                                    <form action="" type="POST">
                                        <div class="select">
                                            <div class="item">
                                                <div>
                                                    그룹명 &nbsp; <div class="col-sm-8"><input type="text" class="form-control"></div>
                                                </div>
                                                <div>
                                                    상품명 &nbsp; <div class="col-sm-8"><input type="text" class="form-control"></div>
                                                </div>
                                            </div>
                                            
                                            <div class="item" id="ss">
                                                <div>
                                                    거래처명 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                                </div>
                                                <div>
                                                    상품코드 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <textarea class="form-control col-md-10" rows="6" placeholder="제품 스펙을 입력해주세요."></textarea>
                                            </div>
                                        				
                                        </div>
                                    </form>
                                    
                                    <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                                    <div class="submit_btn">
                                        <!-- 검색버튼 -->
                                        <div class="plus">
                                            <button type="button" class="btn btn-primary">검색 하기</button>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                
                                <p></p>
                                
                                <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                                <div class="scrollable">
                                    <table class="table table-hover text-center">
                                    
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>상품코드</th>
                                                <th>그룹명</th>
                                                <th>상품명</th>
                                                <th>현재수량</th>
                                                <th>입출고수량</th>
                                                <th>수정</th>

                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                        </tbody>
                                        
                                    </table>
                                </div>
                                
                            
                                </div>
                            </div>	
                        </div>




<%@ include file ="../common/footer.jsp" %>

</body>
</html>