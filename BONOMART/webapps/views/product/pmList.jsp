<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
<link rel="stylesheet" href="../../assets/css/pmList.css" />
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <script src="../../assets/js/jquery-3.6.0.min.js"></script>
 
 <style>
 .product_select {
	width: 100%;
	height: 300px;
	background: white;
	border-radius: 30px;
	box-shadow: 1px 1px 1px 1px lightgray;
}

.select {
	height: 220px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.item {
	width: 40%;
	padding: 5px;
	justify-content: center;
	align-items: center;
   
}

.item > div {
	padding: 8px;
	display: flex;
	justify-content: center;
   
}

.item > div > col-sm-8 {
	justify-content: flex-end;
   
}

.item > .form-control {
	resize: none;
}

select {
    width: 100%;
    padding : 8px;
    justify-content: center;

}
#searchbox {
	display: inline-block;
	width : 25%;
}
#keyword {
	height: 41px;
}
 </style>   
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<div class="innder">
		<div class="wrapper">
			
			<div class="container sub-contents">
				<h3>상품조회</h3>
				
				<!-- 상품 검색 -->
				<div class="input-group" id="search_pd">
				<select name="" id="searchbox">
						
						<option value="P_NO">상품코드</option>
						<option value="C_NAME">거래처</option>
						<option value="P_NAME">상품명</option>
						<option value="G_NAME">그룹명</option>
				</select>
					<input type="text" class="form-control" id="keyword">
					<div class="input-group-append">
						<button type="button" class="btn btn-primary"  onclick="searchBt()"">검색하기</button>
					</div>
				</div>
				
				<div class="product_search_list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>거래처</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>최소수량</th>
								<th>입고단가</th>
								<th>출고단가</th>
								<th>그룹명</th>
							</tr>
						</thead>
						
						<tbody id ="plist">
							
							
						</tbody>
					</table>
					
					<div id="paging_area">
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	
		<!-- 모달창-->
	  <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                        
                <div class="modal-header">
                    <h5 class="modal-title">등록상품 수정</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                            
                <div class="modal-body">
                   <form action="" type="POST">	
						<div class="select">
							<div class="item">
								<div>
									상품코드
									<div class="col-sm-8">
										<input type="text" class="form-control input_value" id="lscode" readonly>
									</div>
								</div>
								<div>
									그룹명 &nbsp;
									<div class="col-sm-8">
										<select name="" id="gname">
											<option value="">그룹명</option>
										</select>
									</div>
								</div>
								<div>
									상품명 &nbsp;
									<div class="col-sm-8">
										<input type="text" class="form-control input_value" id="lpname">
									</div>
								</div>
                                <div>
									거래처 &nbsp;
									<div class="col-sm-8">
										<select name="" id="cname">
											<option value="">거래처</option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="item" id="ss">
								<div>
									최소수량
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="lminnum">
									</div>
								</div>
								<div>
									입고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="lingo">
									</div>
								</div>
								<div>
									출고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="loutgo">
									</div>
								</div>
								
							</div>
						</div>
					</form>
                </div>
                            
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"
                    onclick="modalComBtn()" >수정</button>
                    <button type="button" class="btn btn-primary"
                    onclick="modalDelBtn()" style="background:red;">삭제</button>
                    <button type="button" class="btn btn-secondary"
                    data-dismiss="modal">취소</button>
                </div>
                                
            </div>
        </div>
    </div>
   </div>
	<%@include file="../common/footer.jsp" %>
	
	


		
		
		
