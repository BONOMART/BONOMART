<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/bono/assets/css/header.css"/>
    <link rel="stylesheet" href="/bono/assets/css/memberUpdate.css"/>
    
    <script>
        // 비밀번호 확인 script
        $(function(){
            $('input[name=newPass]').focusout(function(){
                if($('input[name=newPass]').val() != $('input[name=newPass2]').val()){
                    $('#check').text('비밀번호가 일치하지 않습니다!');
                    $('#check').css('color','red')
                    $('.pass-change').attr('type','button');
                    $('input[name=newPass2]').css('outline','none').css('box-shadow','0 0 0 2px red');

                    $('.pass-change').on('click',function(){
                        $('input[name=newPass2]').focus();
                        
                    })
                    
                } else{
                    $('#check').text('비밀번호가 일치합니다!');
                    $('#check').css('color','green')
                    $('.pass-change').attr('type','submit');

                    $('input[name=newPass2]').css('outline','none').css('box-shadow','0 0 0 2px green');
    
                    
                }
            });
            $('input[name=newPass2]').focusout(function(){
                if($('input[name=newPass]').val() != $('input[name=newPass2]').val()){
                    $('#check').text('비밀번호가 일치하지 않습니다!');
                    $('#check').css('color','red')

                    // 
                    $('input[name=newPass2]').css('outline','none').css('box-shadow','0 0 0 2px red');
                    $('.pass-change').attr('type','button');
                    $('.pass-change').on('click',function(){
                        $('input[name=newPass2]').focus();

                    })
                } else{
                    $('#check').text('비밀번호가 일치합니다!');
                    $('#check').css('color','green')
                    $('.pass-change').attr('type','submit');

                    $('input[name=newPass2]').css('outline','none').css('box-shadow','0 0 3px 2px green');
                }
            });
        })
        
        /*
        // 비밀번호 변경
        function updatePwd() {
    		$('#updatePwdForm').submit();
    		confirm('비밀번호가 변경되었습니다.');
    	}
        */
        
        // 	비밀번호 변경
        $('#updatePwd').on('click', function() {
        	
        		//var formdata = $("#updatePwdForm")
        	
        		$.ajax({
        				url : "/bono/updatePwd.me",
        				type : "post",
        				data : {userPwd : $('#newPwd').val()},
        				success : function(data) {
        					console.log(data);
        					alert("비밀번호 변경 성공");
        				},
        				error : function() {
        					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
        					console.log("전송 실패");
        				}
        				
        		});
        });
        
        // 	선택 정보 변경
        $('#updateExtra').on('click', function() {
        	
        		var jsonData = {};
        		
        		jsonData.email = $('input[name=email]').val() + $('select[name=emailSelect]');
        		jsonData.email = $('input[name=phone]').val();
        		jsonData.email = $('select[name=dcode]').val();
        		jsonData.email = $('select[name=jcode]').val();
        	
        		console.log(jsonData);
        		
        		$.ajax({
        				url : "/bono/updateExtra.me",
        				type : "post",
        				data : jsonData,
        				success : function(data) {
        					console.log(data);
        					alert("선택정보 변경 성공");
        				},
        				error : function() {
        					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
        					console.log("전송 실패");
        				}
        				
        		});
        });
        
        
     // 아이디 중복 확인
        $('#idCheck').on('click', function() {
				$.ajax({
	    				url : '/bono/idcheck.me',
	    				type : 'post',
	    				data : { userId : $('#userId').val() },
	    				success : function( data ) {
	    					console.log(data);
	    					
	    					// 전달된 결과가 0이면 : 사용 가능
	    					// 전달된 결과가 1이면 : 사용 불가
	    					
	    					if(data == 0) {
	    						alert("사용 가능한 아이디입니다.");
	    					} else {
	    						alert("이미 사용 중인 아이디입니다.");
	    					}
	    				}, 
	    				error : function() {
	    					console.log("전송 실패!");
	    				}
				})
			  })
       
		/*
        // 전화번호, 이메일, 부서, 직급 변경
        function updateExtra() {
        	$('#updateExtraForm').submit();
        	confirm('선택정보가 변경되었습니다.');
        }
     */
       
    </script>
</head>

