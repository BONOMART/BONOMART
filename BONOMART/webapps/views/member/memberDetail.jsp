<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="/bono/assets/css/memberJoin.css" />
</head>
<body>

	<%@include file="/views/common/header.jsp" %>
   <!-- 여기 부터 회원정보 수정내용-->
	<% if ( m != null ) { %>
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
                            <div class="box-name">
                            	<div>회원 번호 : <%= m.getUserNo() %></div> <br/>
                                <div>이름 : <%= m.getUserName() %></div> <br/>
                                <div>아이디 : <%= m.getUserId() %></div> <br/>
                                <div>이메일 : <%= m.getEmail() %></div>	<br/>
                                <div>연락처 : <%= m.getPhone() %></div>	<br/>
                                <div>부서 코드 : <%= m.getdCode() %></div>	<br/>
                                <div>직급 코드 : <%= m.getjCode() %></div>	<br/>
                                <div>접근 권한 : <%= m.getAuthority() %></div>	<br/>
                                <div>승인 여부 : <%= m.getJoinAccess() %></div>	
                            </div>
                        </div>
                        <br>
                        <button type="button" class="form-button pass-change"  id="goUpdateInfo" onclick="goUpdate()">정보 변경</button>&nbsp;
                    </article>
                </div>
            </div>
        </div>
    </section>
	<% } %>
    <!-- 여기 까지-->
<%@include file="/views/common/footer.jsp" %>

<script>
		function goUpdate() {
			location.href = "/bono/views/member/memberUpdate.jsp";
		}
</script>

</body>
</html>