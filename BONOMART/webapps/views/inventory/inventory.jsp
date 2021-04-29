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
									    		<label for="color">항목선택</label>
									    			<select id="color" title="select color">
									     		  <option selected="selected">항목선택</option>
									      		  <option>상품코드</option>
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