<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String p_no = request.getParameter("p_no");
   String c_no = request.getParameter("c_no");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>발주 등록 페이지</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/orderRegister.css">

</head>
<body>
<!-- 헤더 영역 추가  -->
<%@ include file="/views/common/header.jsp" %>
                <!-- 데이터 입력 -->
                <div class="wrapper">
                    <div class="container sub-contents">
                        <h3>발주 등록</h3>

                        <!-- 발주 등록을 위한 폼 -->
                        <div class="product_select">
							<% if(p_no!=null&&c_no!=null) { %>
                            <form action="/bono/insertInsert.do" type="POST">
                                <div class="select">
                                    <div class="item">
                                        <div>
                                            발주상품코드
                                            <div class="col-sm-8">
                                            	<input type="text" class="form-control" id="pno" value="<%=p_no%>">
                                            </div>
                                        </div>
                                        <div>
                                            거래처 코드&nbsp;&nbsp;
                                            <div class="col-sm-8">
                                            	<input type="text" class="form-control" id="cno" value="<%=c_no%>">
                                            </div>
                                        </div>
                                        <div>
                                            담당자명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="text" class="form-control" id="cname" value="<%=m.getUserName()%>"></div>
                                        </div>
                                    </div>

                                    <div class="item" id="ss">
                                        <div>
                                            발주 수량 <div class="col-sm-8"><input type="number" class="form-control" id="oquan"></div>
                                        </div>
                                        <div>
                                            발주 일자 <div class="col-sm-8"><input type="date" class="form-control" id="odate"></div>
                                        </div>
                                        <div>
                                            총 금액&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="number" class="form-control" id="sprice"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                       		<%} else {%>
                       		<form action="/bono/insertInsert.do" type="POST">
                                <div class="select">
                                    <div class="item">
                                        <div>
                                            발주상품코드
                                            <div class="col-sm-8">
                                            	<input type="text" class="form-control" id="pno">
                                            </div>
                                        </div>
                                        <div>
                                            거래처 코드&nbsp;&nbsp;
                                            <div class="col-sm-8">
                                            	<input type="text" class="form-control" id="cno">
                                            </div>
                                        </div>
                                        <div>
                                            담당자명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="text" class="form-control" id="cname" value="<%=m.getUserName()%>"></div>
                                        </div>
                                    </div>

                                    <div class="item" id="ss">
                                        <div>
                                            발주 수량 <div class="col-sm-8"><input type="number" class="form-control" id="oquan"></div>
                                        </div>
                                        <div>
                                            발주 일자 <div class="col-sm-8"><input type="date" class="form-control" id="odate"></div>
                                        </div>
                                        <div>
                                            총 금액&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="number" class="form-control" id="sprice"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>    
                            <%} %>                     

                            <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                            <div class="submit_btn">
                                <!-- 등록버튼 -->
                                <div class="plus">
                                    <button type="button" class="btn btn-primary" onclick="addrow();">추가하기</button>
                                </div>
                            </div>
                        </div>
                        <p></p>

                        <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                        <div class="scrollable">
                        <form action="regtable" action="/bono/insertOrder.do" method="POST"></form>
                            <table class="table table-hover text-center" id="table1">

                                <thead id="checklist">
                                    <tr>
                                        <th>발주상품 코드</th>
                                        <th>거래처 코드</th>
                                        <th>발주 수량</th>
                                        <th>발주 일자</th>
                                        <th>총 금액</th>
                                        <th>담당자명</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>

                                <tbody class="dataBody">
                                   
                                </tbody>

                            </table>
                            </form>
                        </div>
                        
                        <div class="DeleteRow">
                        	<svg class="deleteTr" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>	
                        </div>

                        <!-- 실제 DB에 저장하는 등록버튼 -->
                        <div class="final_btn">
                            <div class="submit_btn">
                                <button type="button" class="btn btn-success" id="submitbtn">등록하기</button>
                            </div>
                        </div>
                    </div>
                    
                    <script>
                    	function addrow() {
                    		var innerHtml = ""
                    		
                    		var pno = $('#pno').val()
                    		var cno = $('#cno').val()
                    		var cname = $('#cname').val()
                    		var oquan = $('#oquan').val()
                    		var odate = $('#odate').val()
                    		var sprice = $('#sprice').val()
                    		
                    		if(pno == "" || cno == "" || cname == "" || oquan == "" || odate == "" || sprice == "") {
                    			alert("정보를 모두 입력해주세요.")
                    		} else {
                    	        innerHtml = "<tr class='dataRow'> <td> " + pno + " </td> " 
                    	        innerHtml += " <td>" + cno + "</td> " 
                    	        innerHtml += " <td>" + oquan + "</td> "
                    	        innerHtml += " <td>" + odate + "</td> "
                    	        innerHtml += " <td>" + sprice + "</td> "
                    	        innerHtml += " <td>" + cname + "</td>"
                    	        innerHtml += " <td class='deleteRow'>" + $('.DeleteRow').html() + "</td> </tr>"

                    	        $("tbody").append(innerHtml);
                    		}
                    	}
                    	
                    	$('#submitbtn').on('click', function() {
                    		var insertlist = [];
                    		var a = {};
                    		
                    		$('.dataRow').each(function() {
                    			a = {
                    				"p_no" : $(this).find('td:eq(0)').text().trim(),
                    				"c_no" : $(this).find('td:eq(1)').text().trim(),
                    				"o_quan" : $(this).find('td:eq(2)').text().trim(),
                    				"o_date" : $(this).find('td:eq(3)').text().trim(),
                    				"s_price" : $(this).find('td:eq(4)').text().trim(),
                    				"m_name" : $(this).find('td:eq(5)').text().trim()
                    			}
                    			
                    			insertlist.push(a);
                    			
                    		});
                    		
                    		for(var i = 0; i <= insertlist.length; i++) {
                    			console.log(insertlist[i]);
                    		}
                    		
                    		$.ajax({
                    			url: '/bono/orderInsert.do',
                    			type: 'POST',
                    			dataType: "json",
                    			data: {
                    				insertlist : JSON.stringify(insertlist),
                    				test: "test"
                    			},
                    			success: function(data) {
                    				console.log(data);
                    				location.href="/bono/order/orderlist.do";
                    			},
                    			error: function(data) {
                    				
                    				if(data < 0 || data == 0) {
                    					alert("정보를 모두 입력해주세요.");
                    				}
                    				console.log(data);
                    			}
                    			
                    		});
                    	});
                    	
                    	$('#table1').on('click', '.deleteTr', function(){
                    		$(this).parent().parent().remove();
                    	});
                    </script>
                    <!-- 게시판 끝 -->
                    <!-- 푸터 영역 추가 -->
               		<%@ include file="../common/footer.jsp" %>
                </div>
            </div>
        </div>



        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>

</body>
</html>