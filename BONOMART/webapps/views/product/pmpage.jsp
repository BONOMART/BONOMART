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
	
	<%@ include file="../common/footer.jsp" %>
	
	
	<script>
	
	
	
	
	
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
			})
		})
	
	
		function addtable() {
			innerHtml = '';
		
			
			var scode = $('#scode').val()
			var gname = $('#gname option:selected').text()
			var gcode = $('#gname option:selected').val()
			var pname = $('#pname').val()
			var minnum = $('#minnum').val()
			var ingo = $('#ingo').val()
			var outgo = $('#outgo').val()
			
			  if (scode == "" || gcode == "" || pname == "" || minnum == "" || ingo =="" || outgo == "" )  {
		            alert("입력 값 넣어주세요 ")
		        } else {
			
			
			
		    	innerHtml = "<tr> <td> " + scode + " </td> " 
		        innerHtml += " <td> " + gname + " </td> " 
		        innerHtml += " <td> " + pname + " </td> " 
		        innerHtml += " <td> " + minnum + " </td> " 
		        innerHtml += " <td> " + ingo + " </td>  "
		        innerHtml += " <td> " + outgo + " </td> <tr>"
		        
		        $('#inputval').append(innerHtml);
		        
		        $('input').val("")
		        $('select').find('option:first').attr('selected', 'selected');
		        }
			$("#inputval tr:last-child").remove();
		}
			
		
		$(function() {
		       $("#submit").click(function() { 
		           var list = [] ; 
		    	   var Arraydata = [];
		          

		           $('#inputval tr').each(function(){
		               Arraydata={
		                   "p_no" : $(this).find('td:eq(0)').text()
		                   , "g_code" : $(this).find('td:eq(1)').text()
		                   , "p_name" : $(this).find('td:eq(2)').text()
		                   , "min_quan" : $(this).find('td:eq(3)').text()
		                   , "r_price" : $(this).find('td:eq(4)').text()
		                   , "s_price" : $(this).find('td:eq(5)').text()
		                   	
		               }    
		               list.push(Arraydata)
		           }); 
		     
		          
		           jQuery.ajaxSettings.traditional = true;
		            $.ajax({
		                contentType:"application/json",
		                type:"POST",
		                data: JSON.stringify(list),
		                url:"/bono/product.in",
		                success:function(data){
								location.href = "../product/pmList.jsp"
		                }
		                
		            })
		       });
		   });
		
		
	
	</script>
</body>
</html>