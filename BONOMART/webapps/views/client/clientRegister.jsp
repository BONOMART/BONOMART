<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bn.jsp.client.model.vo.*, java.util.*" %>
<%
	ArrayList<Bank> bankList = (ArrayList<Bank>)request.getAttribute("bankList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>거래처 등록 페이지</title>
<button onclick=></button>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/clientRegister.css">

<style>
	tr td:first-child {
		border-right: 1px solid #dee2e6;
	}
	
	input:invalid{
		border : 2px solid red;
	}
</style>

<script>
	$(function(){
	    $.ajax({
	        url : '/bono/banklist.cl',
	        type : 'get',
	        success : function(data) {
	            for (var i in data) {
	                var innerHtml = '' ;
	
	            innerHtml = "<option value=" + data[i].b_code + "> "
	            innerHtml += data[i].b_title + "</option>"
	
	                $(".custom-select").append(innerHtml);
	            }
	        }
	    })
	})
	
	function addTable() {
            innerHtml = '';

			var numb = $('tr:last>td:first-child').text();
            var c_code = $('#c_code').val();
            var c_title = $('#c_title').val();
            var b_name = $('#b_code option:selected').text();
            var b_code = $('#b_code option:selected').val();
            var c_who = $('#c_who').val();
            var c_phone = $('#c_phone').val();
            var c_account = $('#c_account').val();
            var c_addr = $('#c_addr').val();
            
            numb = Number(numb)+1;
            console.log(numb);
            
            // 등록 후 인풋값 empty 만들기
			$('#c_code').val("");
			$('#c_title').val("");
			$('#b_code').val("은행명을 고르세요");
			$('#c_who').val("");
			$('#c_phone').val("");
			$('#c_account').val("");
			$('#c_addr').val("");
          	
            innerHtml = "<tr> <td> " + numb + "</td> "
            innerHtml += "<td>" + c_code + "</td> "
            innerHtml += " <td>" + c_title + "</td> " 
            innerHtml += " <td>" + b_name + "</td> " 
            innerHtml += " <td>" + c_who + "</td> " 
            innerHtml += " <td>" + c_phone + "</td>  "
            innerHtml += " <td>" + c_account + "</td>"
            innerHtml += " <td>" + c_addr + "</td>"
            innerHtml += "<input type='hidden' name='b_code' value='" + b_code + "'/> </tr>"

            	
            $('#inputval').append(innerHtml);

            $('#inputval tr').on('click',function(){
            	var listNum = $(this).children().eq(0).text();
            	var m_code = $(this).children().eq(1).text();
            	var m_title = $(this).children().eq(2).text();
            	var m_b_name = $(this).children().eq(3).text();
            	var m_who = $(this).children().eq(4).text();
            	var m_phone = $(this).children().eq(5).text();
            	var m_account = $(this).children().eq(6).text();
            	var m_addr = $(this).children().eq(7).text();
            	
            	$("#listNum").val(listNum);
            	$("#m_code").val(m_code);
            	$("#m_title").val(m_title);
            	$("#m_b_name option:selected").text(m_b_name);
            	$("#m_who").val(m_who);
            	$("#m_phone").val(m_phone);
            	$("#m_account").val(m_account);
            	$("#m_addr").val(m_addr);
            	
            	$("#myModal").modal();

            });
            


	}
	
    function modalComBtn(){
    	var listNum = $("#listNum").val();
        var m_code = $("#m_code").val();
        var m_title = $("#m_title").val();
        var m_b_name = $("#m_b_name option:selected").text();
        var m_b_code = $("#m_b_name option:selected").val();
        var m_who = $("#m_who").val();
        var m_phone = $("#m_phone").val();
        var m_account = $("#m_account").val();
        var m_addr = $("#m_addr").val();
        	
      	listNum = Number(listNum)-1;
      	console.log(listNum);
      	
   		$('#inputval tr').eq(listNum).children().eq(1).text(m_code);
   		$('#inputval tr').eq(listNum).children().eq(2).text(m_title);
   		$('#inputval tr').eq(listNum).children().eq(3).text(m_b_name);
   		$('#inputval tr').eq(listNum).children().eq(4).text(m_who);
   		$('#inputval tr').eq(listNum).children().eq(5).text(m_phone);
   		$('#inputval tr').eq(listNum).children().eq(6).text(m_account);
   		$('#inputval tr').eq(listNum).children().eq(7).text(m_addr);   
   		$('#inputval tr').eq(listNum).children().eq(8).val(m_b_code); 
        	
   		$('#myModal').modal('hide');
       };	
       
   	function modalDelBtn(){
   		
   		var listNum = $("#listNum").val();
   		listNum = Number(listNum)-1;
		
		$('#inputval tr').eq(listNum).remove();
   		$('#myModal').modal('hide');
   		
	};

	
	

	

			

        
</script>
</head>
<body>
<!-- 헤더 영역 추가 -->
<%@ include file="/views/common/header.jsp" %>
                <!-- 데이터 입력 -->
                <div class="wrapper">
                    <div class="container sub-contents">
                        <h3>거래처 등록</h3>
                        <!-- 거래처 등록을 위한 폼 -->
                        <div class="product_select">
                            <form action="" type="POST">
                                <div class="select">
                                
                                    <div class="item">
                                        <div>
                                            <span class="foamSpan">거래처 코드</span><div class="col-sm-8"><input type="text" class="form-control" id="c_code"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">거래처 명</span><div class="col-sm-8"><input type="text" class="form-control" id="c_title"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">은행명</span>
                                            <div class="col-sm-8">
                                            	<select class="custom-select" id="b_code">
													<option selected>은행명을 고르세요</option>
												</select>
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="item" id="ss">
                                        <div>
                                            <span class="foamSpan">담당자 명</span><div class="col-sm-8"><input type="text" class="form-control" id="c_who"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">담당자 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="c_phone" pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">계좌 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="c_account" pattern="\d{1,6}-\d{1,6}-\d{1,6}" title="형식 000-000000-00000"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="select2">
                                    	<span class="foamaddSpan">주소</span>
                                    	<div class="foamaddDiv"><input type="text" class="form-control" id="c_addr"></div>
                                </div>
                            </form>

                            <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                            <div class="submit_btn">
                                <!-- 등록버튼 -->
                                <div class="plus">
                                    <button type="button" class="btn btn-primary" onclick="addTable();">추가하기</button>
                                </div>
                            </div>
                        </div>
                        <br />

                        <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                        <div class="scrollable">
                            <table class="table table-hover text-center">

                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>거래처 코드</th>
                                        <th>거래처 명</th>
                                        <th>은행명</th>
                                        <th>담당자 명</th>
                                        <th>전화 번호</th>
                                        <th>계좌 번호</th>
                                        <th>주소</th>
                                    </tr>
                                </thead>

                                <tbody id="inputval">

                                </tbody>

                            </table>
                        </div>

                        <!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
                            <div class="submit_btn">
                                <button type="button" class="btn btn-success" data-target=".modal"
                                    data-toggle="modal">등록하기</button>
                            </div>

                            <!-- 모달창을 화면에 띄움 -->
                           
                                <!-- 등록 버튼 클릭 시, 팝업될 모달창 -->
							<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
									
										<div class="modal-header">
											<h5 class="modal-title">거래처 데이터 수정</h5>
											<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										
										<div class="modal-body">
											<div class="product_select">
												<div class="select">
												
												    <div class="item" style="width:45%">
												    	<input type="hidden" id="listNum" />
												        <div>
												            <span class="foamSpan">거래처 코드</span><div class="col-sm-8"><input type="text" class="form-control" id="m_code"></div>
												        </div>
												        <div>
												            <span class="foamSpan">거래처 명</span><div class="col-sm-8"><input type="text" class="form-control" id="m_title"></div>
												        </div>
												        <div>
												            <span class="foamSpan">은행명</span>
												            <div class="col-sm-8">
												            	<select class="custom-select" id="m_b_name">
																<option selected>은행명을 고르세요</option>
															</select>
												            </div>
												        </div> 
												    </div>
												
												    <div class="item" style="width:45%">
												        <div>
												            <span class="foamSpan">담당자 명</span><div class="col-sm-8"><input type="text" class="form-control" id="m_who"></div>
												        </div>
												        <div>
												            <span class="foamSpan">담당자 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="m_phone" pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000"></div>
												        </div>
												        <div>
												            <span class="foamSpan">계좌 번호</span><div class="col-sm-8"><input type="text" class="form-control" id="m_account" pattern="\d{1,6}-\d{1,6}-\d{1,6}" title="형식 000-000000-00000"></div>
												        </div>
												    </div>
												</div>
												
												<div class="select2">
												    	<span class="foamaddSpan">주소</span>
												    	<div class="foamaddDiv"><input type="text" class="form-control" id="m_addr"></div>
												</div>
												
											</div>
										</div>
										
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
							                    	onclick="modalComBtn()">등록</button>
							                <button type="button" class="btn btn-primary"
							                    	onclick="modalDelBtn()" style="background:red;">삭제</button>
											<button type="button" class="btn btn-secondary"
							                    	data-dismiss="modal">취소</button>
										</div>
							            	
									</div>
								</div>
							</div>
							
								
								
								
						</div> <!-- container -->
					</div> <!-- wrapper -->
					
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