<script>
	
	// 상품조회 리스트
	$(function(){
		$.ajax({
			url : '/bono/product.li',
			type : 'get',
			success : function(data) {
				for (var i in data) {
					
					var innerHtml = ""
					var b = Number(i)+1
				    innerHtml = "<tr> <td> " +(b) + "</td>" 
			        innerHtml += "<td>" +  data[i].c_name  + "</td>" 
			        innerHtml += "<td>" + data[i].p_no  + "</td>" 
			        innerHtml += "<td>" + data[i].p_name  + "</td>"
			        innerHtml += "<td>" + data[i].min_quan  + "</td>"
			        innerHtml += "<td>" + data[i].r_price  + "</td>"
			        innerHtml += "<td>" + data[i].s_price  + "</td>"
			        innerHtml += "<td>" + data[i].g_name + "</td></tr>"
			       
			        $("#plist").append(innerHtml);			         
				}
				
				$.ajax({
					url : '/bono/product.gr',
					type : 'get',
					success : function(data) {
						console.log(data)
						for (var i in data) {
							var innerHtml = '' ;
							
						innerHtml = "<option value="+data[i].g_code+">"
						innerHtml +=data[i].g_name+"</option>"
							
							$("#gname").append(innerHtml);
						}
					}
				});
				
			$.ajax({
				url : '/bono/product.cl',
				type : 'get',
				success : function(data) {
					console.log(data)
					for (var i in data) {
						var innerHtml = '' ;
						
						innerHtml = "<option value="+data[i].c_no+">"
						innerHtml +=data[i].c_name+"</option>"
							
							$("#cname").append(innerHtml);
					}
				}
			});
				
				  $("#plist tr").on('click', function() {
					  $.ajax({
						  url :'/bono/product.mo',
						  type : "get",
						  data : {
							 p_no : $(this).find('td:eq(2)').text()
						  }, success : function(data){
							  console.log(data)
							  $("#lscode").val(data.p_no)
							  $("#lpname").val(data.p_name)
							  $("#lminnum").val(data.min_quan)
							  $("#lingo").val(data.r_price)
							  $("#loutgo").val(data.s_price)
							  $('#gname').find('option:selected').text(data.g_name)
							  $('#cname').find('option:selected').text(data.c_name)
							  
							  $("#myModal").modal();
						  }  
					  }) 	
			         });
			         
			    $('#searchBtn').on('click', function(){
			    	$.ajax({
			    		url : '/bono/product.se',
			    		type : 'get',
			    		data : {
			    			p_no : $('#keyword').val()
			    		}, success : function(data){
			    			
			    		}
			    	})
			    });             
			}
		});	
	})
	
	
	// 모달로 수정기능			
	function modalComBtn() {
		
			var list = [] ; 
			var Arraydata = {};
					          
			 $('.select').each(function(){
					 Arraydata={
				 	    "p_no" : $(this).find('input:eq(0)').val()
				  	   , "p_name" : $(this).find('input:eq(1)').val()
				   	   , "min_quan" : $(this).find('input:eq(2)').val()
				  	   , "r_price" : $(this).find('input:eq(3)').val()
			  		   , "s_price" : $(this).find('input:eq(4)').val()
				  	   ,"g_name" : $("#gname").find("option:selected").text()
				 	    ,"c_name" : $("#cname").find("option:selected").text()			    					                   	
				        }    
				 
						 list.push(Arraydata)
			   }); 
					        
			   jQuery.ajaxSettings.traditional = true;
				 $.ajax({
				  //contentType:"application/json",
						   	   type:"POST",
						       data: {'list' : JSON.stringify(list) },
						       url:"/bono/product.up",
						        success:function(data){
											location.href = "../product/pmList.jsp"
											 $("#myModal").modal();
						     	}		                
				  });
				};
				
	// 모달로 삭제기능
	function modalDelBtn() {
	 	$.ajax({
	  	    url : "/bono/product.de",              
	  	     type : "get",                       
	  	     data : {                            
	     	        	  p_no : $('#lscode').val()  
		       }, success : function (data) {       
		            	location.href = "../product/pmList.jsp"
	 	         }
	 	   });           
 	};
 
	// 검색기능
	function searchBt() {
		
		$("#plist tr").remove()
		
		 $.ajax({
	    			url : '/bono/product.se',
	    			type : 'get',
	    			data : {
	    						p_no : $('#keyword').val(),
	    						select : $('#searchbox').find("option:selected").val()
	    			}, success : function(data){
	    			console.log(data)
	    						for (var i in data) {
						
								var innerHtml = ""
								var b = Number(i)+1
							
					   			 innerHtml = "<tr> <td> " +(b) + "</td>" 
				    	  		 innerHtml += "<td>" +  data[i].c_name  + "</td>" 
				     	 	 	 innerHtml += "<td>" + data[i].p_no  + "</td>" 
				    	  		 innerHtml += "<td>" + data[i].p_name  + "</td>"
				    		     innerHtml += "<td>" + data[i].min_quan  + "</td>"
				    	 	  	 innerHtml += "<td>" + data[i].r_price  + "</td>"
				    	 	  	 innerHtml += "<td>" + data[i].s_price  + "</td>"
				  	 	  	 	 innerHtml += "<td>" + data[i].g_name + "</td></tr>"
				       
				     			  $("#plist").append(innerHtml);
				         
						}
	    				  $("#plist tr").on('click', function() {
							  $.ajax({
								  url :'/bono/product.mo',
								  type : "get",
								  data : {
											 p_no : $(this).find('td:eq(2)').text()
								  }, success : function(data){
								  
								 
									  $("#lscode").val(data.p_no)
									  $("#lpname").val(data.p_name)
									  $("#lminnum").val(data.min_quan)
									  $("#lingo").val(data.r_price)
									  $("#loutgo").val(data.s_price)
									  $('#gname').find('option:selected').text(data.g_name)
									  $('#cname').find('option:selected').text(data.c_name)
								  
									  $("#myModal").modal();
								  }  
							  });       	
					         })   
	    			}			
	   	 	});   
		};

	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</body>
</html>