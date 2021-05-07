<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/pmpage.css" />
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
</style>







</head>

<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="inner">
		<div class="wrapper">
			<div class="container sub-contents">
				<h3>상품 등록</h3>
	
				<!-- 상품등록을 위한 폼 -->
				<div class="product_select">
					<form action="" type="POST">	
						<div class="select">
							<div class="item">
								<div>
									상품코드
									<div class="col-sm-8">
										<input type="text" class="form-control input_value" id="scode">
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
										<input type="text" class="form-control input_value" id="pname">
									</div>
								</div>
							</div>
							
	
							<div class="item" id="ss">
								<div>
									최소수량
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="minnum">
									</div>
								</div>
								<div>
									입고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="ingo">
									</div>
								</div>
								<div>
									출고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0" id="outgo">
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
						</div>
					</form>
	
					<!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
					<div class="plus_btn">
	
						<!-- 등록버튼 -->
						<div class="plus">
							<button type="button" class="btn btn-primary"  onclick="addtable()">추가하기</button>
						</div>
					</div>
				</div>
				
				<!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
				<div class="scrollable">
					<table class="table table-hover text-center">
	
						<thead>
							<tr data-target="#listmodal" data-toggle="modal" id="sorter">
								<th>상품코드</th>
								<th>그룹명</th>
								<th>상품명</th>
								<th>최소수량</th>
								<th>입고단가</th>
								<th>출고단가</th>
								<th>거래처</th>
							</tr>
						</thead>
	
						<tbody id="inputval">
					
						</tbody>
	
					</table>				
				</div>
				
				<!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
			<div class="final_btn">
				<div class="submit_btn">
					<button type="button" class="btn btn-success" id="submit">등록하기</button>
				</div>				
			</div>
		</div>
	</div>
	
	
	<!-- 모달창  -->
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
										<input type="text" class="form-control input_value" id="lscode"  readonly>
									</div>
								</div>
								<div>
									그룹명 &nbsp;
									<div class="col-sm-8">
										<select name="" id="lgname">
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
										<select name="" id="lcname">
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
                    onclick="modalComBtn()" >등록</button>
                    <button type="button" class="btn btn-primary"
                    onclick="modalDelBtn()" style="background:red;">삭제</button>
                    <button type="button" class="btn btn-secondary"
                    data-dismiss="modal">취소</button>
                </div>
                                
            </div>
        </div>
    </div>
				
	<%@ include file="../common/footer.jsp" %>
	
	
