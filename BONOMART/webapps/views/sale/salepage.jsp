<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../../assets/css/salepage.css" />
<link rel="stylesheet" href="/bono/assets/css/header.css" />

</head>

<body>
	<%@ include file="../common/header.jsp" %>
		
	<div class="inner">
		<div class="wrapper">
			<div class="container sub-contents">
				<h3>판매등록</h3>
				
				<!-- 판매등록을 위한 폼 -->
				<div class="sale_select">
					<form action="" type="POST">
						<div class="select">				
							<div>
								판매일자 
								<div class="col-sm-3"><input type="date" class="form-control"></div>
							</div>
							
							<div>
								상품코드 <div class="col-sm-3"><input type="text" class="form-control" /></div>
							</div>
							
							<div>
								판매수량 <div class="col-sm-3"><input type="number" class="form-control" /></div>
							</div>
						</div>
					</form>
					
					<!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
					<div class="submit_btn">
						<!-- 검색버튼 -->
						<div class="search">
							<button type="button" class="btn btn-secondary">검색하기</button>						
						</div>
						
						<!-- 등록버튼 -->
						<div class="plus">
							<button type="button" class="btn btn-primary">추가하기</button>
						</div>
						
					</div>
					
				</div>
				
				<p></p>
				
				<!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
				<div class="product_list">
					<table class="table table-hover">
					
						<thead>
							<tr>
								<th>#</th>
								<th>판매일자</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>판매수량</th>
								<th>총 판매금액</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>1</td>
								<td>2021-04-02</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>2</td>
								<td>2021-04-04</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>3</td>
								<td>2021-04-06</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>4</td>
								<td>2021-04-07</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>5</td>
								<td>2021-04-12</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>6</td>
								<td>2021-04-13</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>7</td>
								<td>2021-04-15</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
							
							<tr>
								<td>8</td>
								<td>2021-04-18</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>12000</td>
							</tr>
						</tbody>
						
					</table>
				</div>
				
				<!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
				<div class="final_btn">
					<div class="submit_btn">
						<button type="button" class="btn btn-success">등록하기</button>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>