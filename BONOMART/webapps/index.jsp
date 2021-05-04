<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/header.css"/>
</head>
<body>

<%@include file="views/common/header.jsp" %>
<a href="views/member/memberUpdate.jsp">수정화면</a>
<a href="views/member/memberJoin.jsp">회원가입</a>
<a href="/bono/searchOK.ad">운영자화면</a>
<a href="views/main/mainPage.jsp">메인페이지</a>
<a href="views/order/orderList.jsp">발주화면</a>
<a href="views/order/orderRegister.jsp">발주신청</a>
<a href="views/product_sale/PMpage.jsp">판매화면</a>
<a href="views/product_sale/Salepage.jsp">판매신청</a>
<a href="views/account/accountList.jsp">거래처목록</a>
<a href="views/account/accountRegister.jsp">거래처등록</a>
<a href="views/inventory/inventory.jsp">재고목록</a>
<a href="	/bono/searchLogin.ad">회원권한회수</a>

<%@include file="views/common/footer.jsp" %>
</body>
</html>