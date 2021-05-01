<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="jquery.tablesort.js"></script>

<link rel="stylesheet" href="../../assets/css/header.css" />
<link rel="stylesheet" href="../../assets/css/pmpage.css" />
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
										<input type="text" class="form-control input_value">
									</div>
								</div>
								<div>
									그룹명 &nbsp;
									<div class="col-sm-8">
										<select name="" id="grn">
											
										</select>
									</div>
								</div>
								<div>
									상품명 &nbsp;
									<div class="col-sm-8">
										<input type="text" class="form-control input_value">
									</div>
								</div>
							</div>
	
							<div class="item" id="ss">
								<div>
									최소수량
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0">
									</div>
								</div>
								<div>
									입고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0">
									</div>
								</div>
								<div>
									출고단가
									<div class="col-sm-8">
										<input type="number" class="form-control input_value" min="0">
									</div>
								</div>
							</div>
						</div>
					</form>
	
					<!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
					<div class="plus_btn">
	
						<!-- 등록버튼 -->
						<div class="plus">
							<button type="button" class="btn btn-primary">추가하기</button>
						</div>
	
					</div>
	
				</div>
				
				<script>

 					$(function() {
						$('.btn-primary').click(function() {
							var input = $('input');
							var inputcheck = $('input').val();

							var tr = $('<tr></tr>');
							
							//상품 정보 input tag 값 널 검사
							for(var i in $('.input_value')) {
								var chk = true;

								//상품 정보 입력 input들 값들 없을 경우 알림창 띄우고 하단 리스트에 추가 x
								if ($('.input_value')[i].value == '' || $('.input_value')[i].value.length == 0) {
									window.alert("정보를 모두 입력해주세요.");
									chk = false;
									return;
								} else { //null이 아닐경우 정보입력 값 행 추가.
									//var td = $('<td></td>').html($(this).val());
									//$('.table').append(td);
								}
								
								console.log(i + " : " + $('.input_value')[i].value); //입력값 콘솔에서 확
								if(chk == false){ break;}

							/* 
							$.each(input, function(i, item) { //row에 input 태그에 값 삽입
							
								if (inputcheck === "") { //input tag null 검사
									//null일 때 삽입 요청 띄우고 데이터 입력 x
									window.alert("정보를 모두 입력해주세요.");
								} else { 
									//null이 아닐 때 데이터 삽입
									var td = $("<td></td>").html($(item).val());
									return false;
								}
								
								$(tr).append(td);
							}); */
							
							
							//td:eq(0).Last()? 
							$('table').append(tr);
							$(input).val("");
						});
					}); 



				</script>
	
				<p></p>
	
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
							</tr>
						</thead>
	
						<tbody>
							<tr>
								<td>LG-327</td>
								<td>본체</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>20</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>cG-327</td>
								<td>가니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>AG-327</td>
								<td>니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>100</td>
								<td>500</td>
							</tr>
	
						</tbody>
	
					</table>	
				
				<!-- <script>
					$(".table tr").on("click", function() {
						var tr = $(this);
						
						console.log("row data => " + tr.text()); //한 줄에 있는 데이터를 다 가져옴.
												
						
						
					});
				</script> -->
				
				<!-- table th click sort -->
				<script>
  					$(function(){
						$('.table').each(function(column){
							$(this).click(function(){
								if($(this).is('.asc')) { //table 속성이 asc라면
									$(this).removeClass('asc'); //asc 클래스 삭제
									$(this).addClass('desc');  //desc 클래스 추가
									sortdir = -1;
								} else { //table 속성이 desc라면
									$(this).addClass('desc');
									$(this).removeClass('asc');
									sortdir = 1;
								}
								$(this).siblings().removeClass('asc'); //선택한 요소의 형제 요소들을 모두 선택해서 asc삭제
								$(this).siblings().removeClass('desc');
								
								var rec = $('table').find('tbody > tr').get(); //행 요소들을 배열에 담아서 가져옴
								rec.sort(function(a,b) { //배열로 가져온 로우들 정렬
									var val1 = $(a).children('td').eq(column).text().toUpperCase(); //로우에 텍스트값들을 모두 대문자로 바꿔준다. 아스키코드가 달라서
									var val2 = $(b).children('td').eq(column).text().toUpperCase(); //숫자 비교값도 있어줘야 함.
									
									return (val1 < val2)?-sortdir:(val1 > val2)?sortdir:0;
								});
								
								$.each(rec, function(index, row) {
									$('tbody').append(row);
								});
							});
						});
					});		
					
				</script>
				</div>
				<!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
			<div class="final_btn">
				<div class="submit_btn">
					<button type="button" class="btn btn-success">등록하기</button>
				</div>				
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>