<script>

		// 상품등록 그룹명 
		$(function(){
			$.ajax({
				url : '/bono/product.gr',
				type : 'get',
				success : function(data) {
					for (var i in data) {
						
						var innerHtml = '' ;
						
					innerHtml = "<option value="+data[i].g_code+">"
					innerHtml +=data[i].g_name+"</option>"
						
						$("#gname").append(innerHtml);
					}
				}
			});
		});

		// 상품등록 거래처명
		$(function(){
			$.ajax({
				url : '/bono/product.cl',
				type : 'get',
				success : function(data) {
				
					for (var i in data) {
						
						var innerHtml = '' ;
						
						innerHtml = "<option value="+data[i].c_no+">"
						innerHtml +=data[i].c_name+"</option>"
							
							$("#cname").append(innerHtml);
					}
				}
			});
		});
	
	
	// 추가하기 버튼
	function addtable() {
	
			innerHtml = '';
 
			var scode = $('#scode').val()
			var gname = $('#gname option:selected').text()
			var gcode = $('#gname option:selected').val()
			var cname = $('#cname option:selected').text()
			var ccode = $('#cname option:selected').val()
			var pname = $('#pname').val()
			var minnum = $('#minnum').val()
			var ingo = $('#ingo').val()
			var outgo = $('#outgo').val()
				
			// 하나라도 빈 값이 있으면 알림 창 뜨기
			 if (cname == "" || scode == "" || gcode == "" || pname == "" || minnum == "" || ingo =="" || outgo == "" )  {
				 
		       	    alert("입력 값 넣어주세요 ")
		       	    
		     // 빈 값이 없다면  	    
		     } else if  (cname != "" || scode != "" || gcode != "" || pname != "" || minnum != "" || ingo !="" || outgo != ""){
			
		    	 
		    	 
		    	 if(scode==$('#inputval tr').find('td:eq(0)').text()) {
		    		 alert("상품코드 : " + scode + " 이(가) 이미 추가 돼 있습니다")
		    	 } else if (scode!=$('#inputval tr').find('td:eq(0)').text()){
			    			 innerHtml = "<tr><td>" + scode + "</td>" 
			      			 innerHtml += "<td>" + gname + "</td>" 
		     				 innerHtml += "<td>" + pname + "</td>" 
			       	 		 innerHtml += "<td>" + minnum + "</td>" 
			    			 innerHtml += "<td>" + ingo + "</td>"
		   		  	 		 innerHtml += "<td>" + outgo + "</td>"
		   	  	  		 	 innerHtml += "<td>" + cname + "</td></tr> "
		   
		        
		    					$('#inputval').append(innerHtml);
		   	  	  		 
		   	  				  	//  추가버튼 누르고 입력 창에 값 초기화
			    				$('input').val("")
			    	        	$('select').find('option:first').attr('selected', 'selected');
		    	 }
		    	 
		        }
			
			
		
			
			
			
			// 추가된 테이블 클릭 시 모달창 
			$("#inputval tr").on('click', function(){
				
				 $("#lscode").val($(this).find("td:eq(0)").text())
				 $("#lpname").val($(this).find("td:eq(2)").text())
				 $("#lminnum").val(Number($(this).find("td:eq(3)").text()))
				 $("#lingo").val(Number($(this).find("td:eq(4)").text()))
				 $("#loutgo").val(Number($(this).find("td:eq(5)").text()))
				 $('#lgname').find('option:selected').text($(this).find("td:eq(1)").text())
				 $('#lcname').find('option:selected').text($(this).find("td:eq(6)").text())
				 $("#myModal").modal();
				   
			 })	
		}
			
		
	 // 모달창 안에 테이블 값 넣어주기
	 $(function(){
			$.ajax({
				url : '/bono/product.cl',
				type : 'get',
				success : function(data) {
					
					for (var i in data) {
						
						var innerHtml = '' ;
						
						innerHtml = "<option value="+data[i].c_no+">"
						innerHtml +=data[i].c_name+"</option>"
							
						$("#lcname").append(innerHtml);
					}
					
						$.ajax({
							url : '/bono/product.gr',
							type : 'get',
							success : function(data) {
						
								for (var i in data) {
									var innerHtml = '' ;
									
								innerHtml = "<option value="+data[i].g_code+">"
								innerHtml +=data[i].g_name+"</option>"
									
									$("#lgname").append(innerHtml);
								}
				
								  	
								  $("#inputval tr").on('click', function(){
									  
									   	$("#lscode").val($(this).find("td:eq(0)").text())
										$("#lpname").val($(this).find("td:eq(2)").text())
										$("#lminnum").val(Number($(this).find("td:eq(3)").text()))
										$("#lingo").val(Number($(this).find("td:eq(4)").text()))
										$("#loutgo").val(Number($(this).find("td:eq(5)").text()))
									    $('#lgname').find('option:selected').text($(this).find("td:eq(1)").text())
										$('#lcname').find('option:selected').text($(this).find("td:eq(6)").text())
										
										$("#myModal").modal();   	
								 })
							}
						});
				}
			});
		});
		
		// 추가 된 테이블 내용 DB에 등록하기
		$(function() {
		       $("#submit").click(function() { 
		    		   
		           var list = [] ; 
		    	   var Arraydata = {};
		          
		           $('#inputval tr').each(function(){
		               Arraydata={
		                   "p_no" : ($(this).find('td:eq(0)').text()).trim()
		                   , "g_code" : ($(this).find('td:eq(1)').text()).trim()
		                   , "p_name" : ($(this).find('td:eq(2)').text()).trim()
		                   , "min_quan" : ($(this).find('td:eq(3)').text()).trim()
		                   , "r_price" :($(this).find('td:eq(4)').text()).trim()
		                   , "s_price" : ($(this).find('td:eq(5)').text()).trim()
		                   , "c_no" : ($(this).find('td:eq(6)').text()).trim()
		                   	
		               };
		               
		               list.push(Arraydata);
		           }); 
		           
		           jQuery.ajaxSettings.traditional = true;
		            $.ajax({
		                // contentType:"application/json",
		                type:"POST",
		                data: { 'list' : JSON.stringify(list) },
		                url:"/bono/product.in",
		                success:function(data){
		                	
		                	if(data == 0){
		                		  alert("이미 존재하는 상품코드가 있습니다")
		                	}else if (data >0) {
									location.href = "../product/pmList.jsp"
		                	} else if (data > 0 || data == 0 ) {
		                		 alert("이미 존재하는 상품코드가 있습니다. ")
		                	}
		                }
		            });
		       });
		   });
	
	
	
	// 모달창으로 클릭 한 테이블 내용 수정하기
	function modalComBtn() {
		
			var b = ($("#lscode").val()).trim()
		
			for (var i = 0; i <("#inputval tr").length; i++){
				
				 if(($("#inputval tr:eq("+ i +')').find('td:eq(0)').text()).trim() == b){
		
					  $('#inputval tr:eq('+i+')').find("td:eq(0)").text($("#lscode").val())
					  $('#inputval tr:eq('+i+')').find("td:eq(1)").text($('#lgname').find('option:selected').text())
					  $('#inputval tr:eq('+i+')').find("td:eq(2)").text($("#lpname").val())
					  $('#inputval tr:eq('+i+')').find("td:eq(3)").text($("#lminnum").val())
					  $('#inputval tr:eq('+i+')').find("td:eq(4)").text($("#lingo").val())
					  $('#inputval tr:eq('+i+')').find("td:eq(5)").text($("#loutgo").val())
					  $('#inputval tr:eq('+i+')').find("td:eq(6)").text($('#lcname').find('option:selected').text())
			  
			}
				
		}	  
		   $('#myModal').modal("hide");
	}
	


	
	// 모달창으로 클릭 한 테이블 삭제하기
	function modalDelBtn() {
			var a =($("#inputval tr:eq(0)").find('td:eq(2)').text()).trim()
			var b = ($("#lpname").val()).trim()
		
			for (var i = 0; i <("#inputval tr").length; i++){
				if(($("#inputval tr:eq("+ i +')').find('td:eq(2)').text()).trim() == b)
					$("#inputval tr:eq("+i + ')' ).remove()
		}
		$('#myModal').modal("hide");
	}
	
	</script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</body>
</html>