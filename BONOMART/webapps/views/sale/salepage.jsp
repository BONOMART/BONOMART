<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<link rel="stylesheet" href="/bono/assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/salepage.css" />

<style>
	#iconArea {
		display: none;
	}
	
	svg:hover {
		cursor: pointer;
	}
</style>

</head>

<body>
	<%@ include file="../common/header.jsp" %>
		
	<div class="inner">
		<div class="wrapper">
			<div class="container sub-contents">
				<h3>판매 등록</h3>
				
				<!-- 판매등록을 위한 폼 -->
				<div class="sale_select">
						<div class="select">				
							<div>
								판매일자 
								<div class="col-sm-3"><input type="date" id="s_date" class="form-control"></div>
							
							
								상품코드 <div class="col-sm-3">
											<select id="p_no" class="form-control">
												<option value="">선택</option>
											</select>
									   </div>
							
							
								판매수량 <div class="col-sm-3"><input type="number" id="s_quan" class="form-control" /></div>
							</div>	
						</div>
						
					
					<!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
					<div class="submit_btn">
						<!-- 등록버튼 -->
						<div class="plus">
							<button type="button" onclick="insertTable()" class="btn btn-primary">추가하기</button>
						</div>
						
					</div>
					
				</div>
				
				<p></p>
				
				<!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
				<div class="sale_list">
				<form id="insertForm" action="/bono/insert.sa" method="post">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>판매일자</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>판매수량</th>
								<th>총 판매금액</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
					
						<tbody id="table">	
						
						</tbody>					
					</table>
				</form>
				</div>
				
				<div id="iconArea">
					<svg class="updateTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  						<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
					</svg>
					<svg class="deleteTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>	
								
				</div>
				
				<!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
				<div class="final_btn">
					<div class="submit_btn">
						<button type="button" id="insertSubmit" class="btn btn-success">등록하기</button>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 전역변수 선언
		var tno = 1;
		var arr = [];
		
		var pList = [];
		
		// 추가한 내용을 임시공간에 담는 함수
		function insertTable() {
			
 			var result = "";
			
 			// 입력받은 값
		    var sdate = $("#s_date").val();
	        var pno = $("#p_no").val();
	        var squan = $("#s_quan").val();

	        if (sdate == "" || pno == "" || squan == "") {
	            alert("입력 값 넣어주세요 ");
	            
	        } else {
	        	
	        	result = "<tr id='data'> <td>" + ( tno++ ) + "</td>"
	        	       + "<td id='s_date'>" + sdate + "</td>"
	        	       + "<td id='p_no'>" + pno + "</td>";
	        	
	        	// 입력받은 상품코드를 보내서 DB의 상품명과 출고단가를 꺼내서 전역변수 배열에 담기
	        	$.ajax({
					url : "/bono/space.sa",
					type : "post",
					async : false,
					data : { p_no : $('#p_no').val() },
					success : function(data) {
					
						for(var i in data) {
						
							arr[i] = data[i];
							
						}
					
					}, error : function(error) {
						console.log("상품정보 에러발생");
					}
				});
	        	
	        	var pname = arr[0];
	        	var price = squan*arr[1];
	        	
	        	result += "<td>" + pname + "</td>"
	        	        + "<td id='s_quan'>" + squan + "</td>"
	        	        + "<td>" + price + "</td>"
	        	        + "<td>" + $('#iconArea').html() + "</td> </tr>";
	        	       
	        	$('#table').append(result);
	        	
	        	// 휴지통 클릭 시 삭제
	        	$('svg.deleteTr').on('click',function() {
					$(this).parent().parent().remove();
				});
	        }
			
		}
		
		
		
		// 상품 코드 전체를 DB에서 받아서 option태그로 추가하기
		$(function() {
			$.ajax({
				url : "/bono/selectPno.sa",
				type : "post",
				success : function(data) {
					
					for ( var i in data ) {
						$('select#p_no').append("<option value=" + data[i] + ">" + data[i] + "</option>");
					}
				}, error : function(error) {
					console.log("상품코드를 받을 수 없습니다.");
				}
					
			
			});
		});
		
		// 연필 클릭 시 table tr 내용 수정
		$(function() {
//			$(this).$('#squan').html("<input type='number' name='' id='' />");
		});
		
		// 등록하기 버튼 클릭 시 name 속성 이름 바꿔서 submit하기 
		$(function() {
			$('#insertSubmit').on('click', function() {
				
				var jsonData = {};
				
				for ( var n = 1 ; n <= $('#table tr').length ; n++  ) {
					
					eval("jsonData.s_date" + n + " = $('td:eq('+(7*n-6)+')').text();" );
					eval("jsonData.p_no" + n + " = $('td:eq('+(7*n-5)+')').text();" );
					eval("jsonData.s_quan" + n + " = $('td:eq('+(7*n-3)+')').text();" );
				
				}
				
				
				jsonData.len = Object.keys(jsonData).length;
				
				console.log(jsonData);
				
 				$.ajax({
 					url : "/bono/insert.sa",
 					type : "post",
 					data : jsonData,
 					success : function() {},
 					error : function(error) {
 						console.log("상품정보 전송 에러발생");
 					}
 				});
				
				
				
 			$('#insertForm').submit();
		    			
			});
		});
		
		function isNotNull(str) {
			return ( str != '' || str != null ) ? true : false
		}
		
		
		
		
	</script>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>