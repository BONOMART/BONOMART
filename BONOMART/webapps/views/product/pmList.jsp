<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../../assets/css/pmList.css" />
<link rel="stylesheet" href="../../assets/css/header.css" />
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<div class="innder">
		<div class="wrapper">
			
			<div class="container sub-contents">
				<h3>상품조회</h3>
				
				<!-- 상품 검색 -->
				<div class="input-group" id="search_pd">
					<input type="text" class="form-control">
					<div class="input-group-append">
						<button type="button" class="btn btn-primary">검색하기</button>
					</div>
				</div>
				
				<div class="product_search_list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>등록일자</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>상품수량</th>
								<th>입고단가</th>
								<th>출고단가</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>1</td>
								<td>2021-04-02</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>2</td>
								<td>2021-04-04</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>3</td>
								<td>2021-04-06</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>4</td>
								<td>2021-04-07</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>5</td>
								<td>2021-04-12</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>6</td>
								<td>2021-04-13</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>7</td>
								<td>2021-04-15</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
							</tr>
							
							<tr>
								<td>8</td>
								<td>2021-04-18</td>
								<td>LG-327</td>
								<td>모니터</td>
								<td>30</td>
								<td>400</td>
								<td>500</td>
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