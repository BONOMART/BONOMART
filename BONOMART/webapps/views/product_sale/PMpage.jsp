<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../../assets/css/PMpage.css" />
<link rel="stylesheet" href="../../assets/css/header.css" />


</head>

<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="inner">
		<div class="wrapper">
			<div class="container sub-contents">
				<h3>상품관리</h3>
	
				<!-- 상품등록을 위한 폼 -->
				<div class="product_select">
					<form action="" type="POST">	
						<div class="select">
							<div class="item">
								<div>
									상품코드
									<div class="col-sm-8">
										<input type="text" class="form-control">
									</div>
								</div>
								<div>
									그룹명 &nbsp;
									<div class="col-sm-8">
										<input type="text" class="form-control">
									</div>
								</div>
								<div>
									상품명 &nbsp;
									<div class="col-sm-8">
										<input type="text" class="form-control">
									</div>
								</div>
							</div>
	
							<div class="item" id="ss">
								<div>
									상품수량
									<div class="col-sm-8">
										<input type="number" class="form-control">
									</div>
								</div>
								<div>
									입고단가
									<div class="col-sm-8">
										<input type="number" class="form-control">
									</div>
								</div>
								<div>
									출고단가
									<div class="col-sm-8">
										<input type="number" class="form-control">
									</div>
								</div>
							</div>
	
							<div class="item">
								<textarea class="form-control col-md-10" rows="6"
									placeholder="제품 스펙을 입력해주세요."></textarea>
							</div>
						</div>
					</form>
	
					<!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
					<div class="plus_btn">
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
				<div class="scrollable">
					<table class="table table-hover text-center">
	
						<thead>
							<tr>
								<th>#</th>
								<th>상품코드</th>
								<th>그룹명</th>
								<th>상품명</th>
								<th>상품수량</th>
								<th>입고단가</th>
								<th>출고단가</th>
							</tr>
						</thead>
	
						<tbody>
							<tr>
								<td>1</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>2</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>3</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>4</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>5</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>6</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>7</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
							<tr>
								<td>8</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>LG-327</td>
								<td>33</td>
								<td>400</td>
								<td>500</td>
							</tr>
	
						</tbody>
	
					</table>
				</div>
	
				<!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
				<div class="final_btn">
					<div class="submit_btn">
						<button type="button" class="btn btn-success">등록하기</button>
					</div>
					
					<div class="modify_btn">
						<button type="button" class="btn btn-warning">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>