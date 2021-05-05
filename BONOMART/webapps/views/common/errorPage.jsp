<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<%
	String msg = (String) request.getAttribute("error-msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<link rel="stylesheet" href="/bono/assets/css/header.css" />
<link rel="stylesheet" href="/bono/assets/css/footer.css" />
<style>
	section {
		width: 600px;
		padding: 20px;
		background: white;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10%;
		margin-bottom: 30%;
	}
	
	
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<section class="border border-primary">
		<h1>서비스 에러 발생</h1>
		<h3 style="color:red;">ERROR :: <%= msg %></h3>
		<p>
			서비스 수행 중 에러가 발생하였습니다. <br />
			해당 페이지가 계속 보인다면, 담당자에게 문의하세요. <br />
			<br />
		</p>
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>