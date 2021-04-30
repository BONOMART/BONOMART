<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../../assets/css/saleList.css" />
<link rel="stylesheet" href="../../assets/css/header.css" />
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<div class="innder">
		<div class="wrapper">
			
			<div class="container sub-contents">
				<h3>판매조회</h3>
				
				<!-- 판매 검색 -->
				<div class="input-group" id="search_sale">
				  <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
				  <div class="input-group-append">
				  	<button type="button" class="btn btn-primary">검색하기</button>
				    <button type="button" class="btn btn-outline-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				      <span class="sr-only">Toggle Dropdown</span>
				    </button>
					    <div class="dropdown-menu">
					      	<a class="dropdown-item" href="#">판매일자 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
					    	<a class="dropdown-item" href="#">상품코드 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
					    	<a class="dropdown-item" href="#">상품명 정렬</a>
					    	<div role="separator" class="dropdown-divider"></div>
				      		<a class="dropdown-item" href="#">판매수량 정렬</a>
				      		<div role="separator" class="dropdown-divider"></div>
				      		<a class="dropdown-item" href="#">총 판매금액 정렬</a>
				      		<div role="separator" class="dropdown-divider"></div>
						</div>
					</div>
				</div>
				
				<div class="sale_search_list">
					<table class="table table-hover">
					
						<thead>
							<tr>
								<th>판매번호</th>
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
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</body>
</html>