<body>
<%@include file="/views/common/header.jsp" %>
   <!-- 여기 부터 회원정보 수정내용-->
	<% if ( m != null ) { %>
   <section class="container">
		<div class="update-contents">
            <div class="contents-inner" style="display:block;">
                <div class="page-title">
                    <h2>나의 정보 변경</h2>
                    <hr class="content-divider">
                    <br>
                    <br>
                </div>
                
                <div id="myAccount">
                    <article>
                        <div class="box-title">
                            <h3>프로필</h3>
                        </div>
                        <div class="box-content">
                            <div class="box-image">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNKq5RAjI4beZETtALZoqZFzEPoFKG89bZUA&usqp=CAU">
                            </div>
                            <div class="box-name">
                                <div>가입 이메일 : <%= m.getEmail() %></div>
                                <div>가입 아이디 : <%= m.getUserName() %></div>
                            </div>
                        </div>
                    </article>
                    <br>
                    <article>
                        <div class="box-title">
                            <h3>비밀번호 변경</h3>
                        </div>
                        <form action="/bono/updatePwd.me" method="post" id="updatePwdForm"> <!-- 비밀번호 변경 폼 내용 -->
                            <input type="hidden" name="userNo" value=""> <!-- userNo hidden값-->
                            <div class="box-content passwordUpdate">
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 현재 비밀번호 </div>
                                    <input type="password" name="curPass" class="form-input right-radius" placeholder="현재 비밀번호를 입력하세요">
                                </div>
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 새 비밀번호 </div>
                                    <input type="password" name="newPass"  id="newPwd" class="form-input right-radius" placeholder="현재 비밀번호를 입력하세요">
                                </div>
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 새 비밀번호 확인 </div>
                                    <input type="password" name="newPass2" class="form-input right-radius" placeholder="현재 비밀번호를 입력하세요">
                                    <span id="check"></span>
                                </div>
                                <div class="button-wrap">
                                    <button type="button" class="form-button pass-change"  id="updatePwd" onclick="updatePwd()">변경</button>&nbsp;
                                    <button type="reset" class="form-button">취소</button>
                                </div>
                            </div>
                        </form> <!-- 비밀번호 변경 폼 끝 -->
                    </article>
                    <br>
                    <article>
                        <form action="/bono/updateExtra.me" method="post" id="updateExtraForm"> <!-- 선택정보 변경 폼 -->
                            <input type="hidden" name="userNo"> <!-- userNo hidden값-->
                            <div class="box-title">
                                <h3>선택정보</h3>
                            </div>
                            <div class="box-content selectUpdate">
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 이메일 </div>
                                    <input type="text" name="email" class="form-input" placeholder="이메일 주소를 입력해주세요">
                                    <span class="form-span">@</span>
                                    <select name="emailSelect" class="form-select right-radius">
                                        <option value="@naver.com">naver.com</option>
                                        <option value="@google.com">google.com</option>
                                        <option value="@daum.net">daum.net</option>
                                    </select>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 연락처 </div>
                                    <input type="text" name="phone" class="form-input right-radius" placeholder="연락처를 입력하세요" pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000">
                                </div>
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 부서명</div>
                                    <select name="dcode" class="form-select right-radius">
                                        <option value="A1">인사관리팀</option>
                                        <option value="A2">재무팀</option>
                                        <option value="A3">재고관리팀</option>
                                    </select>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-div left-radius"> 직급명</div>
                                    <select name="jcode" class="form-select right-radius">
                                        <option value="J1">사원</option>
                                        <option value="J2">주임</option>
                                        <option value="J3">대리</option>
                                        <option value="J4">과장</option>
                                        <option value="J5">부장</option>
                                        <option value="J6">이사</option>
                                    </select>
                                </div>
                                <div class="button-wrap">
                                    <input type="button" value="변경" class="form-button" id = "updateExtra" onclick="updateExtra()">&nbsp;
                                    <input type="reset" value="취소" class="form-button">
                                </div>
                            </div>
                        </form> <!-- 선택정보 변경 폼 끝-->
                    </article>
                </div>
            </div>
        </div>
    </section>
	<% } %>
    
    <!-- 여기 까지-->
<%@include file="/views/common/footer.jsp" %>
</body>
</html>