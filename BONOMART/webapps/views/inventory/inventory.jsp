<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/inventory.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body style= "background: whitesmoke;">

<%@ include file ="../common/header.jsp" %>


    <div id="graph">
                            <div id="serach">
                              <h2> 재고 관리 </h2>
                            </div> 
							 <hr />
                            <div id = member >
                                  <form action=""> 
                                    <div id="field2">
                                   
										<div id="select_box">
									    		<label for="color">항목선택 &nbsp; &nbsp;
									    				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
  													 <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
													</svg>
									    		</label>
									    			<select id="color" title="select color">
									     		  <option selected="selected">항목선택</option>
									      		  <option value="">상품코드</option>
									      		  <option>그룹명</option>
									      		  <option>상품명</option>
									      		  <option>거래처명</option>
									  		  </select>
											</div>
											<div id="text1"> &nbsp;<input type="text"  size="50"/>    &nbsp; &nbsp;
											<button type="button" class="btn btn-primary">조 회</button>
											</div>

									      </div>                                
                                    </form>
                                       	
                                    <div id="table2">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                           <tr>
                                              <th>#</th>
                                                <th>상품코드</th>
                                                <th>그룹명</th>
                                                <th>상품명</th>
                                                	<th>거래처명</th>
                                                <th>현재수량</th>
                                                <th>입출고수량</th>
                                                <th>수정</th>
                                           </tr>
                                           <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
                                           </tr>
                                        
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>LG-327</td>
                                                <td>모니터</td>
                                                <td>LG-327</td>
                                                	<td> 엘 지 </td>
                                                <td>33</td>
                                                <td><input type="number"></td>
                                                <td> <button type="button" class="btn btn-success"> 수 &nbsp; 정 </button> </td>
  
                                            </tr>
                                            
 
                                            

                                          
                                          
                                         </table>
                                                            
									</div>
									
								</div>
									 <!-- 게시판 영역과 page nation 영역 사이 공간 -->

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