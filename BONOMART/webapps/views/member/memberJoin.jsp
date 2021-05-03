<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="/bono/assets/css/memberJoin.css" />
</head>
<body>
    <div id="wrap" align="center">
        
            <p id="title">
                JOIN  
            </p>
            <div id="joinArea">
                <form action="/bono/insert.me" method="post" id="joinForm">
                	<div class="inputArea">
                        <label class="text">회원번호</label>
                        <input class="form-control form-control-sm" type="number"  id="m_no" name="userNo" readonly required>
                    </div>
                    <div class="inputArea">
                        <label class="text">이름</label>
                        <input class="form-control form-control-sm" type="text" name="userName" required>
                    </div>
                    <div class="inputArea">
                        <label class="text">아이디</label>
                        <input class="form-control form-control-sm" type="text" name="userId" required>
                        <button id="idCheck" name="idCheck">중복 확인</button>
                    </div>
                    <div class="inputArea">
                        <label class="text">비밀번호  &nbsp;</label>
                        <input class="form-control form-control-sm" type="password" name="userPwd" id="userPwd" required>
                    </div>
                    <div class="inputArea">
                        <label class="text">비밀번호확인  &nbsp;</label>
                        <input class="form-control form-control-sm" type="password" name="userPwd2" id="userPwd2" required>
                        <div id="pwdCheck" class="comment">비밀번호와 일치하는지 확인해주세요.</div>
                    </div>
                    <div class="inputArea">
                        <label class="text">이메일  &nbsp;</label>
                        <input class="form-control form-control-sm" type="text" name="email" required
                                       placeholder="user@example.com">
                    </div>
                    <div class="inputArea">
                        <label class="text">연락처  &nbsp;</label>
                        <input class="form-control form-control-sm" type="text" name="phone" maxlength="13" required
                                       placeholder="010-1111-1111">
                    </div>
                    <div class="inputArea">
                        <label class="text">부서코드  &nbsp;</label>
                        <input class="form-control form-control-sm" type="text" name="dCode" >
                    </div>
                    <div class="inputArea">
                        <label class="text">직급코드  &nbsp;</label>
                        <input class="form-control form-control-sm" type="text" name="jCode" >
                    </div>
                    
                    <div class="btns" align="center">
                        <button type="reset">작성취소</button>
                        <button onclick="login();">가입하기</button>
                    </div>
                </form>


                <script>
                    $(function() {
                        $('.comment').hide();
                        $('input').keyup(function() {
                            var pwd1 = $('#userPwd').val();
                            var pwd2 = $('#userPwd2').val();

                            if ( pwd1 != null || pwd2 != null ) {
                                if ( pwd1 == pwd2 ) {
                                    $('#pwdCheck').hide();
                                } else {
                                    $('#pwdCheck').show();
                                    $('button[type=submit]').prop("disabled", true);
                                }
                            }
                        });
                    });        
                    
                    function login() {
                    	
                    	var check = confirm('회원 가입이 완료되었습니다.');
                    	
						$('#joinForm').submit();
					}
                    
                    /*
                    $('button').on("click", "button[name='noCreate']", function() {
                    	var ranNum = Math.random();
                    	$("#userNo").val(ranNum);
                    });
                    */
                    
                    // 회원 번호 생성기
                    $(document).ready(function() {
                    	var ranNum = Math.floor(Math.random() * 1000000) + 1;
                    	
                    	// 회원 번호 중복 확인
                    	/*
		    			$.ajax({
				    			url : '/bono/idcheck.me',
				    			type : 'post',
				    			data : { userNo : $('#m_no').val() },
				    			success : function( data ) {
				    				console.log(data);
				    					
				    				// 전달된 결과가 0이면 : 사용 가능
				    				// 전달된 결과가 1이면 : 사용 불가
				    					
				    				if(data == 0) {
				    					alert("사용 가능한 회원번호입니다.");
				    				} else {
				    					alert("이미 사용 중인 회원번호입니다.");
				    				}
				    			}, 
				    			error : function() {
				    				console.log("전송 실패!");
				    			}
    					});
  					  */
                    	
                    	$("#m_no").val(ranNum);
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
                    
                </script>
               
            </div>
    </div>

    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br>
    

</body>
</html>