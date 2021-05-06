<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/bono/assets/css/header.css"/>
<link rel="stylesheet" href="/bono/assets/css/memberDetail.css"/>


</head>
<body>

	<%@include file="/views/common/header.jsp" %>
   <!-- 여기 부터 회원정보 수정내용-->
   <section class="container">
		<div class="update-contents">
            <div class="contents-inner" style="display:block;">
                <div class="page-title">
                    <h2>내 정보 조회</h2>
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
                            <div class="box-name" style="align:center">
                            	<div>회원 번호 : <%= m.getUserNo() %></div> <br/>
                                <div>이름 : <%= m.getUserName() %></div> <br/>
                                <div>아이디 : <%= m.getUserId() %></div> <br/>
                                <div>이메일 : <%= m.getEmail() %></div>	<br/>
                                <div>연락처 : <%= m.getPhone() %></div>	<br/>
                                <div>부서 코드 : <%= m.getdCode() %></div><br/>
                                <div>직급 코드 : <%= m.getjCode() %></div>	<br/>
                            </div>
                            <br><br>
                            <div class="button-wrap">
                            <button type="button" class="form-button pass-change"  id="goUpdateInfo" onclick="goUpdate()">정보 변경</button>&nbsp;
                        	<button type="button" class="form-button pass-change"  onclick="logout();">로그아웃</button>
                            </div>
                        </div>
                        <br>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <!-- 여기 까지-->
<%@include file="/views/common/footer.jsp" %>\

<script>
		function goUpdate() {
			location.href = "/bono/views/member/memberUpdate.jsp";
		}

		function logout() {
			// 로그아웃 버튼을 누르면
			// 웹페이지 주소를 /jdbc/logout.do로 바꾸라는 의미.
			
			var result = confirm("정말 로그아웃 하시겠습니까?\n로그아웃 시, 로그인 화면으로 이동 됩니다.");
			
			if(result == true)
				location.href = '/bono/logout.me';
		}
		
</script>

</body>
</html>