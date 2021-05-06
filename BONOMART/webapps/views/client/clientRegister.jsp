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
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/clientRegister.css">

<style>
	tr td:first-child {
		border-right: 1px solid #dee2e6;
	}
</style>

<script>
	function addTable() {
		
			$.ajax({
				url : '/bono/insertCheck.cl',
				type : 'get',
				data : { 
					c_code : $('#c_code').val()
				   ,c_title : $('#c_title').val()
				   ,c_phone : $('#c_phone').val()
				   ,c_account : $('#c_account').val()
			},
				async : 'false',
				success : function( data ) {
					var msg="";
					
					for(var s in data) {
						msg+=(data[s])+" 은 이미 사용중입니다\n";	
						
					}
					if(msg!=""){
						alert(msg);
						
					} else {
			            innerHtml = '';
			        	
						var numb = $('#inputval tr:last>td:first-child').text();
			            var c_code = $('#c_code').val();
			            var c_title = $('#c_title').val();
			            var b_name = $('#bankInput').val();
			            var b_code = $('#bankCodeInput').val();
			            var c_who = $('#c_who').val();
			            var c_phone = $('#c_phone').val();
			            var c_account = $('#c_account').val();
			            var c_addr = $('#c_addr').val();
			            
			            numb = Number(numb)+1;
			            
						
						
						if(numb==""||c_code==""||c_title==""||b_code==""||c_who==""||c_phone==""||c_account==""||c_addr==""){
							alert("값을 모두 입력해 주세요");
						} else {
			          	
			            innerHtml = "<tr id='input"+numb+"'> <td>" + numb + "</td> "
			            innerHtml += "<td>" + c_code + "</td> "
			            innerHtml += " <td>" + c_title + "</td> " 
			            innerHtml += " <td>" + b_name + "</td> " 
			            innerHtml += " <td>" + c_who + "</td> " 
			            innerHtml += " <td>" + c_phone + "</td>  "
			            innerHtml += " <td>" + c_account + "</td>"
			            innerHtml += " <td>" + c_addr + "</td>"
			            innerHtml += "<input type='hidden' name='b_code' value='"+b_code+"'/> </tr>"
			
			            // 등록 후 인풋값 empty 만들기
						$('#c_code').val("");
						$('#c_title').val("");
						$('#bankInput').val("은행명을 고르세요");
						$('#c_who').val("");
						$('#c_phone').val("");
						$('#c_account').val("");
						$('#c_addr').val("");
			            
			            $('#inputval').append(innerHtml);
						}
			            
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
			            	$("#bankInputMod").val(m_b_name);
			            	$("#m_who").val(m_who);
			            	$("#m_phone").val(m_phone);
			            	$("#m_account").val(m_account);
			            	$("#m_addr").val(m_addr);
			            	
			            	$("#myModal").modal();

			            });
						
					}
					
				}
			
			});
			
	}
	
    function modalComBtn(){
    	var listNum = $("#listNum").val();
        var m_code = $("#m_code").val();
        var m_title = $("#m_title").val();
        var m_b_name = $("#bankInputMod").val();
        var m_b_code = $("#bankCodeInputMod").val();
        var m_who = $("#m_who").val();
        var m_phone = $("#m_phone").val();
        var m_account = $("#m_account").val();
        var m_addr = $("#m_addr").val();
        	
      	
      	
      	listNum = "input" + listNum;
      	
      	
   		$('#'+listNum).children().eq(1).text(m_code);
   		$('#'+listNum).children().eq(2).text(m_title);
   		$('#'+listNum).children().eq(3).text(m_b_name);
   		$('#'+listNum).children().eq(4).text(m_who);
   		$('#'+listNum).children().eq(5).text(m_phone);
   		$('#'+listNum).children().eq(6).text(m_account);
   		$('#'+listNum).children().eq(7).text(m_addr);   
   		$('#'+listNum).children().eq(8).val(m_b_code); 
        	
   		$('#myModal').modal('hide');
       };	
       
   	function modalDelBtn(){
   		
   		var listNum = $("#listNum").val();
   		listNum = "input" + listNum;
		
		$('#'+listNum).remove();
   		$('#myModal').modal('hide');
   		
	};
	
	$(function(){
		$('#bankInput').on('click',function(){
			$('#myModalBank').modal();
		});
		
		$('#myModalBank tbody tr').on('click',function(){
			$('#bankCodeInput').val($(this).children().eq(1).text());
			$('#bankInput').val($(this).children().eq(0).text());
			$('#myModalBank').modal('hide');
		});
	});
	
	$(function(){
		$('#bankInputMod').on('click',function(){
			$('#myModalBank').modal();
		})
		
		$('#myModalBank tbody tr').on('click',function(){
			$('#bankCodeInputMod').val($(this).children().eq(1).text());
			$('#bankInputMod').val($(this).children().eq(0).text());
			$('#myModalBank').modal('hide');
		});
	});
	
	function commitBtn() {
		var list=[];
		var Arraydata={};
		
		$('#inputval tr').each(function(){
			Arraydata = {
				
				"c_no" : $(this).children().eq(1).text(),
				"c_name" : $(this).children().eq(2).text(),
				"c_manager" : $(this).children().eq(4).text(),
				"c_tel" : $(this).children().eq(5).text(),
				"c_account" : $(this).children().eq(6).text(),
				"c_address" : $(this).children().eq(7).text(),
				"b_code" : $(this).children().eq(8).val()
				
			}
			list.push(Arraydata);
			
		});
		
		$.ajax({
			url : '/bono/insert.cl',
			type : 'POST',
			data : { name : JSON.stringify(list) },
			async : 'false',
			success : function( data ) {
				location.href="/bono/selectlist.cl"
				
			}
		
		});
		
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
                            <!-- <form action="/bono/insertCheck.cl" type="get"> -->
                                <div class="select">
                                    <div class="item">
                                    	<input type="hidden" id="insertCheckInput" value="0"/>
                                        <div>
                                            <span class="foamSpan">거래처 코드</span><div class="col-sm-8"><input type="text" class="form-control" id="c_code"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">거래처 명</span><div class="col-sm-8"><input type="text" class="form-control" id="c_title"></div>
                                        </div>
                                        <div>
                                            <span class="foamSpan">은행명</span>
                                            <div class="col-sm-8" >
                                            	<input type="text" class="form-control" id="bankInput" value="은행명을 고르세요"/>
                                            	<input type="hidden" name="" id="bankCodeInput"/>
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


                            <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                            <div class="submit_btn">
                                <!-- 등록버튼 -->
                                <div class="plus">
                                    <button type="submit" class="btn btn-primary" onclick="addTable();">추가하기</button>
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
                                <button type="button" class="btn btn-success" onclick="commitBtn()">등록하기</button>
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
                                            				<div class="col-sm-8" >
                                            					<input type="text" class="form-control" id="bankInputMod" value="은행명을 골라주세요"/>
                                            					<input type="hidden" name="" id="bankCodeInputMod"/>
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
							                    	onclick="modalComBtn()">수정</button>
							                <button type="button" class="btn btn-primary"
							                    	onclick="modalDelBtn()" style="background:red;">삭제</button>
											<button type="button" class="btn btn-secondary"
							                    	data-dismiss="modal">취소</button>
										</div>
							            	
									</div>
								</div>
							</div>
							<!-- 은행 고르기 모달창 -->
							<div class="modal" tabindex="-1" id="myModalBank">
  								<div class="modal-dialog">
    								<div class="modal-content">
									
										<div class="modal-header">
											<h5 class="modal-title">은행 선택</h5>
											<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										
										<div class="modal-body" id="modal_bank">
											<table class="table table-hover text-center">
											
												<thead>
													<tr>
														<th>은행명</th>
														<th>은행 코드</th>
                                    				</tr>
                                				</thead>

                                				<tbody>
													<% for(Bank b : bankList) {%>
													<tr>
														<td><%=b.getB_title() %></td>
														<td><%=b.getB_code() %></td>
													</tr>
													<%} %>
                                				</tbody>

                            				</table>

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